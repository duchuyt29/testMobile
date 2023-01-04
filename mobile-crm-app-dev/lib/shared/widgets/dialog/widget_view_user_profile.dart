import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/auth/user_info.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation.dart';
import 'package:ui_api/sicix_api/repository/sicix_ui_repository.dart';
import 'package:ui_api/sicix_api/request/create_conversation_request.dart';

import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../../routes/sicix_pages.dart';
import '../../constants/colors.dart';
import '../../constants/common.dart';
import '../../styles/text_style/text_style.dart';
import '../../utils/date_util.dart';
import '../../utils/dialog_util.dart';
import '../button/widget_button.dart';
import '../image_widget/fcore_image.dart';
import '../widget_avatar.dart';

class WidgetViewUserProfile {
  static Future<void> showUserProfile(UserInfo userInfo,
      {bool isMessage = false}) async {
    await showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: WidgetViewUserProfileTitle(userInfo),
          contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          content: WidgetViewUserProfileContent(userInfo),
        );
      },
    ).then((value) {
      if (value != null && value is Conversation) {
        Get.offNamedUntil(SicixRoutes.CHAT,
            (route) => route.settings.name == SicixRoutes.MASTER,
            arguments: value);
        // Get.offNamedUntil(Routes.CHAT, preventDuplicates: false, arguments: value);
      }
    });
    // .then((value) {
    //   if (value != null && value && onMessagePressed != null) {
    //     onMessagePressed();
    //   }
    // });
  }
}

class WidgetViewUserProfileTitle extends StatelessWidget {
  final UserInfo userInfo;

  WidgetViewUserProfileTitle(this.userInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 140,
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 48),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              image: DecorationImage(
                image: AssetImage(ImageConstants.bgUser),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: 27,
          child: Align(
            alignment: Alignment.topCenter,
            child: WidgetAvatar(
              size: 100.0,
              avatar: userInfo.getAvatar(),
              name: userInfo.getName(),
            ),
          ),
        ),
      ],
    );
  }
}

class WidgetViewUserProfileContent extends StatefulWidget {
  final UserInfo userInfo;

  WidgetViewUserProfileContent(this.userInfo, {Key? key}) : super(key: key);

  @override
  State<WidgetViewUserProfileContent> createState() =>
      _WidgetViewUserProfileContentState();
}

class _WidgetViewUserProfileContentState
    extends State<WidgetViewUserProfileContent> {
  final _sicixUIRepository = Get.find<SicixUIRepository>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildFullnameInput(),
          _buildUsernameInfo(),
          _buildPhoneAndBirthdayInput(),
          _buildEmailInfo(),
          Row(
            children: [
              AppDataGlobal.userInfo?.id == widget.userInfo.id
                  ? Container()
                  : Expanded(
                      child: WidgetButton(
                        title: 'chat'.tr,
                        // onPressed: () => Navigator.pop(context, true),
                        onPressed: () async {
                          final conversation = await _callCreateConversation();
                          if (conversation != null) {
                            Navigator.pop(context, conversation);
                            // await Get.offAndToNamed(Routes.CHAT,
                            //     arguments: conversation);
                          }
                        },
                      ),
                    ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 55,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'close'.tr,
                      style: AppTextStyle.heavy(
                        color: AppColor.primaryButtonColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFullnameInput() {
    return _buildContent(
      title: 'account.change_profile.name'.tr,
      hint: 'account.change_profile.hint_name'.tr,
      value: widget.userInfo.getName(),
    );
  }

  Widget _buildUsernameInfo() {
    return _buildContent(
      title: 'account.change_profile.username'.tr,
      hint: 'account.change_profile.hint_username'.tr,
      value: widget.userInfo.username ?? '',
    );
  }

  Widget _buildEmailInfo() {
    return _buildContent(
      title: 'account.change_profile.email'.tr,
      hint: 'account.change_profile.hint_email'.tr,
      value: widget.userInfo.getEmail(),
    );
  }

  Widget _buildPhoneAndBirthdayInput() {
    return Row(
      children: [
        Expanded(
          child: _buildContent(
            title: 'account.change_profile.phone_number'.tr,
            hint: 'account.change_profile.hint_phone'.tr,
            value: widget.userInfo.getPhone(),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildContent(
            title: 'account.change_profile.birthday'.tr,
            hint: 'account.change_profile.hint_birthday'.tr,
            value:
                DateUtil.formatDatetimeToString(widget.userInfo.getBirthday()),
            suffixIcon:
                FCoreImage(IconConstants.iconDate, width: 20, height: 20),
          ),
        ),
      ],
    );
  }

  Widget _buildContent({
    required String value,
    required title,
    required String hint,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            title,
            style: AppTextStyle.heavy(fontSize: 16, color: AppColor.neutral1),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: value,
          style: AppTextStyle.heavy(fontSize: 16),
          readOnly: true,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            errorStyle: const TextStyle(height: 0),
            suffixIcon: suffixIcon == null
                ? null
                : Container(
                    alignment: Alignment.centerLeft,
                    child: suffixIcon,
                  ),
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 20, maxWidth: 30),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  /* API */
  Future<Conversation?> _callCreateConversation() async {
    final request = CreateConversationRequest.fromPrivate(widget.userInfo);
    await EasyLoading.show();
    return _sicixUIRepository
        .createConversation(request)
        .then((response) async {
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
    return _sicixUIRepository
        .getConversations(0, 1, CommonConstants.sortDesc, conversationId: id)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success && (response.data?.content.isNotEmpty ?? false)) {
        return response.data?.content.first;
      } else if (!response.success && (response.message?.isNotEmpty ?? false)) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: response.message!);
      }
      return null;
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
      return null;
    });
  }
}
