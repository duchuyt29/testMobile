import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation.dart';

import '../../../../../base/base_controller.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/services/user_info_service.dart';
import '../../../../../shared/utils/dialog_util.dart';

class ConversationSearchController extends BaseController {
  final searchController = TextEditingController();
  Timer? _searchOnStoppedTyping;
  String _searchText = '';

  final refreshController = RefreshController();
  final conversations = RxList(<Conversation>[]);
  final isLoading = RxnBool();
  final isMore = RxBool(true);
  int _page = 0;

  @override
  Future<void> onInit() async {
    await super.onInit();

    // await _callGetConversations();
  }

  /* Action */
  void onBack() {
    Get.back();
  }

  void onChangedSearh(String value) {
    if (_searchText == value) {
      return;
    }
    _searchText = value;
    _searchOnStoppedTyping?.cancel();
    _searchOnStoppedTyping = Timer(const Duration(seconds: 1), onRefresh);
  }

  void onSubmittedSearh(String value) {
    if (_searchText == value) {
      return;
    }
    _searchText = value;
    _searchOnStoppedTyping?.cancel();
    _searchOnStoppedTyping = null;

    onRefresh();
  }

  Future<void> onConversation(Conversation conversation) async {
    await Get.offAndToNamed(SicixRoutes.CHAT, arguments: conversation);
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

  Future<void> _callGetConversations() async {
    await sicixUIRepository
        .searchConversation(_searchText, _page, CommonConstants.defaultSize,
            CommonConstants.sortDesc)
        .then((response) async {
      if (response.success) {
        final conversations = response.data?.content ?? [];
        await _loadUserIfNeed(conversations);
        _updateRefreshController();
        this.conversations.addAll(conversations);
        isMore.value = response.data!.isMore();
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
