import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/sicix_api/models/auth/user_info.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation.dart';
import 'package:ui_api/sicix_api/models/chat/message_data/message_item.dart';
import 'package:ui_api/sicix_api/request/search_chat_request.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/services/user_info_service.dart';
import '../../../../../shared/utils/date_util.dart';
import '../../../../../shared/utils/dialog_util.dart';

class ChatSearchController extends BaseController {
  final Conversation conversation;

  final searchController = TextEditingController();
  Timer? _searchOnStoppedTyping;
  String _searchText = '';

  final refreshController = RefreshController();
  final messagesFound = RxList(<MessageItem>[]);
  final isLoading = RxnBool();
  final isMore = RxBool(true);
  int _page = 0;

  ChatSearchController(this.conversation);

  @override
  Future<void> onInit() async {
    await super.onInit();

    // await _callGetConversations();
  }

  /* Action */
  void onBack() {
    Get.back();
  }

  void onSubmittedSearh(String value) {
    if (_searchText == value) {
      return;
    }
    _searchText = value;
    _searchOnStoppedTyping?.cancel();
    _searchOnStoppedTyping = Timer(const Duration(seconds: 1), onRefresh);
  }

  Future<void> onMessage(MessageItem message) async {
    Get.back(result: message);
  }

  /* Function */

  void onRefresh() {
    _page = 0;
    isLoading.value = true;
    isMore.value = true;
    messagesFound.clear();

    _callSearchMessages();
  }

  void onLoading() {
    if (!isMore.value) {
      return;
    }
    _page++;
    _callSearchMessages();
  }

  void _updateRefreshController({bool isError = false}) {
    if (isLoading.value == null) {
      return;
    }
    if (isLoading.value!) {
      isError
          ? refreshController.refreshFailed()
          : refreshController.refreshCompleted();
    } else {
      isError
          ? refreshController.loadFailed()
          : refreshController.loadComplete();
    }
  }

  /* API */

  Future<void> _callSearchMessages() async {
    await sicixUIRepository
        .searchMessage(
            conversation.id ?? -1,
            DateUtil.formatDatetimeToString(conversation.modifiedDate,
                type: DateUtil.API_TYPE),
            SearchChatRequest(search: _searchText),
            page: _page,
            size: CommonConstants.defaultSize)
        .then((response) async {
      if (response.success) {
        final messateItems = (response.data?.payload?.content ?? []).reversed;
        await Future.forEach(messateItems, (MessageItem messateItem) async {
          // await _getUserForMessage(message);
          if (messateItem.createBy != null) {
            final user = await _loadUser(messateItem.createBy!);
            if (user != null) {
              messateItem.user = user.getChatUser();
            }
          }
        });
        _updateRefreshController();
        messagesFound.addAll(messateItems);
        isMore.value = response.data?.payload?.isMore() ?? false;
      } else {
        _updateRefreshController(isError: true);
        if (response.message?.isNotEmpty ?? false) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: response.message!);
        }
      }
      isLoading.value = false;
    }).catchError((onError) {
      isLoading.value = false;
      printError(info: onError.toString());
      // DialogUtil.createDialogMessage(
      //     title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<UserInfo?> _loadUser(String userId) async {
    return UserInfoService.getUserProfileHCMFromId(userId, onError: (message) {
      printError(info: message);
    }, onMappingError: (message) {
      printError(info: message);
    });
  }
}
