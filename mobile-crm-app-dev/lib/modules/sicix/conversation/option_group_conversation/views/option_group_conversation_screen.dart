import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_loading.dart';
import '../../../../../shared/widgets/widget_preview_media.dart';
import '../controllers/option_group_conversation_controller.dart';

class OptionGroupConversationScreen
    extends GetView<OptionGroupConversationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondBackgroundColor,
      appBar: AppBar(
        title: Text(
          'chat.option'.tr,
          style: AppTextStyle.heavy(
            color: AppColor.secondTextColor,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _buildBodyContent(),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildNotify(),
        _buildAvatar(),
        _buildName(),
        _buildFunction(),
        const Divider(height: 4, thickness: 4),
        _buildPined(),
        const Divider(height: 4, thickness: 4),
        _buildMedia(),
        const Divider(height: 4, thickness: 4),
        _buildViewMember(),
        const Divider(height: 4, thickness: 4),
        // _buildDelete(),
        _buildLeave(),
      ],
    );
  }

  Widget _buildNotify() {
    return Obx(
      () {
        if (controller.isShowNotify.value) {
          return Container(
            margin: const EdgeInsets.only(left: 24, top: 20, right: 24),
            padding: const EdgeInsets.fromLTRB(24, 4, 8, 4),
            decoration: BoxDecoration(
              color: AppColor.thirdBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                FCoreImage(
                  IconConstants.icNotify,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    controller.isTurnOffNotify.value
                        ? 'chat.option.turn.off'.tr
                        : 'chat.option.turn.on'.tr,
                    style: AppTextStyle.regular(
                        color: AppColor.eightTextColorLight),
                  ),
                ),
                IconButton(
                  onPressed: controller.onHideNotify,
                  icon: Icon(
                    Icons.clear_rounded,
                    size: 18,
                    color: AppColor.eightTextColorLight,
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildAvatar() {
    if (controller.conversation.isAdmin()) {
      return Stack(
        children: [
          Obx(
            () => Container(
              margin: const EdgeInsets.only(top: 24, bottom: 10, right: 2),
              child: WidgetAvatar(
                size: 106,
                border: 3,
                isUrl: true,
                avatar: controller.avatarConversation.value,
                name: controller.nameConversation.value,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              onPressed: controller.onChangeAvatar,
              icon: FCoreImage(
                IconConstants.icCamera1,
                width: 32,
                height: 32,
              ),
            ),
          )
        ],
      );
    }
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(top: 24, bottom: 10, right: 2),
        child: WidgetAvatar(
          size: 106,
          border: 3,
          isUrl: true,
          avatar: controller.avatarConversation.value,
          name: controller.nameConversation.value,
        ),
      ),
    );
  }

  Widget _buildName() {
    if (controller.conversation.isAdmin()) {
      return Container(
        margin: const EdgeInsets.fromLTRB(24, 6, 24, 0),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: Get.width - 100),
              child: Obx(
                () => Text(
                  controller.nameConversation.value,
                  style: AppTextStyle.heavy(fontSize: 20),
                ),
              ),
            ),
            IconButton(
              onPressed: () => controller.onRenameGroup(),
              icon: FCoreImage(
                IconConstants.icEdit1,
                width: 20,
                height: 20,
              ),
            )
          ],
        ),
      );
    }
    return Obx(
      () => Container(
        margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        child: Text(
          controller.nameConversation.value,
          style: AppTextStyle.heavy(fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildFunction() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFunctionButton(
            'chat.option.add.member'.tr,
            IconConstants.iAddMember,
            onPressed: controller.onAddMember,
          ),
          controller.conversation.isAdmin()
              ? _buildFunctionButton(
                  'chat.option.change.background'.tr,
                  IconConstants.icBackground,
                  onPressed: controller.onChangeBackground,
                )
              : Container(),
          Obx(
            () => _buildFunctionButton(
              controller.isTurnOffNotify.value
                  ? 'chat.option.on.notify'.tr
                  : 'chat.option.off.notify'.tr,
              controller.isTurnOffNotify.value
                  ? IconConstants.icNotifyOn1
                  : IconConstants.icNotifyOff2,
              onPressed: controller.onSettingNotify,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFunctionButton(String title, String icon,
      {VoidCallback? onPressed}) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FCoreImage(
            icon,
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: AppTextStyle.regular(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildViewMember() {
    return InkWell(
      onTap: controller.onViewMember,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            FCoreImage(
              IconConstants.icViewMember,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Obx(
                () => Text(
                  'chat.option.view.member'
                      .trArgs([controller.memberCount.toString()]),
                  style: AppTextStyle.heavy(fontSize: 16),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16),
              child: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPined() {
    return InkWell(
      onTap: controller.onPined,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            FCoreImage(
              IconConstants.icBox,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'chat.option.pined'.tr,
                style: AppTextStyle.heavy(fontSize: 16),
              ),
            ),
            const SizedBox(width: 16),
            Obx(
              () => Text(
                (controller.messagePinGroups.length +
                        controller.messagePinPrivates.length)
                    .toString(),
                style: AppTextStyle.heavy(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedia() {
    final size = (Get.width - 103) / 6;
    return InkWell(
      onTap: controller.onMedia,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                FCoreImage(
                  IconConstants.icImage,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 16),
                Text(
                  'chat.option.media'.tr,
                  style: AppTextStyle.heavy(fontSize: 16),
                )
              ],
            ),
            Container(
              height: size,
              margin: const EdgeInsets.only(left: 40, top: 24),
              alignment: Alignment.centerLeft,
              child: Obx(
                () {
                  if (controller.medias.isNotEmpty) {
                    final mediaCount = min(controller.medias.length, 5);
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: mediaCount + 1,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 3);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        if (index == mediaCount) {
                          return AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: FCoreImage(IconConstants.icImageMore),
                            ),
                          );
                        }
                        return WidgetPreviewMedia(
                          controller.medias[index],
                          borderRadius: BorderRadius.circular(8),
                        );
                      },
                    );
                  } else if (controller.isAttachFileLoading.value) {
                    return Container(
                        alignment: Alignment.center, child: WidgetLoading());
                  } else {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        'chat.option.media.empty'.tr,
                        style: AppTextStyle.regular(
                            color: AppColor.primaryHintColor),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDelete() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          FCoreImage(
            IconConstants.icDelete,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 16),
          Text(
            'chat.option.delete'.tr,
            style: AppTextStyle.heavy(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildLeave() {
    return InkWell(
      onTap: controller.onLeave,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            FCoreImage(
              IconConstants.icLeave,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 16),
            Text(
              'chat.option.group.leave'.tr,
              style: AppTextStyle.heavy(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
