import 'dart:async';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation.dart';
import 'package:ui_api/sicix_api/models/chat/message_data/message_item.dart';
import 'package:ui_api/sicix_api/models/media_file/media_file.dart';
import 'package:ui_api/sicix_api/request/forward_request.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/utils/dialog_util.dart';

class ForwardMessageController extends BaseController {
  final MessageItem forwardMessage;
  MediaFile? forwardMediaFile;

  final noteMessageController = TextEditingController();

  final searchController = TextEditingController();
  Timer? _searchOnStoppedTyping;
  String _searchText = '';

  final refreshController = RefreshController();
  final conversations = RxList<Conversation>.empty();
  final isLoading = RxnBool();
  final isMore = RxBool(true);
  int _page = 0;

  final conversationSelecteds = RxList<Conversation>.empty();

  ForwardMessageController(this.forwardMessage) {
    forwardMediaFile = forwardMessage.firstMediaFile();
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    await _callGetConversations();
  }

  /* Action */

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
    _searchOnStoppedTyping?.cancel();
    _searchText = value;
    onRefresh();
  }

  Future onSend() async {
    if (conversationSelecteds.isEmpty) {
      return;
    }

    await EasyLoading.show();
    var isFailure = false;
    await Future.forEach(conversationSelecteds,
        (Conversation conversation) async {
      final isSuccess =
          await _forwardMessage(conversation, noteMessageController.text);
      if (!isSuccess) {
        await EasyLoading.dismiss();
        isFailure = true;
        return;
      }
    });
    await EasyLoading.dismiss();
    if (!isFailure) {
      await DialogUtil.createDialogMessage(
        message: 'chat.forward.success'.tr,
        onPressed: Get.back,
      );
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

  void onConversation(Conversation conversation) {
    final selectedIndex = conversationSelecteds
        .indexWhere((element) => element.id == conversation.id);
    if (selectedIndex == -1) {
      conversationSelecteds.add(conversation);
    } else {
      conversationSelecteds.removeAt(selectedIndex);
    }
  }

  /* API */

  Future<void> _callGetConversations() async {
    await sicixUIRepository
        .searchConversation(_searchText, _page, CommonConstants.defaultSize,
            CommonConstants.sortDesc)
        .then((response) async {
      if (response.success) {
        _updateRefreshController();
        conversations.addAll(response.data?.content ?? []);
        isMore.value = response.data!.isMore();
      } else {
        _updateRefreshController(isError: true);
        if (response.message?.isNotEmpty ?? false) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: response.message!);
        }
      }
      isLoading.value = false;
    }).catchError(
      (onError) {
        _updateRefreshController(isError: true);
        isLoading.value = false;
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      },
    );
  }

  Future<bool> _forwardMessage(Conversation conversation, String note) async {
    final request = ForwardRequest('conversation', conversation.id ?? -1, note);
    return sicixUIRepository
        .forwardMessage(forwardMessage.id ?? '', request)
        .then((response) async {
      if (response.success) {
        return true;
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: response.message!);
      }
      return false;
    }).catchError((onError) {
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
      return false;
    });
  }
}
