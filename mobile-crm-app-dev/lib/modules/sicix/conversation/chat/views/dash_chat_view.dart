import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'message_list_view.dart';

class DashChatView extends StatelessWidget {
  const DashChatView({
    required this.currentUser,
    required this.onSend,
    required this.messages,
    required this.itemScrollControlle,
    this.inputOptions = const InputOptions(),
    this.messageOptions = const MessageOptions(),
    this.messageListOptions = const MessageListOptions(),
    this.quickReplyOptions = const QuickReplyOptions(),
    this.scrollToBottomOptions = const ScrollToBottomOptions(),
    this.readOnly = false,
    this.typingUsers,
    this.topInputToolbar,
    Key? key,
  }) : super(key: key);

  /// The current user of the chat
  final ChatUser currentUser;

  /// Function to call when the user sends a message
  final void Function(ChatMessage message) onSend;

  /// List of messages visible in the chat
  final List<ChatMessage> messages;

  /// Options to customize the behaviour and design of the chat input
  final InputOptions inputOptions;

  /// Options to customize the behaviour and design of the messages
  final MessageOptions messageOptions;

  /// Options to customize the behaviour and design of the overall list of message
  final MessageListOptions messageListOptions;

  /// Options to customize the behaviour and design of the quick replies
  final QuickReplyOptions quickReplyOptions;

  /// Options to customize the behaviour and design of the scroll-to-bottom button
  final ScrollToBottomOptions scrollToBottomOptions;

  /// Option to make the chat read only, it will hide the input field
  final bool readOnly;

  /// List of users currently typing in the chat
  final List<ChatUser>? typingUsers;

  final Widget? topInputToolbar;

  final ItemScrollController itemScrollControlle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: MessageListView(
            currentUser: currentUser,
            messages: messages,
            messageOptions: messageOptions,
            messageListOptions: messageListOptions,
            quickReplyOptions: quickReplyOptions,
            scrollToBottomOptions: scrollToBottomOptions,
            typingUsers: typingUsers,
            itemScrollControlle: itemScrollControlle,
          ),
        ),
        topInputToolbar ?? Container(),
        if (!readOnly)
          InputToolbar(
            inputOptions: inputOptions,
            currentUser: currentUser,
            onSend: onSend,
          ),
      ],
    );
  }
}
