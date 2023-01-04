import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;
import 'package:web_socket_channel/io.dart';

import '../../../../base/base_controller.dart';
import '../../../../shared/constants/evens.dart';
import '../../../../shared/services/path_service.dart';
import '../../account/account/views/account_page.dart';
import '../../conversation/conversations/controllers/conversations_controller.dart';
import '../../conversation/conversations/views/conversations_page.dart';
import '../../home/home/controllers/home_controller.dart';
import '../../home/home/views/home_page.dart';
import '../../microservices/views/microservices_screen.dart';
import '../../notification/notification/controllers/notification_controller.dart';
import '../../notification/notification/views/notification_page.dart';

class MasterController extends BaseController {
  // static Map<String, dynamic>? dataNotification;
  static bool isFirstOpen = true;

  final RxInt selectedIndex = RxInt(0);

  final badgeNotification = RxInt(0);
  final badgeConversation = RxInt(0);

  IOWebSocketChannel? webSocketChannel;

  final List<GetView> pages = [
    HomePage(),
    ConversationsPage(),
    NotificationPage(),
    AccountPage(),
    const MicroservicePage()
  ];

  @override
  Future<void> onInit() async {
    await super.onInit();

    _initWebsocket();

    await _getNotifications();

    await unreadConversation();

    await firebaseMessageConfig.handleMessage(onInitialMessage: (data) {
      if (!isFirstOpen) {
        return;
      }
      switch (data.event) {
        case CHAT_LIST_EVENT: // Mở list chat
          if (selectedIndex.value != 1) {
            onItemTapped(1);
          }
          break;
        case CHAT_CONVERSATION_EVENT: // Mở chi tiết hội thoại
          final ids = data.params ?? [];
          if (ids.isEmpty) {
            return;
          }
          if (selectedIndex.value != 1) {
            onItemTapped(1);
          }
          final conversationsController =
              pages[1].controller as ConversationsController;
          conversationsController.onConversationById(int.tryParse(ids.first));
          break;
        case NOTIFICATION_LIST_EVENT: // Danh sách thông báo
        case NOTIFICATION_DETAIL_EVENT: // Chi tiết một thông báo
          if (selectedIndex.value != 2) {
            onItemTapped(2);
          }
          break;
        case COMM_LIST_EVENT: // Trang truyền thông
          if (selectedIndex.value != 0) {
            onItemTapped(0);
          }
          break;
        case COMM_FEED_EVENT: // Chi tiết 1 bài viết
          final ids = data.params ?? [];
          if (ids.isEmpty) {
            return;
          }
          if (selectedIndex.value != 0) {
            onItemTapped(0);
          }
          final homeController = pages[0].controller as HomeController;
          homeController.onPostDetailById(int.tryParse(ids.first));
          break;
        case MAINTENANCE_EVENT: // Thông báo bảo trì
          break;
        case COMMON_EVENT: // Bản tin thông thường, ko action
          break;
        default:
      }
    });

    isFirstOpen = false;
  }

  @override
  void onClose() {
    webSocketChannel?.sink.close();
    super.onClose();
  }

  @override
  void refresh() {
    super.refresh();

    _initWebsocket();
  }

  /* Action */

  Future<void> onItemTapped(int index) async {
    if (selectedIndex.value == index) {
      return;
    }
    selectedIndex.value = index;
    final pageController = pages[index].controller as GetxController;

    pageController.update();

    if (pageController is NotificationController) {
      pageController.onRefresh();
    }
  }

  /* Function */

  void _initWebsocket() {
    try {
      printInfo(info: 'init webSocketChannel');
      if (webSocketChannel != null) {
        webSocketChannel?.sink.close();
      }
      webSocketChannel = IOWebSocketChannel.connect(
        Uri.parse(PathService.chatPath()),
        pingInterval: const Duration(seconds: 10),
      );
      webSocketChannel?.stream.listen(
        (message) {
          printInfo(info: 'stream listener ${message.toString()}');
          _processMessageWS(message.toString());
        },
        onError: (error) => printError(info: error),
        onDone: () => printInfo(info: 'onDone webSocketChannel'),
      );
    } catch (e) {
      printError(info: e.toString());
    }
  }

  void _processMessageWS(String message) {
    if (message.contains('"cmd":"ping"')) {
      return;
    }
    final messageJson = jsonDecode(message.toString());
    if (messageJson['cmd'] == 'notice') {
      // "subject": "Đăng bài viết mới",
      // "content": "<p>SiciX Mobile1233 đã thêm 1 bài viết mới&nbsp;123123</p>",
      final subject = messageJson['payload']?['subject'] ?? 'notify.title'.tr;
      final content = messageJson['payload']?['content'] ?? '';
      if (content.isNotEmpty) {
        firebaseMessageConfig.showNotification(
          RemoteMessage(
            notification: RemoteNotification(
              android: const AndroidNotification(),
              title: subject,
              body: parse(content).body?.text ?? content,
            ),
          ),
        );
      }

      final notificationPage = pages[selectedIndex.value];
      if (notificationPage is NotificationPage) {
        notificationPage.controller.onRefresh();
      } else {
        _getNotifications();
      }
      // if (pages[2].controller is NotificationController) {
      //   pages[2].controller._refreshPage();
      // } else {
      //   _getNotifications();
      // }
    } else {
      unreadConversation();
      final conversationsPage = pages[1] as ConversationsPage;
      conversationsPage.controller.updateConversation(message);
      // if (selectedIndex.value == 1 &&
      //     pages[1].controller is ConversationsController) {
      //   pages[1].controller.updateConversation(message);
      // }
    }
  }

  String getBadgeNotification() {
    if (badgeNotification <= 0) {
      return '';
    } else if (badgeNotification <= 5) {
      return '$badgeNotification ';
    } else {
      return '5+';
    }
  }

  String getBadgeConversation() {
    if (badgeConversation <= 0) {
      return '';
    } else if (badgeConversation <= 5) {
      return ' $badgeConversation ';
    } else {
      return '5+';
    }
  }

  /* API */

  Future<void> _getNotifications() async {
    await sicixUIRepository
        .getNotifications(0, 1, 'createDate,desc')
        .then((response) {
      if (response.success) {
        badgeNotification.value = response.data?.unread ?? 0;
      }
    }).catchError((onError) {
      printError(info: onError.toString());
    });
  }

  Future<void> unreadConversation() async {
    await sicixUIRepository.unread().then((response) {
      if (response.success) {
        badgeConversation.value = response.data?.total ?? 0;
      }
    }).catchError((onError) {
      printError(info: onError.toString());
    });
  }
}
