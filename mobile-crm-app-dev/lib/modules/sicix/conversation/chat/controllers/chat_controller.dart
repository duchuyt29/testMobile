import 'dart:convert';
import 'dart:io';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:ui_api/sicix_api/models/auth/user_info.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation_theme.dart';
import 'package:ui_api/sicix_api/models/chat/message_content/message_content_event.dart';
import 'package:ui_api/sicix_api/models/chat/message_data/message_item.dart';
import 'package:ui_api/sicix_api/models/chat/message_pin/message_pin.dart';
import 'package:ui_api/sicix_api/models/common/reaction_model.dart';
import 'package:ui_api/sicix_api/models/media_file/media_file.dart';
import 'package:ui_api/sicix_api/request/conversation_theme_request.dart';
import 'package:ui_api/sicix_api/request/message_request.dart';
import 'package:ui_api/sicix_api/request/pin_request.dart';
import 'package:ui_api/sicix_api/request/reaction_request.dart';
import 'package:ui_api/sicix_api/request/request_message_ws.dart';
import 'package:ui_api/sicix_api/request/search_chat_request.dart';
import 'package:ui_api/sicix_api/request/upload_file_request.dart';
import 'package:ui_api/sicix_api/request/user_by_id_request.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/io.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../data/app_data_global.dart';
import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/constants/arguments.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/services/path_service.dart';
import '../../../../../shared/services/user_info_service.dart';
import '../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../shared/utils/date_util.dart';
import '../../../../../shared/utils/dialog_util.dart';
import '../../../../../shared/widgets/dialog/widget_message_hold_actions.dart';
import '../../../../../shared/widgets/dialog/widget_view_user_profile.dart';
import '../../../../../shared/widgets/messenger/widget_pin_message.dart';
import '../../pined_conversation/controllers/pined_conversation_controller.dart';
import '../../pined_conversation/views/pined_conversation_bottom_view.dart';

class ChatController extends BaseController {
  final Conversation conversation;
  final itemScrollController = ItemScrollController();

  IOWebSocketChannel? webSocketChannel;

  final searchController = TextEditingController();
  final chatController = TextEditingController();
  final chatFocusNode = FocusNode();

  final currentUser = AppDataGlobal.userInfo?.getChatUser() ?? ChatUser(id: '');
  final userPartner = Rxn<UserInfo>();

  final avatar = RxString('');
  final name = RxString('');

  final isMoreBefore = RxBool(true);
  final chatMessages = RxList<ChatMessage>([]);
  final messageItems = RxList<MessageItem>([]);

  final replyMessage = Rxn<MessageItem>();

  final editMesssage = Rxn<MessageItem>();

  final messagePinGroups = RxList<MessagePin>.empty();
  final messagePinPrivates = RxList<MessagePin>.empty();

  final isFirstLoad = RxBool(true);
  final isSearching = RxBool(false);
  final isSend = RxBool(false);

  final isChangeBackground = RxBool(false);
  final conversationTheme = Rxn<ConversationTheme>();

  ChatController(this.conversation);

  @override
  Future<void> onInit() async {
    avatar.value = conversation.getAvatar();
    name.value = conversation.getName();
    await super.onInit();

    _initWebsocket();

    if (conversation.isPrivateChat() && conversation.partner != null) {
      userPartner.value = await _loadUser(conversation.partner!);
      if (userPartner.value != null) {
        avatar.value = userPartner.value!.getAvatar();
        name.value = userPartner.value!.getName();
      }
    }

    await _callGetMessages();

    await _getMessagePinGroup();

    await _getMessagePinPrivate();
  }

  @override
  void onClose() {
    webSocketChannel?.sink.close();
    // chatFocusNode.dispose();
    super.onClose();
  }

  @override
  void refresh() {
    super.refresh();

    _initWebsocket();
  }

  /* Action */

  Future onPartnerAvatar() async {
    if (userPartner.value != null) {
      await WidgetViewUserProfile.showUserProfile(userPartner.value!);
    }
  }

  Future onChatAvatar(String userId) async {
    await EasyLoading.show();
    final user = await _loadUser(userId);
    await EasyLoading.dismiss();
    if (user != null) {
      await WidgetViewUserProfile.showUserProfile(user);
    }
  }

  Future<void> onSubmittedSearch(String searchText) async {}

  Future<void> onSearch() async {
    // isSearching.value = true;
    await Get.toNamed(SicixRoutes.CHAT_SEARCH, arguments: conversation)
        ?.then((value) {
      final messageItem = value as MessageItem?;
      if (messageItem != null && messageItem.id != null) {
        onScrollToMessage(messageItem.id!);
      }
    });
  }

  Future<void> onScrollToMessage(String messageId) async {
    final index = messageItems.indexWhere((element) => element.id == messageId);
    if (index != -1) {
      await Future.delayed(
        const Duration(seconds: 1),
        () => itemScrollController.scrollTo(
          index: index,
          duration: const Duration(milliseconds: 300),
        ),
      );
    } else if (isMoreBefore.value) {
      if (!EasyLoading.isShow) {
        await EasyLoading.show();
      }
      await onLoadEarlier();
      await onScrollToMessage(messageId);
    }
    await EasyLoading.dismiss();
  }

  Future<void> onOptionMenu() async {
    if (conversation.isPrivateChat()) {
      await Get.toNamed(SicixRoutes.OPTION_PERSONAL_CONVERSATION, arguments: {
        CONVERSATION_ARGUMENT: conversation,
        PIN_GROUP_ARGUMENT: messagePinGroups,
        PIN_PRIVATE_ARGUMENT: messagePinPrivates,
      })?.then((value) {
        avatar.value = conversation.getAvatar();
        name.value = conversation.getName();
        if (value is ConversationTheme) {
          isChangeBackground.value = true;
          conversationTheme.value = value;
        }
      });
    } else {
      await Get.toNamed(SicixRoutes.OPTION_GROUP_CONVERSATION, arguments: {
        CONVERSATION_ARGUMENT: conversation,
        PIN_GROUP_ARGUMENT: messagePinGroups,
        PIN_PRIVATE_ARGUMENT: messagePinPrivates,
      })?.then((value) {
        avatar.value = conversation.getAvatar();
        name.value = conversation.getName();
        if (value is ConversationTheme) {
          isChangeBackground.value = true;
          conversationTheme.value = value;
        } else if (value is MessagePin) {}
      });
    }
  }

  Future<void> onCancelSearch() async {
    isSearching.value = false;
  }

  Future<void> onPined() async {
    // await BottomSheetUtil.createBottomSheet(
    //     title: 'pined.conversation.title'.tr,
    //     child: PinedConversationBottomView(PinedConversationController()));
    await BottomSheetUtil.createBottomSheet(
      title: 'pined.conversation.title'.tr,
      child: PinedConversationBottomView(
        PinedConversationController(
          convesation: conversation,
          messagePinGroups: messagePinGroups,
          messagePinPrivates: messagePinPrivates,
        ),
      ),
      onVaLue: (value) {
        final messagePin = value as MessagePin?;
        if (messagePin != null && messagePin.id != null) {
          onScrollToMessage(messagePin.id!);
        }
      },
    );
  }

  void onLongPressMessage(ChatMessage message) {
    // showDialog(
    //   context: Get.overlayContext!,barrierDismissible: false,
    //   builder: (context) {
    //     return WillPopScope(
    //       onWillPop: () => Future.value(false),
    //       child: AlertDialog(
    //         title: const Text('Dialog'),
    //         content: const Text('This is a dialog'),
    //         actions: [
    //           TextButton(
    //             child: const Text('Close'),
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
    WidgetMessageHoldActions.showActions(
      currentUser: currentUser,
      message: message,
      onMessageReply: () => onMessageReply(message),
      onMessageForward: () => onMessageForward(message),
      onMessageEdit: () => onMessageEdit(message),
      onMessageCopy: () => onMessageCopy(message),
      onMessagePin: () => onMessagePin(message),
      onMessageDelete: () => onMessageDelete(message),
      onMessageReaction: (reaction) => onMessageReaction(message, reaction),
    );
  }

  Future<void> onMedia(ChatMedia media) async {
    printInfo(info: media.url);
    if (media.type == MediaType.image) {
      await Get.toNamed(SicixRoutes.IMAGE_PREIEW, arguments: {
        NAME_ARGUMENT: media.fileName,
        IMAGE_ARGUMENT: media.url,
      });
    } else {
      await launchUrlString(
        media.url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  // Reply a message
  Future<void> onMessageReply(ChatMessage message) async {
    // replyMessage.value = messageItems.firstWhereOrNull(
    //     (messageItem) => messageItem.id == message.customProperties?[ID]);
    // if (replyMessage.value == null) {
    //   return;
    // }
    final messageItem = messageItems.firstWhereOrNull((messageItem) =>
        messageItem.id == message.customProperties?[MessageItem.ID]);
    if (messageItem == null) {
      return;
    }
    if (messageItem.forward != null) {
      replyMessage.value = messageItem.forward;
    } else {
      replyMessage.value = messageItem;
    }
    chatFocusNode.requestFocus();
  }

  Future<void> onCancelMessageReply() async {
    replyMessage.value = null;
  }

  void onMessageForward(ChatMessage message) {
    final messageItem = messageItems.firstWhereOrNull((messageItem) =>
        messageItem.id == message.customProperties?[MessageItem.ID]);
    if (messageItem == null) {
      return;
    }
    if (messageItem.forward != null) {
      Get.toNamed(SicixRoutes.FORWARD_MESSAGE, arguments: messageItem.forward)
          ?.then((value) {});
    } else {
      Get.toNamed(SicixRoutes.FORWARD_MESSAGE, arguments: messageItem)
          ?.then((value) {});
    }
  }

  Future onMessageEdit(ChatMessage message) async {
    editMesssage.value = messageItems.firstWhereOrNull((messageItem) =>
        messageItem.id == message.customProperties?[MessageItem.ID]);
    if (editMesssage.value == null) {
      return;
    }
    chatController.text = message.text;
    chatFocusNode.requestFocus();
  }

  Future<void> onCancelEdit() async {
    editMesssage.value = null;
  }

  void onMessageCopy(ChatMessage message) {
    Clipboard.setData(ClipboardData(text: message.text));
    EasyLoading.showSuccess('copied'.tr);
  }

  Future<void> onMessagePin(ChatMessage message) async {
    final pinMessage = messageItems.firstWhereOrNull((messageItem) =>
        messageItem.id == message.customProperties?[MessageItem.ID]);
    if (pinMessage == null) {
      return;
    }
    await BottomSheetUtil.createBottomSheet(
      title: 'chat.pin.title'.tr,
      child: WidgetPinMessage(
        isGroup: conversation.isAdmin(),
        onPinGroup: () => _callPinMesssage(pinMessage, true),
        onPinPrivate: () => _callPinMesssage(pinMessage, false),
      ),
    );
  }

  void onMessageDelete(ChatMessage message) {
    final messageDeleteId = message.customProperties?[MessageItem.ID];
    if (messageDeleteId == null) {
      return;
    }
    DialogUtil.createDialogConfirm(
      title: 'chat.delete'.tr,
      message: 'chat.delete.caption'.tr,
      confirmTitle: 'confirm'.tr,
      onConfirm: () async {
        await _callDeleteMesssage(messageDeleteId);
      },
    );
  }

  Future<void> onMessageReaction(ChatMessage message, Reaction reaction) async {
    final indexMessage = messageItems.indexWhere((messageItem) =>
        messageItem.id == message.customProperties?[MessageItem.ID]);
    if (indexMessage == -1) {
      return;
    }
    await _callReactionMesssage(indexMessage, reaction);
  }

  Future<void> onLoadEarlier() => messageItems.isEmpty
      ? _callGetMessages()
      : _callGetMoreMessages(
          messageItems.lastWhere((element) => element.createDate != null),
          true);

  void onInputTextChange(String value) {
    isSend.value = value.isNotEmpty;
  }

  Future onSend(ChatMessage chatMessage) async {
    if (replyMessage.value != null) {
      final message = RequestMessageWS(
        id: const Uuid().v4().replaceAll('-', ''),
        convId: conversation.id,
        cid: AppDataGlobal.cid,
        content: chatMessage.text,
        // createBy: AppDataGlobal.userConfig?.id ?? '',
        quote: replyMessage.value?.getQuoteMessageWS(conversation.id),
      );
      replyMessage.value = null;

      try {
        webSocketChannel?.sink.add(jsonEncode(message));
      } catch (e) {
        printError(info: 'send message ${e.toString()}');
      }
    } else if (editMesssage.value != null) {
      await _callEditMesssage(editMesssage.value!, chatMessage);
      editMesssage.value = null;
      chatMessages.refresh();
      return;
    } else {
      final message = RequestMessageWS(
        id: const Uuid().v4().replaceAll('-', ''),
        convId: conversation.id,
        cid: AppDataGlobal.cid,
        content: chatMessage.text,
        // type: MessageContentEvent.TYPE_CHAT,
      );
      printInfo(info: 'send message: ${jsonEncode(message)}');
      try {
        webSocketChannel?.sink.add(jsonEncode(message));
      } catch (e) {
        printError(info: 'send message ${e.toString()}');
      }
    }
  }

  Future onAttachFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      // ignore: unused_local_variable
      final file = File(result.files.single.path!);
      await _callUploadFile(file);
    }
  }

  Future onAttachMedia() async {
    // await ImagePicker()
    //     .pickImage(source: ImageSource.gallery)
    //     .then((value) async {
    //   if (value != null) {
    //     await _callUploadImage(value);
    //   }
    // });
    await Get.toNamed(SicixRoutes.IMAGE_PICKER, arguments: true)?.then((value) {
      if (value != null && value is File) {
        _callUploadFile(value);
      }
    });
  }

  void confirmChangeBackground() {
    if (conversationTheme.value == null) {
      return;
    }
    conversation.config = conversationTheme.value;

    isChangeBackground.value = false;
    conversationTheme.value = null;

    _callUpdateBackgroundTheme(conversation.config!);
  }

  void cancelChangeBackground() {
    isChangeBackground.value = false;
    conversationTheme.value = null;
  }

  /* Function */

  void _initWebsocket() {
    printInfo(info: 'init webSocketChannel');
    webSocketChannel?.sink.close();
    webSocketChannel = IOWebSocketChannel.connect(
      Uri.parse(PathService.chatPath()),
      pingInterval: const Duration(seconds: 10),
    );
    webSocketChannel?.stream.listen(
      (message) {
        printInfo(info: 'stream listener $message');
        if (!message.toString().contains('ping') &&
            message.toString().contains(conversation.id.toString())) {
          _updateStreamMessage(message);
        }
      },
      onError: (error) {
        printError(info: error.toString());
      },
      onDone: () {
        printInfo(info: 'onDone webSocketChannel');
      },
    );
  }

  Future<void> _updateAPIMessage(List<MessageItem> messages,
      {bool isBefore = true}) async {
    await Future.forEach(messages, (MessageItem message) async {
      await _getUserForMessage(message);

      await Future.forEach(message.attachMedias, (MediaFile attachMedia) async {
        final index = message.attachMedias.indexOf(attachMedia);
        if (attachMedia.isVideo()) {
          await _getMediaFileInfo(attachMedia).then((value) {
            if (value != null) {
              message.attachMedias[index] = value;
            }
          });
        }
      });

      final index = messageItems
          .indexWhere((messageItem) => message.id == messageItem.id);
      if (index != -1) {
        messageItems[index] = message;
        chatMessages[index] = message.getChatMessage();
      } else if (isBefore) {
        messageItems.add(message);
        chatMessages.add(message.getChatMessage());
      } else {
        messageItems.insert(0, message);
        chatMessages.insert(0, message.getChatMessage());
      }
    });
  }

  Future<void> _updateStreamMessage(String message) async {
    try {
      final messageJson = json.decode(message) as Map<String, dynamic>;
      final messageItem = MessageItem.fromJson(messageJson);

      if (messageItem.id != null) {
        await _getUserForMessage(messageItem);

        await Future.forEach(messageItem.attachMedias,
            (MediaFile attachMedia) async {
          final index = messageItem.attachMedias.indexOf(attachMedia);
          if (attachMedia.isVideo()) {
            await _getMediaFileInfo(attachMedia).then((value) {
              if (value != null) {
                messageItem.attachMedias[index] = value;
              }
            });
          }
        });

        messageItems.insert(0, messageItem);
        chatMessages.insert(0, messageItem.getChatMessage());
      }
    } catch (e) {
      printError(info: 'load messages: ${e.toString()}');
    }
  }

  Future<void> _updateMessage(MessageItem messageItem,
      {int? indexMessage, bool isLastMessage = true}) async {
    await _getUserForMessage(messageItem);

    await Future.forEach(messageItem.attachMedias,
        (MediaFile attachMedia) async {
      if (attachMedia.isVideo()) {
        final index = messageItem.attachMedias.indexOf(attachMedia);
        if (attachMedia.isVideo()) {
          await _getMediaFileInfo(attachMedia).then((value) {
            if (value != null) {
              messageItem.attachMedias[index] = value;
            }
          });
        }
      }
    });

    if (indexMessage != null) {
      messageItems[indexMessage] = messageItem;
      chatMessages[indexMessage] = messageItem.getChatMessage();
      chatMessages.refresh();
    } else if (isLastMessage) {
      messageItems.insert(0, messageItem);
      chatMessages.insert(0, messageItem.getChatMessage());
    } else {
      messageItems.add(messageItem);
      chatMessages.add(messageItem.getChatMessage());
    }
  }

  Future<void> _getUserForMessage(MessageItem messageItem) async {
    final userIds = <String>[];
    if (messageItem.createBy?.isNotEmpty ?? false) {
      userIds.add(messageItem.createBy!);
    }
    if (messageItem.quote?.createBy?.isNotEmpty ?? false) {
      userIds.add(messageItem.quote!.createBy!);
    } else if (messageItem.forward?.createBy?.isNotEmpty ?? false) {
      userIds.add(messageItem.forward!.createBy!);
    }

    userIds.addAll(messageItem.participants);

    final userChats = await _getUserChats(userIds);
    messageItem.user = userChats.firstWhereOrNull(
            (element) => messageItem.createBy == element.id) ??
        ChatUser(id: 'Unknow', firstName: 'Unknow');

    if (messageItem.quote != null) {
      messageItem.quote!.user = userChats.firstWhereOrNull(
              (element) => messageItem.quote?.createBy == element.id) ??
          ChatUser(id: 'Unknow', firstName: 'Unknow');
    } else if (messageItem.forward != null) {
      messageItem.forward!.user = userChats.firstWhereOrNull(
              (element) => messageItem.forward?.createBy == element.id) ??
          ChatUser(id: 'Unknow', firstName: 'Unknow');
    }

    messageItem.participants.forEach((participant) {
      final participantChatUser =
          userChats.firstWhereOrNull((element) => participant == element.id);
      if (participantChatUser != null) {
        messageItem.participantChatUsers.add(participantChatUser);
      }
    });

    // final chatUser = await _getUserChat(messageItem.createBy);
    // messageItem.user = chatUser;

    // if (messageItem.quote != null) {
    //   final user = await _getUserChat(messageItem.quote!.createBy);
    //   messageItem.quote!.user = user;
    // } else if (messageItem.forward != null) {
    //   final user = await _getUserChat(messageItem.forward!.createBy);
    //   messageItem.forward!.user = user;
    // }
  }

  Future<List<ChatUser>> _getUserChats(List<String> userIds) async {
    final chatUsers = <ChatUser>[];
    final tempuserIds = <String>[];
    userIds.forEach((userId) {
      if (UserInfoService.chatUserContacts[userId] != null) {
        chatUsers.add(UserInfoService.chatUserContacts[userId]!);
      } else {
        tempuserIds.add(userId);
      }
    });
    if (tempuserIds.isEmpty) {
      return chatUsers;
    }
    chatUsers.addAll(await _callGetUserChats(tempuserIds));
    return chatUsers;
  }

  /* API */

  Future<void> _callGetMessages() async {
    await sicixUIRepository
        .getMessage(conversation.id ?? -1)
        .then((response) async {
      if (response.success) {
        await _updateAPIMessage(
            (response.data?.payload ?? []).reversed.toList());
      } else {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callGetMoreMessages(
      MessageItem lastMessage, bool isBefore) async {
    printInfo(info: 'load isLoadEarlier ${lastMessage.id}');
    await sicixUIRepository
        .searchMessage(
            conversation.id ?? -1,
            DateUtil.formatDatetimeToString(lastMessage.createDate,
                type: DateUtil.API_TYPE),
            // lastMessage.createDateString ?? '',
            SearchChatRequest(),
            load: isBefore
                ? SearchChatRequest.LOAD_BEFORE
                : SearchChatRequest.LOAD_AFTER,
            page: 0,
            size: CommonConstants.defaultSize)
        .then((response) async {
      if (response.success) {
        final messageItems = response.data?.payload?.content ?? [];
        if (isBefore) {
          isMoreBefore.value =
              messageItems.length >= CommonConstants.defaultSize;
        }
        await _updateAPIMessage(
            (response.data?.payload?.content ?? []).reversed.toList(),
            isBefore: isBefore);
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: response.message!);
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<List<ChatUser>> _callGetUserChats(List<String> userIds) async {
    return sicixUIRepository
        .getUserByIds(UserByIdRequest(users: userIds))
        .then((response) async {
      if (response.success) {
        final chatUsers = <ChatUser>[];
        response.data.forEach((user) {
          UserInfoService.chatUserContacts[user.id ?? ''] = user.getChatUser();
          chatUsers.add(user.getChatUser());
        });
        return chatUsers;
      } else {
        printError(info: response.message ?? '');
        return <ChatUser>[];
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      return <ChatUser>[];
    });
  }

  Future<void> _getMessagePinGroup() async {
    await sicixUIRepository
        .conversationPin(
            conversation.id ?? -1, MessagePin.MESSAGE_PIN_GROUP, 0, 10)
        .then((response) async {
      if (response.success) {
        messagePinGroups.value = response.data?.content ?? [];
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: response.message!);
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _getMessagePinPrivate() async {
    await sicixUIRepository
        .conversationPin(
            conversation.id ?? -1, MessagePin.MESSAGE_PIN_PRIVATE, 0, 10)
        .then((response) async {
      if (response.success) {
        messagePinPrivates.value = response.data?.content ?? [];
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: response.message!);
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callUploadFile(File file) async {
    await EasyLoading.show();
    await sicixUIRepository
        .uploadFile([file], UploadFileRequest.chat()).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        final content = <MediaFile>[];
        var type = MessageContentEvent.TYPE_FILE;
        (response.data ?? []).forEach((uploadFile) {
          type = uploadFile.getMediaType();
          if (uploadFile.file != null) {
            content.add(uploadFile.getMediaFile());
          }
        });
        if (content.isEmpty) {
          return;
        }

        final message = RequestMessageWS(
            id: const Uuid().v4().replaceAll('-', ''),
            convId: conversation.id,
            cid: AppDataGlobal.cid,
            type: type,
            content: content);
        printInfo(info: 'send message ${message.toJson()}');

        try {
          webSocketChannel?.sink.add(jsonEncode(message));
        } catch (e) {
          printError(info: 'send message ${e.toString()}');
        }
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: response.message!);
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callUpdateBackgroundTheme(ConversationTheme theme) async {
    await EasyLoading.show();
    await sicixUIRepository
        .changeConversationTheme(
            conversation.id ?? -1, ConversationThemeRequest(theme))
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        printInfo(info: 'change background theme success');
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callReactionMesssage(
      int indexMessage, Reaction reaction) async {
    await EasyLoading.show();
    await sicixUIRepository
        .reactionMessage(
            ReactionRequest(messageItems[indexMessage].id ?? '', reaction.key))
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success && response.data != null) {
        final messageItem = messageItems[indexMessage];
        messageItem.reaction = response.data;
        await _updateMessage(messageItem, indexMessage: indexMessage);
      } else if (!response.success && (response.message?.isNotEmpty ?? false)) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callEditMesssage(
      MessageItem currentMessage, ChatMessage editMessage) async {
    await EasyLoading.show();
    await sicixUIRepository
        .editMessage(
            editMesssage.value?.id ?? '', MessageRequest(editMessage.text))
        .then((response) async {
      if (response.success) {
        messageItems
            .firstWhereOrNull((element) => currentMessage.id == element.id)
            ?.content = editMessage.text;
        chatMessages
            .firstWhereOrNull((element) =>
                currentMessage.id == element.customProperties?[MessageItem.ID])
            ?.text = editMessage.text;
        chatMessages.refresh();
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
      await EasyLoading.dismiss();
    }).catchError((onError) {
      printError(info: onError.toString());
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callDeleteMesssage(String messageDeleteId) async {
    await EasyLoading.show();
    return sicixUIRepository
        .deleteMessage(messageDeleteId)
        .then((response) async {
      if (response.success) {
        messageItems.removeWhere((element) => messageDeleteId == element.id);
        chatMessages.removeWhere((element) =>
            messageDeleteId == element.customProperties?[MessageItem.ID]);
      } else if (response.message?.isNotEmpty ?? false) {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
      await EasyLoading.dismiss();
    }).catchError((onError) {
      printError(info: onError.toString());
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future _callPinMesssage(MessageItem pinMessage, bool isGourp) async {
    await EasyLoading.show();
    await sicixUIRepository
        .pin(
            conversation.id ?? -1,
            PinRequest(
                pinMessage.id ?? '',
                isGourp
                    ? MessagePin.MESSAGE_PIN_GROUP
                    : MessagePin.MESSAGE_PIN_PRIVATE))
        .then((response) async {
      if (response.success) {
        await EasyLoading.showSuccess('chat.pin.success'.tr);
        if (isGourp) {
          await _getMessagePinGroup();
        } else {
          await _getMessagePinPrivate();
        }
      } else if (response.message?.isNotEmpty ?? false) {
        await EasyLoading.dismiss();
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<MediaFile?> _getMediaFileInfo(MediaFile mediaFile) async {
    return sicixUIRepository
        .mediaFileInfo(mediaFile.id ?? '')
        .then((response) async {
      if (response.success) {
        return response.data;
      } else {
        return null;
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      return null;
    });
  }

  Future<UserInfo?> _loadUser(String userId) async {
    return UserInfoService.getUserProfileHCMFromId(userId, onError: (message) {
      printError(info: message);
    }, onMappingError: (message) {
      printError(info: message);
    });
  }
}
