import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/sicix_api/models/auth/user_conversation.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation.dart';
import 'package:ui_api/sicix_api/request/create_conversation_request.dart';
import 'package:ui_api/sicix_api/request/user_by_id_request.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../data/app_data_global.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/services/user_info_service.dart';
import '../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../shared/utils/dialog_util.dart';
import '../../../../../shared/widgets/bottom_sheet/widget_member_conversation_option.dart';
import '../../../../../shared/widgets/dialog/widget_view_user_profile.dart';

class MemberConversationController extends BaseController {
  final Conversation conversation;

  final searchController = TextEditingController();
  Timer? _searchOnStoppedTyping;
  String _searchText = '';

  final refreshController = RefreshController();
  final userConversations = RxList<UserConversation>.empty();
  final isLoading = RxBool(true);
  final isMore = RxBool(true);
  int _page = 0;

  MemberConversationController(this.conversation);

  @override
  Future<void> onInit() async {
    await super.onInit();

    await _callSearchUserInfos();
  }

  @override
  void onClose() {
    searchController.dispose();
    refreshController.dispose();
    super.onClose();
  }

  /* Action */
  Future<void> addMember() async {
    await Get.toNamed(SicixRoutes.ADD_MEMBER_GROUP_CONVERSATION,
            arguments: conversation)
        ?.then((value) {
      if (value is bool && value) {
        onRefresh();
      }
    });
  }

  void onSubmittedSearh(String value) {
    if (_searchText == value) {
      return;
    }
    _searchText = value;
    _searchOnStoppedTyping?.cancel();
    _searchOnStoppedTyping = Timer(const Duration(seconds: 1), onRefresh);
  }

  Future<void> onSelectionMember(UserConversation userConversation) async {
    if (userConversation.id == AppDataGlobal.userConfig?.id) {
      return;
    }
    if (conversation.role == Conversation.ROLE_ADMIN) {
      await BottomSheetUtil.createBottomSheet(
        title: userConversation.getName(),
        child: WidgetMemberConversationOption(
          userConversation,
          onViewInfo: () {
            _callUserProfile(userConversation.id);
          },
          onChatPersonal: () async {
            final conversation =
                await _callCreateConversation(userConversation);
            if (conversation != null) {
              await Get.offNamedUntil(SicixRoutes.CHAT,
                  (route) => route.settings.name == SicixRoutes.MASTER,
                  arguments: conversation);
            }
          },
          onUpdateAdmin: () async {
            final isUpdate = await _callUpdateAdmin(userConversation);
            if (isUpdate) {
              userConversation.role = userConversation.isAdmin()
                  ? Conversation.ROLE_MEMBER
                  : Conversation.ROLE_ADMIN;
              userConversations.refresh();
            }
          },
          onRemoveFromConversation: () async {
            await DialogUtil.createDialogConfirm(
              title: 'member.conversation.delete'.tr,
              message: 'member.conversation.delete.caption'
                  .trArgs([userConversation.getName()]),
              confirmTitle: 'confirm'.tr,
              onConfirm: () async {
                final isRemove = await _callRemoveUser(userConversation);
                if (isRemove) {
                  userConversations.removeWhere(
                      (element) => element.id == userConversation.id);
                  userConversations.refresh();
                }
              },
            );
          },
        ),
      );
    } else {
      _callUserProfile(userConversation.id);
    }
  }

  /* Function */

  void onRefresh() {
    isLoading.value = true;
    _page = 0;
    isMore.value = true;
    userConversations.clear();

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

  Future _callSearchUserInfos() async {
    await sicixUIRepository
        .searchUserInConversation(conversation.id ?? -1, _searchText, _page,
            CommonConstants.defaultSize)
        .then((response) async {
      if (response.success) {
        conversation.memberCount =
            response.data?.total ?? conversation.memberCount;
        final users = response.data?.content ?? [];

        await _callGetUserChat(users);
        _updateRefreshController();
        userConversations.addAll(users);
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

  Future _callGetUserChat(List<UserConversation> users) async {
    await sicixUIRepository
        .getUserByIds(
            UserByIdRequest(users: users.map((e) => e.id ?? '').toList()))
        .then((response) async {
      if (response.success) {
        response.data.forEach((element) {
          users.firstWhere((user) => user.id == element.id).userInfo = element;
          UserInfoService.chatUserContacts[element.id ?? ''] =
              element.getChatUser();
        });
        return response.data;
      } else if (response.message?.isNotEmpty ?? false) {
        printError(info: response.message ?? '');
      }
    }).catchError((onError) {
      printError(info: onError.toString());
    });
  }

  Future<void> _callUserProfile(String? userId) async {
    if (userId == null || userId.isEmpty) {
      return;
    }

    await EasyLoading.show();
    final userInfo = await UserInfoService.getUserProfileHCMFromId(
      userId,
      isCache: false,
      onError: (message) {
        printError(info: message);
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: message);
      },
      onMappingError: (message) {
        printError(info: message);
      },
    );
    await EasyLoading.dismiss();
    if (userInfo != null) {
      await WidgetViewUserProfile.showUserProfile(userInfo);
    }
    // sicixUIRepository
    //     .getProfile(userId, AppDataGlobal.cid)
    //     .then((response) async {
    //   if (response.success && response.data != null) {
    //     await WidgetViewUserProfile.showUserProfile(response.data!);
    //   } else if (!response.success && response.message != null) {
    //     await DialogUtil.createDialogMessage(
    //         title: response.message,
    //         message: response.message ?? 'notify.error'.tr);
    //   }
    // }).catchError((onError) {
    //   DialogUtil.createDialogMessage(
    //       title: 'notify.title'.tr, message: 'notify.error'.tr);
    // });
  }

  Future<Conversation?> _callCreateConversation(
      UserConversation userConversation) async {
    final request =
        CreateConversationRequest.fromPrivateUserConversation(userConversation);
    await EasyLoading.show();
    return sicixUIRepository.createConversation(request).then((response) async {
      if (response.success && response.data != null) {
        return _callGetConversations(response.data?.id);
      } else {
        await EasyLoading.dismiss();
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
        return null;
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
      return null;
    });
  }

  Future<Conversation?> _callGetConversations(int? id) async {
    return sicixUIRepository
        .getConversations(0, 1, CommonConstants.sortDesc, conversationId: id)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success && (response.data?.content.isNotEmpty ?? false)) {
        return response.data?.content.first;
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: response.message!);
        return null;
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
      return null;
    });
  }

  Future<bool> _callUpdateAdmin(UserConversation userConversation) async {
    return sicixUIRepository.updateRuleUserInGroup(conversation.id ?? -1, {
      userConversation.id ?? '': userConversation.isAdmin()
          ? Conversation.ROLE_MEMBER
          : Conversation.ROLE_ADMIN
    }).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        return true;
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: response.message!);
      }
      return false;
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
      return false;
    });
  }

  Future<bool> _callRemoveUser(UserConversation userConversation) async {
    return sicixUIRepository
        .deleteUserInGroup(conversation.id ?? -1, userConversation.id ?? '')
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        return true;
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: response.message!);
      }
      return false;
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
      return false;
    });
  }
}
