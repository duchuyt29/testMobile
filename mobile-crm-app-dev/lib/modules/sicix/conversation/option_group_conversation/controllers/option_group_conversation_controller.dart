import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_api/sicix_api/models/attachment/attachment_item.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation_theme.dart';
import 'package:ui_api/sicix_api/models/chat/message_attach_file/message_attach_file.dart';
import 'package:ui_api/sicix_api/models/chat/message_pin/message_pin.dart';
import 'package:ui_api/sicix_api/models/media_file/media_file.dart';
import 'package:ui_api/sicix_api/request/avatar_request.dart';
import 'package:ui_api/sicix_api/request/name_request.dart';
import 'package:ui_api/sicix_api/request/upload_file_request.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/app_data_global.dart';
import '../../../../../../shared/constants/arguments.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/services/user_info_service.dart';
import '../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../shared/widgets/bottom_sheet/widget_rename_reminder.dart';
import '../../../../../../shared/widgets/dialog/widget_view_user_profile.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../routes/sicix_pages.dart';

class OptionGroupConversationController extends BaseController {
  late Conversation conversation;
  late RxList<MessagePin> messagePinGroups;
  late RxList<MessagePin> messagePinPrivates;

  final nameConversation = RxString('');
  final avatarConversation = RxString('');

  final memberCount = RxInt(0);

  final isTurnOffNotify = RxBool(false);
  final isShowNotify = RxBool(false);
  Timer? _timerShowNotify;

  final isAttachFileLoading = RxBool(true);
  final medias = RxList<MediaFile>.empty();

  OptionGroupConversationController();

  @override
  Future<void> onInit() async {
    conversation = Get.arguments[CONVERSATION_ARGUMENT];
    messagePinGroups = Get.arguments[PIN_GROUP_ARGUMENT];
    messagePinPrivates = Get.arguments[PIN_PRIVATE_ARGUMENT];
    await super.onInit();

    nameConversation.value = conversation.getName();
    avatarConversation.value = conversation.getAvatar();
    isTurnOffNotify.value = conversation.notice == 0;

    await _searchUserInConversation();

    await _getAttachFile();
  }

  /* Action */

  Future<void> onChangeAvatar() async {
    await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) async {
      if (value != null) {
        await _callUploadFile(File(value.path));
      }
    });
  }

  Future<void> onRenameGroup({String? name, String error = ''}) async {
    await BottomSheetUtil.createBottomSheet(
      title: 'chat.option.rename.group'.tr,
      child: WidgetRenameReminder(
        caption: 'chat.option.rename.group.cap'.tr,
        name: name ?? nameConversation.value,
        error: error,
        onSaveRenameReminder: _callRenameReminder,
      ),
    );
  }

  Future<void> onAddMember() async {
    await Get.toNamed(SicixRoutes.ADD_MEMBER_GROUP_CONVERSATION,
            arguments: conversation)
        ?.then((value) {
      if (value is bool && value) {
        _searchUserInConversation();
      }
    });
  }

  void onPersonalInfo() => _callUserProfile(conversation.partner);

  void onHideNotify() => isShowNotify.value = false;

  void onSettingNotify() => _callUpdateNotification();

  Future<void> onPined() async {
    await Get.toNamed(SicixRoutes.PINED_CONVERSATION, arguments: {
      CONVERSATION_ARGUMENT: conversation,
      PIN_GROUP_ARGUMENT: messagePinGroups,
      PIN_PRIVATE_ARGUMENT: messagePinPrivates,
    })?.then((value) {
      messagePinGroups.refresh();
      messagePinPrivates.refresh();
      if (value != null && value is MessagePin) {
        Get.back(result: value);
      }
    });
  }

  Future<void> onMedia() async {
    await Get.toNamed(SicixRoutes.CHAT_MEDIA, arguments: conversation);
  }

  Future<void> onViewMember() async {
    conversation.memberCount = memberCount.value;
    await Get.toNamed(SicixRoutes.MEMBER_CONVERSATION, arguments: conversation)
        ?.then((value) {
      // if (value != null && value is int) {
      //   memberCount.value = value;
      // }
      memberCount.value = conversation.memberCount;
    });
  }

  Future<void> onLeave() async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'chat.group.leave.title'.tr,
      confirmTitle: 'chat.group.leave.button'.tr,
      onConfirm: () async {
        await _callLeaveConversation();
      },
    );
  }

  Future<void> onChangeBackground() async {
    await BottomSheetUtil.createBottomSheet(
      title: 'chat.option.change.background.title'.tr,
      child: Column(
        children: [
          Divider(height: 0.5, color: AppColor.primaryBorderColor),
          Container(
            height: Get.width,
            margin: const EdgeInsets.only(top: 12),
            child: GridView.builder(
              itemCount: ConversationTheme.conversationThemes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.back();
                    _changeBackground(
                        ConversationTheme.conversationThemes[index]);
                  },
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: FCoreImage(
                      ConversationTheme.conversationThemes[index]
                          .getBackground(),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  /* Function */

  void _changeBackground(ConversationTheme theme) {
    Get.back(result: theme);
  }

  /* API */

  Future<void> _callUserProfile(String? partner) async {
    if (partner == null || partner.isEmpty) {
      return;
    }

    await EasyLoading.show();
    final userInfo = await UserInfoService.getUserProfileHCMFromId(
      partner,
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
    // if (conversation.partner?.isEmpty ?? true) {
    //   return;
    // }
    // sicixUIRepository
    //     .getProfile(conversation.partner!, AppDataGlobal.cid)
    //     .then((response) async {
    //   if (response.success && response.data != null) {
    //     await WidgetViewUserProfile.showUserProfile(response.data!);
    //   } else {
    //     await DialogUtil.createDialogMessage(
    //         title: 'notify.title'.tr,
    //         message: response.message ?? 'notify.error'.tr);
    //   }
    // }).catchError((onError) {
    //   DialogUtil.createDialogMessage(
    //       title: 'notify.title'.tr, message: 'notify.error'.tr);
    // });
  }

  Future<void> _callUpdateNotification() async {
    //  isTurnOffNotify.value = !isTurnOffNotify.value;
    // isShowNotify.value = true;
    // _timerShowNotify?.cancel();
    // _timerShowNotify =
    //     Timer(const Duration(seconds: 3), () => isShowNotify.value = false);
    final notice = conversation.notice == 1 ? 0 : 1;
    await EasyLoading.show();
    await sicixUIRepository
        .updateNotification(conversation.id ?? -1, notice)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        conversation.notice = notice;
        isTurnOffNotify.value = conversation.notice == 0;
        isTurnOffNotify.refresh();
        isShowNotify.value = true;
        _timerShowNotify?.cancel();
        _timerShowNotify =
            Timer(const Duration(seconds: 3), () => isShowNotify.value = false);
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

  Future<void> _callRenameReminder(String name) async {
    if (name == nameConversation.value) {
      return;
    }
    await EasyLoading.show();
    await sicixUIRepository
        .changeConversationName(conversation.id ?? -1, NameRequest(name))
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        conversation.name = name;
        nameConversation.value = name;
      } else {
        await onRenameGroup(
            name: name, error: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callLeaveConversation() async {
    await EasyLoading.show();
    await sicixUIRepository
        .leaveConversation(conversation.id ?? -1)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        Get.until((route) => route.settings.name == SicixRoutes.MASTER);
      } else {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
        );
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _getAttachFile() async {
    await sicixUIRepository
        .getAttachFile(
            conversation.id ?? -1, MessageAttachFile.ATTACH_MEDIA, 0, 5)
        .then((response) async {
      isAttachFileLoading.value = false;
      if (response.success) {
        medias.value = (response.data?.content ?? [])
            .mapMany((item) => item.getContents())
            .toList();
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: response.message!);
      }
    }).catchError((onError) {
      isAttachFileLoading.value = false;
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callUploadFile(File file) async {
    if (conversation.id == null) {
      return;
    }
    await EasyLoading.show();
    await sicixUIRepository.uploadFile([file],
        UploadFileRequest.groupAvatar(conversation.id!)).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        if (response.data?.isNotEmpty ?? false) {
          await _callUpdateAvatar(response.data!.first);
        }
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: response.message!);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callUpdateAvatar(AttachmentItem attachmentItem) async {
    await EasyLoading.show();
    await sicixUIRepository
        .changeConversationAvatar(
            conversation.id!, AvatarRequest(attachmentItem.file?.id))
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        conversation.avatar = attachmentItem.file?.id?.toString();
        avatarConversation.value = conversation.getAvatar();
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

  Future _searchUserInConversation() async {
    await sicixUIRepository
        .searchUserInConversation(
            conversation.id ?? -1, '', 0, CommonConstants.defaultSize)
        .then((response) async {
      if (response.success) {
        memberCount.value = response.data?.total ?? 0;
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      printError(info: onError.toString());
    });
  }
}
