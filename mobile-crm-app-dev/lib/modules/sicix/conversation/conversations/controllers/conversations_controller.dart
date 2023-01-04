import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation.dart';
import 'package:ui_api/sicix_api/repository/sicix_ui_repository.dart';

import '../../../../../data/app_data_global.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/models/type_model.dart';
import '../../../../../shared/services/user_info_service.dart';
import '../../../../../shared/utils/dialog_util.dart';
import '../../../master/controllers/master_controller.dart';

class ConversationsController extends GetxController {
  static const int MENU_ALL = 0;
  static const int MENU_UNREAD = 1;

  final MasterController masterController;
  final _sicixUIRepository = Get.find<SicixUIRepository>();
  final refreshController = RefreshController();

  final companySelected = Rxn(AppDataGlobal.userConfig?.getLastCompany());

  // IOWebSocketChannel? webSocketChannel;

  final menuTopIndex = RxInt(MENU_ALL);
  final menuMessengerItems = TypeModel.menuMessengerItems;

  final conversations = RxList(<Conversation>[]);
  final isLoading = RxBool(true);
  final isMore = RxBool(true);
  int _page = 0;

  ConversationsController(this.masterController);

  @override
  void onInit() {
    super.onInit();
    _callGetConversations();

    // _initWebsocket();
  }

  // @override
  // void onClose() {
  //   webSocketChannel?.sink.close();
  //   // refreshController.dispose();
  //   super.onClose();
  // }

  @override
  void refresh() {
    super.refresh();

    final company = AppDataGlobal.userConfig?.getLastCompany();
    if (companySelected.value?.id != company?.id) {
      companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
      onRefresh();
    }

    // _initWebsocket();
  }

  /* Action */

  Future<void> onChangeCompany() async {
    await Get.toNamed(SicixRoutes.CHOOSE_COMPANY)?.then((value) {
      if (value is bool && value) {
        companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
        onRefresh();
      }
    });
  }

  Future<void> onSelectionMenu(int menuIndex) async {
    menuTopIndex.value = menuIndex;
  }

  Future<void> onSearch() async {
    await Get.toNamed(SicixRoutes.CONVERSATION_SEARCH)
        ?.then((_) => _reloadConversation());
  }

  Future<void> onMenu(int item) async {
    switch (item) {
      case TypeModel.MENU_CREATE_PERSONAL:
        await Get.toNamed(SicixRoutes.CREATE_PERSONAL_CONVERSATION)
            ?.then((value) {
          if (value is Conversation) {
            final conversation = conversations.firstWhereOrNull(
                (conversation) => conversation.id == value.id);
            if (conversation == null) {
              conversations.insert(0, value);
            }
            Get.toNamed(SicixRoutes.CHAT, arguments: value)
                ?.then((_) => _reloadConversation());
          }
        });
        break;
      case TypeModel.MENU_CREATE_GROUP:
        await Get.toNamed(SicixRoutes.CREATE_GROUP_CONVERSATION)?.then((value) {
          if (value is Conversation) {
            final conversation = conversations.firstWhereOrNull(
                (conversation) => conversation.id == value.id);
            if (conversation == null) {
              conversations.insert(0, value);
            }
            Get.toNamed(SicixRoutes.CHAT, arguments: value)
                ?.then((_) => _reloadConversation());
          }
        });
        break;
      case TypeModel.MENU_NOTIFY_SETTING:
        await Get.toNamed(SicixRoutes.NOTIFICATION_SETTING)
            ?.then((value) => onRefresh());
        break;
    }
  }

  Future<void> onConversation(Conversation conversation) async {
    await Get.toNamed(SicixRoutes.CHAT, arguments: conversation)
        ?.then((_) => _reloadConversation());
  }

  Future<void> onConversationById(int? id) async {
    if (id == null) {
      return;
    }
    var conversation =
        conversations.firstWhereOrNull((element) => element.id == id);
    if (conversation != null) {
      await Get.toNamed(SicixRoutes.CHAT, arguments: conversation)
          ?.then((_) => _reloadConversation());
    } else {
      conversation = await _callGetConversationsById(id);
      if (conversation != null) {
        await Get.toNamed(SicixRoutes.CHAT, arguments: conversation)
            ?.then((_) => _reloadConversation());
      }
    }
  }

  /* Function */

  void onRefresh() {
    _page = 0;
    isLoading.value = true;
    isMore.value = true;
    conversations.clear();

    _callGetConversations();
  }

  void onLoading() {
    if (!isMore.value) {
      return;
    }
    _page++;
    _callGetConversations();
  }

  void _updateRefreshController({bool isError = false}) {
    if (isLoading.value) {
      isError
          ? refreshController.refreshFailed()
          : refreshController.refreshCompleted();
    } else {
      isError
          ? refreshController.loadFailed()
          : refreshController.loadComplete();
    }
  }

  Future<bool> _reloadConversation() async {
    await masterController.unreadConversation();
    if (conversations.isEmpty) {
      await _callGetConversations();
    } else {
      await _callRefreshConversations();
    }
    return true;
  }

  Future updateConversation(String message) async {
    printInfo(info: 'recive message ${isLoading.value} $message');
    if (isLoading.value) {
      Future.delayed(const Duration(milliseconds: 100), () {
        updateConversation(message); // shows 0 length
      });
      return;
    }
    try {
      final messageJson = jsonDecode(message) as Map<String, dynamic>;

      final conversationId = messageJson['convId'] as int?;
      if (conversationId == null) {
        return;
      }

      final indexConversation =
          conversations.indexWhere((element) => element.id == conversationId);

      if (indexConversation != -1) {
        final conversation = conversations[indexConversation];
        if (indexConversation == 0) {
          conversation.updateFromMessageWS(messageJson, true);
          conversations.refresh();
        } else {
          conversations.removeAt(indexConversation);
          conversations.refresh();
          conversation.updateFromMessageWS(messageJson, true);
          conversations.insert(0, conversation);
          conversations.refresh();
        }
      } else {
        final conversation = await _callFirstConversation(conversationId);
        if (conversation != null) {
          conversation.updateFromMessageWS(messageJson, false);
          conversations.insert(0, conversation);
        }
      }
    } catch (e) {
      printInfo(info: 'load messages: ${e.toString()}');
    }
  }

  /* API */

  Future<void> _callGetConversations() async {
    await _sicixUIRepository
        .getConversations(
            _page, CommonConstants.defaultSize, CommonConstants.sortDesc)
        .then((response) async {
      if (response.success) {
        _updateRefreshController();
        isMore.value = response.data?.isMore() ?? true;
        final conversations = response.data?.content ?? [];
        await _loadUserIfNeed(conversations);
        this.conversations.addAll(conversations);
      } else {
        _updateRefreshController(isError: true);
        if (response.message?.isNotEmpty ?? false) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: response.message!);
        }
      }
      isLoading.value = false;
    }).catchError((onError) {
      _updateRefreshController(isError: true);
      isLoading.value = false;
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<Conversation?> _callGetConversationsById(int id) async {
    return _sicixUIRepository
        .getConversations(
            _page, CommonConstants.defaultSize, CommonConstants.sortDesc,
            conversationId: id)
        .then((response) async {
      if (response.success) {
        return response.data?.content.first;
      } else {
        return null;
      }
    }).catchError((onError) {
      return null;
    });
  }

  Future<void> _callRefreshConversations() async {
    await _sicixUIRepository
        .getConversations(0, conversations.length, CommonConstants.sortDesc)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success && response.data != null) {
        final conversations = response.data!.content;
        await _loadUserIfNeed(conversations);
        this.conversations.clear();
        this.conversations.addAll(conversations);
      } else {
        printError(
            info: 'Refresh conversations error: ${response.message ?? ''}');
      }
    }).catchError(
      (onError) {
        printError(info: 'Refresh conversations error: ${onError.toString()}');
      },
    );
  }

  Future<Conversation?> _callFirstConversation(int conversationId) async {
    return _sicixUIRepository
        .getConversations(0, 5, CommonConstants.sortDesc)
        .then((response) async {
      if (response.success && (response.data?.content.isNotEmpty ?? false)) {
        final conversations = response.data!.content;
        await _loadUserIfNeed(conversations);
        return conversations
            .firstWhereOrNull((element) => element.id == conversationId);
      } else {
        return null;
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      return null;
    });
  }

  Future _loadUserIfNeed(List<Conversation> conversations) async {
    await Future.forEach(conversations, (Conversation conversation) async {
      if (conversation.isPrivateChat()) {
        final userId = conversation.partner;
        if (userId == null) {
          return;
        }
        final user = await UserInfoService.getUserProfileHCMFromId(userId,
            onError: (message) {
          printError(info: message);
        }, onMappingError: (message) {
          printError(info: message);
        });
        if (user != null) {
          conversation.userInfo = user;
        }
      }
    });
  }
}
