import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ui_api/sicix_api/models/common/reaction_model.dart';

import '../../../../modules/sicix/conversation/chat/views/media_container_view.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../constants/common.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class WidgetMessageHoldActions {
  static Future<void> showActions({
    required ChatUser currentUser,
    required ChatMessage message,
    required Function() onMessageReply,
    required Function() onMessageForward,
    required Function() onMessageEdit,
    required Function() onMessageCopy,
    required Function() onMessagePin,
    required Function() onMessageDelete,
    required Function(Reaction) onMessageReaction,
  }) async {
    await showDialog(
      context: Get.context!,
      builder: (context) {
        return WidgetMessageHoldActionsContent(
          currentUser: currentUser,
          message: message,
          onMessageReply: onMessageReply,
          onMessageForward: onMessageForward,
          onMessageEdit: onMessageEdit,
          onMessageCopy: onMessageCopy,
          onMessagePin: onMessagePin,
          onMessageDelete: onMessageDelete,
          onMessageReaction: onMessageReaction,
        );
      },
    );
  }
}

class WidgetMessageHoldActionsContent extends StatelessWidget {
  final ChatUser currentUser;
  final ChatMessage message;
  final Function() onMessageReply;
  final Function() onMessageForward;
  final Function() onMessageEdit;
  final Function() onMessageCopy;
  final Function() onMessagePin;
  final Function() onMessageDelete;
  final Function(Reaction) onMessageReaction;

  const WidgetMessageHoldActionsContent({
    Key? key,
    required this.currentUser,
    required this.message,
    required this.onMessageReply,
    required this.onMessageForward,
    required this.onMessageEdit,
    required this.onMessageCopy,
    required this.onMessagePin,
    required this.onMessageDelete,
    required this.onMessageReaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isOwner = currentUser.id == message.user.id;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          isOwner ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Material(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: Reaction.values
                    .map((reaction) => IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onMessageReaction(reaction);
                        },
                        icon: FCoreImage(reaction.avatarUrl)))
                    .toList()),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: Get.height / 2, maxWidth: Get.width * 0.7 + 20),
          child: SingleChildScrollView(
            child: MessageRow(
              message: message,
              currentUser: currentUser,
              messageOptions: MessageOptions(
                showTime: true,
                showOtherUsersAvatar: false,
                showOtherUsersName: false,
                containerColor: AppColor.primaryBackgroundColor,
                currentUserContainerColor: AppColor.messageBackgroundColor,
                messageTextBuilder: (message, previousMessage, nextMessage) {
                  final isOwnMessage = currentUser.id == message.user.id;
                  return Column(
                    crossAxisAlignment: isOwnMessage
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      ParsedText(
                        parse: defaultPersePatterns,
                        text: message.text,
                        style: AppTextStyle.regular(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          DateFormat(CommonConstants.timeFormat)
                              .format(message.createdAt),
                          style: AppTextStyle.regular(
                            fontSize: 14,
                            color: AppColor.primaryHintColor,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                messageTimeBuilder: (message, isOwnMessage) {
                  return Container(
                    child: Text(
                      DateFormat(CommonConstants.timeFormat)
                          .format(message.createdAt),
                      style: AppTextStyle.regular(
                        fontSize: 14,
                        color: AppColor.primaryHintColor,
                      ),
                    ),
                  );
                },
                messageMediaBuilder: (message, previousMessage, nextMessage) {
                  final isOwnMessage = currentUser.id == message.user.id;
                  return Material(
                    color: Colors.transparent,
                    child: MediaContainerView(
                      message: message,
                      isOwnMessage: isOwnMessage,
                      messageOptions: MessageOptions(
                        containerColor: AppColor.primaryBackgroundColor,
                        currentUserContainerColor:
                            AppColor.messageBackgroundColor,
                        textColor: AppColor.primaryTextColor,
                        currentUserTextColor: AppColor.primaryTextColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),
        Container(
          width: Get.width * 0.6,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Material(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _getMenuItem(context, isOwner, message.text.isNotEmpty,
                  message.medias?.isNotEmpty ?? false),
            ),
          ),
        ),
        // isOwner ? _buildOwnerMessageActions() : _buildMessageActions(),
      ],
    );
  }

  List<Widget> _getMenuItem(
      BuildContext context, bool isOwner, bool isCopy, bool isEdit) {
    final menuITems = <Widget>[];
    menuITems.add(_buildMenuAction(
      onTap: () {
        Navigator.pop(context);
        onMessageReply();
      },
      icon: IconConstants.icReply,
      title: 'chat.reply'.tr,
    ));
    menuITems.add(const Divider(height: 1));
    menuITems.add(_buildMenuAction(
      onTap: () {
        Navigator.pop(context);
        onMessageForward();
      },
      icon: IconConstants.icForward,
      title: 'chat.forward'.tr,
    ));
    menuITems.add(const Divider(height: 1));
    if (isOwner || isEdit) {
      menuITems.add(_buildMenuAction(
        onTap: () {
          Navigator.pop(context);
          onMessageEdit();
        },
        icon: IconConstants.icEdit1,
        title: 'chat.edit'.tr,
      ));
      menuITems.add(const Divider(height: 1));
    }
    if (isCopy) {
      menuITems.add(_buildMenuAction(
        onTap: () {
          Navigator.pop(context);
          onMessageCopy();
        },
        icon: IconConstants.icCopy,
        title: 'chat.copy'.tr,
      ));
      menuITems.add(const Divider(height: 1));
    }
    menuITems.add(_buildMenuAction(
      onTap: () {
        Navigator.pop(context);
        onMessagePin();
      },
      icon: IconConstants.icPin,
      title: 'chat.pin'.tr,
    ));

    if (isOwner) {
      menuITems.add(const Divider(height: 1));
      menuITems.add(_buildMenuAction(
        onTap: () {
          Navigator.pop(context);
          onMessageDelete();
        },
        icon: IconConstants.icDelete,
        title: 'chat.delete'.tr,
        colorTitle: AppColor.errorColor,
      ));
    }
    return menuITems;
  }

  Widget _buildMenuAction({
    GestureTapCallback? onTap,
    required String icon,
    required String title,
    Color? colorTitle,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            FCoreImage(icon, width: 24, height: 24),
            const SizedBox(width: 12),
            Text(title,
                style: AppTextStyle.regular(
                    color: colorTitle ?? AppColor.primaryTextColor)),
          ],
        ),
      ),
    );
  }
}
