import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/chat/message_pin/message_pin.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_preview_horizontal_media.dart';
import '../controllers/pined_conversation_controller.dart';

class PinedConversationBottomView extends GetView<PinedConversationController> {
  @override
  final PinedConversationController controller;

  PinedConversationBottomView(this.controller);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => (controller.messagePinGroups.isEmpty &&
                controller.messagePinPrivates.isEmpty)
            ? _buildPinedEmpty()
            : ConstrainedBox(
                constraints: BoxConstraints(maxHeight: Get.height * 0.8),
                child: SingleChildScrollView(
                  child: _buildBodyContent(),
                ),
              ),
      ),
    );
  }

  Widget _buildPinedEmpty() {
    return Container(
      width: double.infinity,
      height: Get.height * 0.65,
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          FCoreImage(
            IconConstants.icPinedEmpty,
            width: Get.width * 0.46,
          ),
          const SizedBox(height: 20),
          Text(
            'pined.conversation.empty'.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.regular(color: AppColor.fourthTextColor),
          ),
          Flexible(
            flex: 3,
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
          alignment: Alignment.center,
          child: Text(
            'pined.conversation.cap'.tr,
            style: AppTextStyle.regular(color: AppColor.fourthTextColor),
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(height: 0.5, thickness: 0.5),
        controller.messagePinGroups.isEmpty
            ? Container()
            : Container(
                margin: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Text(
                  'pined.conversation.group'.tr,
                  style: AppTextStyle.regular(color: AppColor.thirdTextColor),
                ),
              ),
        Obx(
          () => _builPinedPublish(controller.messagePinGroups, true),
        ),
        controller.messagePinPrivates.isEmpty
            ? Container()
            : Container(
                margin: const EdgeInsets.fromLTRB(24, 24, 24, 14),
                child: Text(
                  'pined.conversation.private'.tr,
                  style: AppTextStyle.regular(color: AppColor.thirdTextColor),
                ),
              ),
        Obx(
          () => _builPinedPublish(controller.messagePinPrivates, false),
        ),
      ],
    );
  }

  Widget _builPinedPublish(RxList<MessagePin> messagePins, bool isGroup) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: messagePins.length,
      itemBuilder: (context, index) =>
          _builPinedCell(messagePins[index], isGroup),
    );
  }

  Widget _builPinedCell(MessagePin messagePin, bool isGroup) {
    return InkWell(
      onTap: () => controller.onPinMessage(messagePin),
      child: Container(
          padding: const EdgeInsets.fromLTRB(24, 10, 10, 10),
          child: Column(
            children: [
              Row(
                children: [
                  FCoreImage(
                    IconConstants.icPinedMessenger,
                    width: 20,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      messagePin.getPinContent(),
                      maxLines: 4,
                      style: AppTextStyle.regular(),
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        controller.onDeletePinMessage(messagePin, isGroup),
                    icon: FCoreImage(
                      IconConstants.icDelete1,
                      width: 20,
                    ),
                  ),
                ],
              ),
              if (messagePin.mediaFiles.isNotEmpty)
                WidgetPreviewHorizontalMedia(
                  height: 50,
                  // margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  files: messagePin.mediaFiles,
                  onPressed: controller.onOpenMediaFile,
                ),
            ],
          )),
    );
  }
}
