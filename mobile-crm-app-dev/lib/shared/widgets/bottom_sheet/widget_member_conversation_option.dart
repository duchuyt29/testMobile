import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/auth/user_conversation.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class WidgetMemberConversationOption extends StatelessWidget {
  final UserConversation userConversation;
  final Function() onViewInfo;
  final Function() onChatPersonal;
  final Function() onUpdateAdmin;
  final Function() onRemoveFromConversation;

  const WidgetMemberConversationOption(
    this.userConversation, {
    Key? key,
    required this.onViewInfo,
    required this.onChatPersonal,
    required this.onUpdateAdmin,
    required this.onRemoveFromConversation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Divider(height: 0.5, color: AppColor.primaryBorderColor),
          _buildViewInfo(),
          _buildChatPresonal(),
          _buildUpdateAdmin(),
          _buildRemoveFromGroup(),
        ],
      ),
    );
  }

  Widget _buildViewInfo() {
    return InkWell(
      onTap: () {
        Get.back();
        onViewInfo();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            FCoreImage(IconConstants.icUser, width: 24, height: 24),
            const SizedBox(width: 10),
            Text(
              'member.conversation.view.info'.tr,
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatPresonal() {
    return InkWell(
      onTap: () {
        Get.back();
        onChatPersonal();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            FCoreImage(IconConstants.icChat, width: 24, height: 24),
            const SizedBox(width: 10),
            Text(
              'member.conversation.chat'.tr,
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateAdmin() {
    return InkWell(
      onTap: () {
        Get.back();
        onUpdateAdmin();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Icon(
              userConversation.isAdmin()
                  ? Icons.remove_moderator_outlined
                  : Icons.add_moderator_outlined,
              size: 24,
              color: userConversation.isAdmin()
                  ? AppColor.errorColor
                  : AppColor.primaryButtonColor,
            ),
            const SizedBox(width: 10),
            Text(
              userConversation.isAdmin()
                  ? 'member.conversation.remove.admin'.tr
                  : 'member.conversation.make.admin'.tr,
              style: AppTextStyle.regular(
                color: userConversation.isAdmin()
                    ? AppColor.errorColor
                    : AppColor.primaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemoveFromGroup() {
    return InkWell(
      onTap: () {
        Get.back();
        onRemoveFromConversation();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            FCoreImage(IconConstants.icDelete, width: 24, height: 24),
            const SizedBox(width: 10),
            Text(
              'member.conversation.delete'.tr,
              style: AppTextStyle.regular(color: AppColor.errorColor),
            ),
          ],
        ),
      ),
    );
  }
}
