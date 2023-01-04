import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ui_api/sicix_api/models/chat/message_content/message_content_event.dart';
import 'package:ui_api/sicix_api/models/chat/message_data/message_item.dart';
import 'package:ui_api/sicix_api/models/chat/message_pin/message_pin.dart';
import 'package:ui_api/sicix_api/models/common/reaction_model.dart';
import 'package:ui_api/sicix_api/models/media_file/media_file.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/theme/theme_decoration.dart';
import '../../../../../shared/utils/date_util.dart';
import '../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/messenger/widget_message_reaction.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_touch_hide_keyboard.dart';
import '../controllers/chat_controller.dart';
import 'dash_chat_view.dart';
import 'media_container_view.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.chatBackgroundColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppColor.secondBackgroundColor,
          appBar: AppBar(
            centerTitle: false,
            title: Obx(
              () => controller.isSearching.value
                  ? Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.secondBackgroundColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: controller.searchController,
                        textInputAction: TextInputAction.search,
                        decoration: ThemeDecoration.searchInputDecoration(
                            hintText: 'chat.search'.tr),
                        onSubmitted: controller.onSubmittedSearch,
                      ),
                    )
                  : Obx(
                      () => InkWell(
                        onTap: controller.userPartner.value != null
                            ? controller.onPartnerAvatar
                            : null,
                        child: Row(
                          children: [
                            Obx(
                              () => WidgetAvatar(
                                size: 44,
                                avatar: controller.avatar.value,
                                name: controller.name.value,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Obx(
                                () => Text(
                                  controller.name.value,
                                  style: AppTextStyle.heavy(
                                    color: AppColor.secondTextColor,
                                    fontSize: 20,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
            actions: [
              Obx(
                () => controller.isSearching.value
                    ? const SizedBox()
                    : IconButton(
                        onPressed: controller.onSearch,
                        icon: FCoreImage(
                          IconConstants.icSearch2,
                          width: 32,
                          height: 32,
                        ),
                      ),
              ),
              Obx(
                () => controller.isSearching.value
                    ? const SizedBox()
                    : IconButton(
                        onPressed: controller.onOptionMenu,
                        icon: FCoreImage(
                          IconConstants.icMenu1,
                          width: 32,
                          height: 32,
                        ),
                      ),
              ),
              Obx(
                () => !controller.isSearching.value
                    ? const SizedBox()
                    : TextButton(
                        onPressed: controller.onCancelSearch,
                        child: Text(
                          'cancel'.tr,
                          style: AppTextStyle.heavy(
                              color: AppColor.secondTextColor),
                        ),
                      ),
              ),
            ],
          ),
          body: WidgetTouchHideKeyBoard(
            child: _buildBodyContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Stack(
      children: [
        Obx(() {
          if (controller.isChangeBackground.value &&
              controller.conversationTheme.value != null) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      controller.conversationTheme.value!.getBackground()),
                  fit: BoxFit.cover,
                ),
              ),
            );
          } else {
            if (controller.conversation.config?.getBackground().isEmpty ??
                true) {
              return Container();
            }
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      controller.conversation.config!.getBackground()),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
        }),
        Column(
          children: [
            _buildPinMessage(),
            Expanded(
              child: _buildDashChat(),
            ),
            _buildConfirmButtonChangeBackground(),
          ],
        ),
      ],
    );
  }

  Widget _buildPinMessage() {
    return Obx(() {
      MessagePin? pin;
      if (controller.messagePinGroups.isNotEmpty) {
        pin = controller.messagePinGroups.first;
      } else if (controller.messagePinPrivates.isNotEmpty) {
        pin = controller.messagePinPrivates.first;
      }
      if (pin == null) {
        return Container();
      } else {
        final pinedCount = controller.messagePinGroups.length +
            controller.messagePinPrivates.length;
        return InkWell(
          onTap: controller.onPined,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            color: AppColor.pollBackgroundColor,
            child: Row(
              children: [
                FCoreImage(
                  IconConstants.icPinedMessenger1,
                  width: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pin.getPinContent(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.regular(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                pinedCount > 0
                    ? Container(
                        padding: const EdgeInsets.fromLTRB(12, 2, 4, 2),
                        decoration: BoxDecoration(
                          color: AppColor.badgeColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              pinedCount > 5 ? '5+' : '$pinedCount',
                              maxLines: 1,
                              style: AppTextStyle.heavy(
                                  color: AppColor.secondTextColor),
                            ),
                            Icon(
                              Icons.arrow_right_sharp,
                              size: 20,
                              color: AppColor.primaryBackgroundColor,
                            )
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      }
    });
  }

  Widget _buildDashChat() {
    return Obx(() {
      return DashChatView(
        currentUser: controller.currentUser,
        itemScrollControlle: controller.itemScrollController,
        onSend: (ChatMessage chatMessage) => controller.onSend(chatMessage),
        messages: controller.chatMessages.value,
        readOnly: controller.isChangeBackground.value,
        messageOptions: _messageOptions(),
        messageListOptions: MessageListOptions(
          onLoadEarlier:
              controller.isMoreBefore.value ? controller.onLoadEarlier : null,
          showDateSeparator: true,
          dateSeparatorBuilder: (date) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColor.primaryBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                DateUtils.isSameDay(date, DateTime.now())
                    ? 'today'.tr
                    : DateFormat(CommonConstants.dateTimeFormat).format(date),
                style: AppTextStyle.regular(color: AppColor.primaryHintColor),
              ),
            );
          },
          separatorFrequency: SeparatorFrequency.days,
        ),
        topInputToolbar: _buildTopInputToolbar(),
        inputOptions: _inputOptions(),
      );
    });
  }

  Widget _buildTopInputToolbar() {
    return Obx(
      () {
        if (controller.replyMessage.value != null) {
          final mediaFile = controller.replyMessage.value?.firstMediaFile();
          return Container(
            margin: const EdgeInsets.only(top: 10, bottom: 0.5),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  offset: Offset(0, -2),
                )
              ],
              color: AppColor.primaryBackgroundColor,
            ),
            child: Row(
              children: [
                Container(
                  width: 3,
                  height: 34,
                  margin: const EdgeInsets.only(left: 24, right: 8),
                  decoration: BoxDecoration(
                    color: AppColor.buttonBackgroundColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                mediaFile == null
                    ? Container()
                    : Container(
                        height: 34,
                        width: 34,
                        margin: const EdgeInsets.only(right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: FCoreImage(
                            mediaFile.getMediaFilePreview(),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'chat.reply'.tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.heavy(
                          fontSize: 13,
                          color: AppColor.sixTextColorLight,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        controller.replyMessage.value?.getSumaryContent() ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.regular(
                          fontSize: 13,
                          color: AppColor.primaryHintColor,
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: controller.onCancelMessageReply,
                  icon: const Icon(Icons.clear_sharp, size: 20),
                ),
              ],
            ),
          );
        } else if (controller.editMesssage.value != null) {
          return Container(
            margin: const EdgeInsets.only(top: 10, bottom: 0.5),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  offset: Offset(0, -2),
                )
              ],
              color: AppColor.primaryBackgroundColor,
            ),
            child: Row(
              children: [
                Container(
                  width: 3,
                  height: 34,
                  margin: const EdgeInsets.only(left: 24, right: 8),
                  decoration: BoxDecoration(
                    color: AppColor.buttonBackgroundColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'chat.edit'.tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.heavy(
                          fontSize: 13,
                          color: AppColor.sixTextColorLight,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        controller.editMesssage.value?.getSumaryContent() ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.regular(
                          fontSize: 13,
                          color: AppColor.primaryHintColor,
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: controller.onCancelMessageReply,
                  icon: const Icon(Icons.clear_sharp, size: 20),
                ),
              ],
            ),
          );
        }

        return Container(
          margin: const EdgeInsets.only(top: 10),
          height: 1,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(0, -2),
              )
            ],
            color: AppColor.primaryBackgroundColor,
          ),
        );
      },
    );
  }

  InputOptions _inputOptions() {
    return InputOptions(
      textController: controller.chatController,
      focusNode: controller.chatFocusNode,
      inputTextStyle: AppTextStyle.regular(),
      inputDecoration: ThemeDecoration.inputNoneBorder.copyWith(
        hintText: 'chat.hint'.tr,
      ),
      inputToolbarStyle: BoxDecoration(
        color: AppColor.primaryBackgroundColor,
      ),
      inputToolbarPadding: EdgeInsets.zero,
      inputToolbarMargin: EdgeInsets.zero,
      onTextChange: controller.onInputTextChange,
      sendButtonBuilder: (send) => IconButton(
        onPressed: send,
        icon: FCoreImage(
          IconConstants.icSend,
          width: 25,
          height: 25,
        ),
      ),
      trailing: [
        Obx(
          () => controller.isSend.value
              ? Container()
              : IconButton(
                  onPressed: controller.onAttachFile,
                  icon: FCoreImage(
                    IconConstants.icAttachFile1,
                    color: AppColor.actionNeutral,
                    width: 21,
                    height: 21,
                  ),
                ),
        ),
        Obx(
          () => controller.isSend.value
              ? Container()
              : IconButton(
                  onPressed: controller.onAttachMedia,
                  icon: FCoreImage(
                    IconConstants.icMedia,
                    width: 20,
                    height: 20,
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildConfirmButtonChangeBackground() {
    return Obx(
      () {
        if (!controller.isChangeBackground.value &&
            controller.conversationTheme.value == null) {
          return Container();
        }
        return Container(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Expanded(
                child: WidgetButton(
                  title: 'apply'.tr,
                  onPressed: controller.confirmChangeBackground,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: WidgetButton(
                  title: 'cancel'.tr,
                  textButtonColor: AppColor.thirdButtonColor,
                  backgroundButtonColor: AppColor.cancelBackgroundColor,
                  onPressed: controller.cancelChangeBackground,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  MessageOptions _messageOptions() {
    return MessageOptions(
      showTime: true,
      containerColor: AppColor.primaryBackgroundColor,
      currentUserContainerColor: AppColor.messageBackgroundColor,
      showOtherUsersAvatar: false,
      showOtherUsersName: false,
      userNameBuilder: (user) {
        final isOwnMessage = controller.currentUser.id == user.id;
        return Container(
          color: isOwnMessage
              ? AppColor.messageBackgroundColor
              : AppColor.primaryBackgroundColor,
          child: Text(
            user.getFullName(),
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.regular(
              color: AppColor.primaryHintColor,
            ),
          ),
        );
      },
      top: _buildTopMessageView,
      // bottom: _buildReactionMessageView,
      messageTextBuilder: (message, previousMessage, nextMessage) {
        final isOwnMessage = controller.currentUser.id == message.user.id;

        final isEdit = message.customProperties?[MessageItem.IS_EDIT] ?? false;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              isOwnMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            (message.text.isEmpty ||
                    isOwnMessage ||
                    controller.conversation.isPrivateChat())
                ? Container(width: 0)
                : Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: _buildUserInfo(message.user),
                  ),
            ParsedText(
              parse: defaultPersePatterns,
              text: message.text,
              style: AppTextStyle.regular(fontSize: 16),
            ),
            isEdit
                ? Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: ParsedText(
                      parse: defaultPersePatterns,
                      text: 'edited'.tr,
                      style: AppTextStyle.light(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: isOwnMessage
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          DateUtil.formatDatetimeToString(message.createdAt,
                              type: DateUtil.TIME_TYPE),
                          style: AppTextStyle.regular(
                            fontSize: 14,
                            color: AppColor.primaryHintColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        FCoreImage(
                          IconConstants.icReceived,
                          width: 16,
                        )
                      ],
                    )
                  : Text(
                      DateUtil.formatDatetimeToString(message.createdAt,
                          type: DateUtil.TIME_TYPE),
                      style: AppTextStyle.regular(
                        fontSize: 14,
                        color: AppColor.primaryHintColor,
                      ),
                    ),
            ),
          ],
        );
      },
      messageMediaBuilder: (message, previousMessage, nextMessage) {
        final isOwnMessage = controller.currentUser.id == message.user.id;
        return Column(
          crossAxisAlignment:
              isOwnMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            (message.medias == null ||
                    message.medias!.isEmpty ||
                    isOwnMessage ||
                    controller.conversation.isPrivateChat())
                ? Container(width: 0)
                : Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: isOwnMessage
                          ? AppColor.messageBackgroundColor
                          : AppColor.primaryBackgroundColor,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: _buildUserInfo(message.user),
                  ),
            MediaContainerView(
              message: message,
              isOwnMessage: isOwnMessage,
              messageOptions: MessageOptions(
                containerColor: AppColor.primaryBackgroundColor,
                currentUserContainerColor: AppColor.messageBackgroundColor,
                textColor: AppColor.primaryTextColor,
                currentUserTextColor: AppColor.primaryTextColor,
                onTapMedia: (media) => controller.onMedia(media),
                onPressAvatar: (user) => controller.onChatAvatar(user.id),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: isOwnMessage
                    ? AppColor.messageBackgroundColor
                    : AppColor.primaryBackgroundColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: isOwnMessage
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          DateUtil.formatDatetimeToString(message.createdAt,
                              type: DateUtil.TIME_TYPE),
                          style: AppTextStyle.regular(
                            fontSize: 14,
                            color: AppColor.primaryHintColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        FCoreImage(
                          IconConstants.icReceived,
                          width: 16,
                        )
                      ],
                    )
                  : Text(
                      DateUtil.formatDatetimeToString(message.createdAt,
                          type: DateUtil.TIME_TYPE),
                      style: AppTextStyle.regular(
                        fontSize: 14,
                        color: AppColor.primaryHintColor,
                      ),
                    ),
            ),
            const SizedBox(height: 5),
          ],
        );
      },
      messageRowBuilder: _buildMessageRowView,
      onLongPressMessage: (message) => controller.onLongPressMessage(message),
      onTapMedia: (media) => controller.onMedia(media),
      onPressAvatar: (user) => controller.onChatAvatar(user.id),
    );
  }

  Widget _buildUserInfo(ChatUser user) {
    return InkWell(
      onTap: () => controller.onChatAvatar(user.id),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          WidgetAvatar(
            size: 20,
            name: user.getFullName(),
            avatar: user.profileImage,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              user.getFullName(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.heavy(
                  color: AppColor.sixTextColorLight, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMessageRowView(
      ChatMessage message,
      ChatMessage? previousMessage,
      ChatMessage? nextMessage,
      bool isAfterDateSeparator,
      bool isBeforeDateSeparator) {
    if (message.customProperties?[MessageItem.TYPE] ==
        MessageContentEvent.TYPE_EVENT) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColor.primaryBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message.text,
          textAlign: TextAlign.center,
          style: AppTextStyle.regular(color: AppColor.primaryHintColor),
        ),
      );
    }

    ReactionModel? reactionModel;
    if (message.customProperties?[MessageItem.REACTION] != null &&
        message.customProperties?[MessageItem.REACTION] is ReactionModel) {
      reactionModel = message.customProperties?[MessageItem.REACTION];
    }

    if (reactionModel == null || reactionModel.reactionCount == 0) {
      return MessageRow(
        message: message,
        currentUser: controller.currentUser,
        previousMessage: previousMessage,
        nextMessage: nextMessage,
        isAfterDateSeparator: isAfterDateSeparator,
        isBeforeDateSeparator: isBeforeDateSeparator,
        messageOptions: _messageOptions(),
      );
    }

    final isOwnMessage = controller.currentUser.id == message.user.id;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 18),
          child: MessageRow(
            message: message,
            currentUser: controller.currentUser,
            previousMessage: previousMessage,
            nextMessage: nextMessage,
            isAfterDateSeparator: isAfterDateSeparator,
            isBeforeDateSeparator: isBeforeDateSeparator,
            messageOptions: _messageOptions(),
          ),
        ),
        Positioned(
          left: isOwnMessage ? null : 10,
          right: isOwnMessage ? 10 : null,
          bottom: 0,
          child: WidgetMessageReaction(reactionModel, Colors.white),
        )
      ],
    );
  }

  // Widget cho reply và forward content
  Widget _buildTopMessageView(ChatMessage message, ChatMessage? previousMessage,
      ChatMessage? nextMessage) {
    MessageItem? reply;
    MessageItem? forward;
    MediaFile? replyMediaFile;
    if (message.customProperties?[MessageItem.REPLY] != null &&
        message.customProperties?[MessageItem.REPLY] is MessageItem) {
      reply = message.customProperties?[MessageItem.REPLY];
      replyMediaFile = reply?.firstMediaFile();
    } else if (message.customProperties?[MessageItem.FORWARD] != null &&
        message.customProperties?[MessageItem.FORWARD] is MessageItem) {
      forward = message.customProperties?[MessageItem.FORWARD];
    }

    final isOwnMessage = controller.currentUser.id == message.user.id;
    if (reply != null) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: AppColor.pollBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: Radius.circular(isOwnMessage ? 12 : 0),
            bottomRight: Radius.circular(isOwnMessage ? 0 : 12),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 3,
              height: 34,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: AppColor.buttonBackgroundColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            replyMediaFile == null
                ? Container()
                : Container(
                    height: 34,
                    width: 34,
                    margin: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: FCoreImage(
                        replyMediaFile.getMediaFilePreview(),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'chat.reply'.tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.heavy(
                          fontSize: 13,
                          color: AppColor.sixTextColorLight,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          reply.user.getFullName(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.heavy(
                            fontSize: 13,
                            color: AppColor.eightTextColorLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    reply.getSumaryContent(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.regular(
                      fontSize: 13,
                      color: AppColor.primaryHintColor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      );
    } else if (forward != null) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: AppColor.pollBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: Radius.circular(isOwnMessage ? 12 : 0),
            bottomRight: Radius.circular(isOwnMessage ? 0 : 12),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 3,
              height: 20,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: AppColor.buttonBackgroundColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Flexible(
              child: Text(
                message.user.getFullName(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.heavy(
                  fontSize: 13,
                  color: AppColor.eightTextColorLight,
                ),
              ),
            ),
            Flexible(
              child: Text(
                ' - ${DateUtil.formatDatetimeToString(forward.createDate, type: DateUtil.DATETIME_TYPE)}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.heavy(fontSize: 13),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      );
    }
    return Container();
  }
}
