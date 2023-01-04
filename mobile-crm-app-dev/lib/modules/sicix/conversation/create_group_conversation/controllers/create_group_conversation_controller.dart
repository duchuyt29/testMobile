import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/sicix_api/models/auth/user_info.dart';
import 'package:ui_api/sicix_api/request/create_conversation_request.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../data/app_data_global.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/utils/dialog_util.dart';
import '../../../../../shared/utils/focus.dart';
import '../../../../../shared/utils/image_picker_util.dart';

class CreateGroupConversationController extends BaseController {
  final groupNameController = TextEditingController();

  final searchController = TextEditingController();
  Timer? _searchOnStoppedTyping;
  String _searchText = '';

  final refreshController = RefreshController();
  final userInfos = RxList<UserInfo>.empty();
  final userSelecteds = RxList<UserInfo>.empty();
  final isLoading = RxBool(true);
  final isMore = RxBool(true);
  int _page = 0;

  final groupAvatar = Rxn<XFile>();

  @override
  Future<void> onInit() async {
    await super.onInit();

    await _callSearchUserInfos();
  }

  @override
  void onClose() {
    searchController.dispose();
    refreshController.dispose();
    groupNameController.dispose();
    super.onClose();
  }

  /* Action */
  void onCreate() {
    AppFocus.unFocus();

    if (groupNameController.text.isEmpty) {
      EasyLoading.showToast('messenger.create.group.name.empty'.tr);
      return;
    }

    if (userSelecteds.isEmpty) {
      EasyLoading.showToast('messenger.create.group.empty'.tr);
      return;
    }

    final request = CreateConversationRequest.fromGroup(
        userSelecteds, groupNameController.text);
    _callCreateConversation(request);
  }

  Future onSelectGroupAvatar() async {
    try {
      final source = await ImagePickerUtil.showImageSource(Get.context!);
      if (source == null) {
        return;
      }

      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      }

      groupAvatar.value = image;
    } on PlatformException catch (e) {
      printError(info: e.toString());
    }
  }

  void onSubmittedSearh(String value) {
    if (_searchText == value) {
      return;
    }
    _searchText = value;
    _searchOnStoppedTyping?.cancel();
    _searchOnStoppedTyping = Timer(const Duration(seconds: 1), onRefresh);
  }

  Future<void> onSelectUser(UserInfo user) async {
    final userSelected =
        userSelecteds.firstWhereOrNull((element) => element.id == user.id);
    if (userSelected != null) {
      userSelecteds.remove(userSelected);
    } else {
      userSelecteds.add(user);
    }
  }

  void onDeselectUser(UserInfo user) {
    final userSelected =
        userSelecteds.firstWhereOrNull((element) => element.id == user.id);
    if (userSelected != null) {
      userSelecteds.remove(userSelected);
    }
  }

  /* Function */

  void onRefresh() {
    isLoading.value = true;
    _page = 0;
    isMore.value = true;
    userInfos.clear();

    _callSearchUserInfos();
  }

  void onLoading() {
    if (!isMore.value) {
      return;
    }
    _page++;
    _callSearchUserInfos();
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

  Future<void> _callSearchUserInfos() async {
    await sicixUIRepository
        .searchUserInfos(_searchText, AppDataGlobal.userConfig?.id ?? '',
            CommonConstants.sortName, _page, CommonConstants.defaultSize)
        .then((response) async {
      if (response.success) {
        _updateRefreshController();
        userInfos.addAll(response.data?.content ?? []);
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
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callCreateConversation(
      CreateConversationRequest request) async {
    await EasyLoading.show();
    await sicixUIRepository.createConversation(request).then((response) async {
      if (response.success && response.data != null) {
        await _callGetConversations(response.data?.id);
      } else {
        await EasyLoading.dismiss();
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callGetConversations(int? id) async {
    await sicixUIRepository
        .getConversations(0, 1, CommonConstants.sortDesc, conversationId: id)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success && (response.data?.content.isNotEmpty ?? false)) {
        Get.back(result: response.data!.content.first);
      } else {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }
}
