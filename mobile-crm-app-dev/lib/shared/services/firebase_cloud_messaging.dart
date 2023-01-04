import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/notification/notification_data.dart';

import '../../../modules/sicix/conversation/chat/controllers/chat_controller.dart';
import '../../../modules/sicix/conversation/conversations/controllers/conversations_controller.dart';
import '../../../modules/sicix/home/home/controllers/home_controller.dart';
import '../../../modules/sicix/home/post_detail/controller/post_detail_controller.dart';
import '../../../modules/sicix/master/controllers/master_controller.dart';
import '../../data/app_data_global.dart';
import '../../routes/sicix_pages.dart';
import '../constants/evens.dart';
import '../utils/dialog_util.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

/// https://firebase.flutter.dev/docs/messaging/usage/
class FirebaseMessageConfig {
  static final FirebaseMessageConfig _singleton =
      FirebaseMessageConfig._internal();

  factory FirebaseMessageConfig() {
    return _singleton;
  }
  FirebaseMessageConfig._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidNotificationChannel _androidNotificationChannel =
      const AndroidNotificationChannel(
    'sicix_high_importance_channel',
    'High Importance Notifications',
    importance: Importance.max,
    enableLights: true,
    enableVibration: true,
    playSound: true,
    showBadge: true,
  );

  Future<void> initFirebaseMessageConfig() async {
    await _initFirebaseMessaging();
    await _initLocalNotification();
  }

  Future<void> _initFirebaseMessaging() async {
    try {
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );
      await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: true,
        provisional: true,
        sound: true,
      );

      // Hiển thị notification khi bật app cho ios
      if (Platform.isIOS) {
        await _firebaseMessaging.setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
      }
      await _firebaseMessaging.setAutoInitEnabled(true);

      await _handleTokenFirebase();
    } catch (e) {
      printError(info: '$e');
    }
  }

  Future<void> _initLocalNotification() async {
    try {
      const initialzationSettingsAndroid =
          AndroidInitializationSettings('app_icon');
      final initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        defaultPresentAlert: true,
        defaultPresentBadge: true,
        defaultPresentSound: true,
        onDidReceiveLocalNotification:
            (int? id, String? title, String? body, String? payload) async {
          if (payload?.isNotEmpty ?? false) {
            /// ['id']: Key json chứa ID của thông báo server trả về.
            /// Dùng để điều hướng vào màn chi tiết thông báo
            /// Mặc định đang là ['id']
            // Navigator.of(AppConfig.navigatorKey.currentContext).pushNamed(
            //   DetailNotificationScreen.routeName,
            //   arguments: int.tryParse(
            //     json.decode(payload)['id']?.toString(),
            //   ),
            // );
          }
        },
      );

      final initializationSettings = InitializationSettings(
        android: initialzationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );
      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: _onSelectNotifcation,
      );

      if (Platform.isIOS) {
        await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(alert: true, badge: true, sound: true);
      } else if (Platform.isAndroid) {
        await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.createNotificationChannel(_androidNotificationChannel);
      }
    } catch (e) {
      printError(info: '$e');
    }
  }

  Future<void> handleMessage(
      {required Function(NotificationData) onInitialMessage}) async {
    try {
      /// Lấy tất cả thông báo khiến ứng dụng mở từ terminated state
      /// Một khi lấy ra thông báo để điều hướng, nó sẽ bị remove
      /// Tương tác với thông báo khi ứng dụng đang ở terminated
      ///
      /// Android init sẽ vào đây
      final initialMessage = await _firebaseMessaging.getInitialMessage();
      if (initialMessage != null && initialMessage.data.isNotEmpty) {
        onInitialMessage(NotificationData.fromJson(initialMessage.data));
      }

      /// Khi đang mở ứng dụng, thông báo Firebase sẽ vào hàm onMessage
      /// Android sẽ block toàn bộ thông báo đẩy, cần cấu hình thêm thư viện
      /// flutter_local_notifications để hiển thị thông báo cũng như tương tác
      /// thông báo
      /// IOS cần call hàm setForegroundNotificationPresentationOptions để nhận
      /// thông báo khi đang mở ứng dụng
      FirebaseMessaging.onMessage.listen(showNotification);

      /// Tương tác với thông báo khi ứng dụng đang ở background và khi đang
      /// khóa màn hình
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        DialogUtil.createDialogMessage(
            message: 'onMessageOpenedApp ${message.data.toString()}');
        printInfo(info: 'onMessageOpenedApp: ${message.data.toString()}');
        if (message.data.isNotEmpty) {
          _onMessage(NotificationData.fromJson(message.data));
        }
      });
    } catch (e) {
      printError(info: '$e');
    }
  }

  void showNotification(RemoteMessage message) {
    // printInfo(info: 'Got a message whilst in the foreground!');
    // printInfo(info: 'Message data: ${message.data}');

    try {
      // printInfo(info: 'FirebaseMessageConfig RemoteMessage $message');
      final remoteNotification = message.notification;
      final android = message.notification?.android;

      if (remoteNotification != null && android != null) {
        _flutterLocalNotificationsPlugin.show(
          remoteNotification.hashCode,
          remoteNotification.title,
          remoteNotification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidNotificationChannel.id,
              _androidNotificationChannel.name,
              importance: Importance.high,
              visibility: NotificationVisibility.public,
              priority: Priority.high,
              playSound: true,
              enableLights: true,
              enableVibration: true,
            ),
            iOS: const IOSNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
              subtitle: '',
            ),
          ),
          payload: json.encode(message.data),
        );
      }
    } catch (e) {
      printError(info: 'FirebaseMessageConfig $e');
    }
  }

  Future<void> _onSelectNotifcation(String? payload) async {
    printInfo(info: 'ONTAP NOTIFICATION: $payload');
    if (payload != null && payload.isNotEmpty) {
      final data = jsonDecode(payload) as Map<String, dynamic>?;
      if (data == null || data.isEmpty) {
        return;
      }
      await _onMessage(NotificationData.fromJson(data));
    }
  }

  Future<void> _onMessage(NotificationData data) async {
    if (AppDataGlobal.accessToken.isEmpty) {
      return;
    }
    switch (data.event) {
      case CHAT_LIST_EVENT:
        Get.until((route) => Get.currentRoute == SicixRoutes.MASTER);
        final masterController = Get.find<MasterController>();
        if (masterController.selectedIndex.value != 1) {
          await masterController.onItemTapped(1);
        }
        break;
      case CHAT_CONVERSATION_EVENT:
        final ids = data.params ?? [];
        if (ids.isEmpty) {
          return;
        }
        if (Get.currentRoute == SicixRoutes.CHAT) {
          final chatController = Get.find<ChatController>();
          if (chatController.conversation.id == int.tryParse(ids.first)) {
            return;
          }
        }

        Get.until((route) => Get.currentRoute == SicixRoutes.MASTER);
        final masterController = Get.find<MasterController>();
        if (masterController.selectedIndex.value != 1) {
          await masterController.onItemTapped(1);
        }

        final conversationsController =
            masterController.pages[1].controller as ConversationsController;
        await conversationsController
            .onConversationById(int.tryParse(ids.first));
        break;
      case NOTIFICATION_LIST_EVENT:
      case NOTIFICATION_DETAIL_EVENT:
        Get.until((route) => Get.currentRoute == SicixRoutes.MASTER);
        final masterController = Get.find<MasterController>();
        if (masterController.selectedIndex.value != 2) {
          await masterController.onItemTapped(2);
        }
        break;
      case COMM_LIST_EVENT:
        Get.until((route) => Get.currentRoute == SicixRoutes.MASTER);
        final masterController = Get.find<MasterController>();
        if (masterController.selectedIndex.value != 0) {
          await masterController.onItemTapped(0);
        }
        break;
      case COMM_FEED_EVENT:
        final ids = data.params ?? [];
        if (ids.isEmpty) {
          return;
        }
        final id = ids.first;
        if (Get.currentRoute == SicixRoutes.POST_DETAIL) {
          final postDetailController = Get.find<PostDetailController>();
          if (postDetailController.postContent.task?.id == int.tryParse(id)) {
            return;
          }
        }
        Get.until((route) => Get.currentRoute == SicixRoutes.MASTER);
        final masterController = Get.find<MasterController>();
        if (masterController.selectedIndex.value != 0) {
          await masterController.onItemTapped(0);
        }

        final homeController =
            masterController.pages[0].controller as HomeController;
        await homeController.onPostDetailById(int.tryParse(id));
        break;
      case MAINTENANCE_EVENT:
        break;
      case COMMON_EVENT:
        break;
      default:
    }
  }

  Future<void> resetDeviceToken() async {
    await _firebaseMessaging.deleteToken();
  }

  Future<void> _handleTokenFirebase() async {
    await _firebaseMessaging.getToken().then((String? token) async {
      printInfo(info: 'FIREBASE TOKEN: $token');
      if (token != null) {
        AppDataGlobal.firebaseToken = token;
        // await AppDataGlobal.client?.addDevice(token, PushProvider.firebase);
      }
    });
    _firebaseMessaging.onTokenRefresh.listen((token) {
      printInfo(info: 'TOKEN FIREBASE CHANGE: $token');

      AppDataGlobal.firebaseToken = token;
    });
  }
}
