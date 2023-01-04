import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/utils/dialog_util.dart';

class NotificationSettingController extends BaseController {
  final searchController = TextEditingController();
  Timer? _searchOnStoppedTyping;
  String _searchText = '';

  final refreshController = RefreshController();
  final conversations = RxList<Conversation>.empty();
  final isLoading = RxBool(true);
  final isMore = RxBool(true);
  int _page = 0;

  @override
  Future<void> onInit() async {
    await super.onInit();

    await _callGetConversations();
  }

  @override
  void onClose() {
    searchController.dispose();
    refreshController.dispose();
    super.onClose();
  }

  /* Action */
  void onSave() {
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

  void onAllNotificaiton() {
    for (final conversation in conversations) {
      conversation.notice = 1;
    }
    conversations.refresh();
    _callUpdateAllNotification(1);
  }

  void offAllNotificaiton() {
    for (final conversation in conversations) {
      conversation.notice = 0;
    }
    conversations.refresh();
    _callUpdateAllNotification(0);
  }

  void onChangeNotify(int index, bool value) {
    conversations[index].notice = value ? 1 : 0;
    if (conversations[index].id != null) {
      _callUpdateNotification(conversations[index].id!, value ? 1 : 0);
    }
    conversations.refresh();
  }

  /* Function */

  void onRefresh() {
    isLoading.value = true;
    _page = 0;
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

  /* API */

  Future<void> _callGetConversations() async {
    await sicixUIRepository
        .searchConversation(_searchText, _page, 10, CommonConstants.sortDesc)
        .then((response) async {
      if (response.success) {
        _updateRefreshController();
        conversations.addAll(response.data?.content ?? []);
        isMore.value = response.data?.isMore() ?? false;
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
    });
  }

  Future<void> _callUpdateNotification(int conversationId, int notice) async {
    await sicixUIRepository
        .updateNotification(conversationId, notice)
        .then((response) async {
      if (response.success) {
      } else {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError(
      (onError) {
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      },
    );
  }

  Future<void> _callUpdateAllNotification(int notice) async {
    await sicixUIRepository
        .updateAllNotification(notice)
        .then((response) async {
      if (response.success) {
      } else {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError(
      (onError) {
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      },
    );
  }
}
