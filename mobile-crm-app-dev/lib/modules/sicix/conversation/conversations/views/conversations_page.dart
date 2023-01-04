import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/button/widget_button_selection_underline.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_badge.dart';
import '../../../../../shared/widgets/widget_loading.dart';
import '../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../controllers/conversations_controller.dart';
import 'conversation_cell.dart';

class ConversationsPage extends GetView<ConversationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'conversations.title'.tr,
          style: AppTextStyle.heavy(fontSize: 20),
        ),
        leading: Obx(
          () => IconButton(
            onPressed: controller.onChangeCompany,
            icon: WidgetAvatar(
              size: 32,
              fit: BoxFit.contain,
              isUrl: true,
              name: controller.companySelected.value?.name ?? '',
              avatar: controller.companySelected.value?.getAvatar(),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: controller.onSearch,
            icon: FCoreImage(
              IconConstants.icSearch,
              width: 32,
              height: 32,
            ),
          ),
          PopupMenuButton(
            icon: FCoreImage(
              IconConstants.icMenu,
              width: 32,
              height: 32,
            ),
            itemBuilder: (context) => _getMenuItemOption(),
            onSelected: controller.onMenu,
          ),
        ],
      ),
      body: _buildBodyContent(),
    );
  }

  List<PopupMenuEntry<int>> _getMenuItemOption() {
    final menuItemOptions = <PopupMenuEntry<int>>[];
    for (var i = 0; i < controller.menuMessengerItems.length; i++) {
      menuItemOptions.add(PopupMenuItem<int>(
        value: controller.menuMessengerItems[i].id,
        child: Row(
          children: [
            FCoreImage(
              controller.menuMessengerItems[i].icon ?? '',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 14),
            Text(
              controller.menuMessengerItems[i].title.tr,
              style: AppTextStyle.regular(),
            )
          ],
        ),
      ));
      if (i < controller.menuMessengerItems.length - 1) {
        menuItemOptions.add(const PopupMenuDivider(height: 1));
      }
    }
    return menuItemOptions;
  }

  Widget _buildBodyContent() {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const WidgetCenterLoading();
        } else if (controller.conversations.isEmpty) {
          return _buildEmptyMessage();
        } else {
          return _buildMessages();
        }
      },
    );
  }

  Widget _buildEmptyMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FCoreImage(
            IconConstants.icMessengerEmpty,
            width: Get.width * 0.46,
          ),
          const SizedBox(height: 30),
          Text(
            'conversations.empty'.tr,
            style: AppTextStyle.heavy(
              color: AppColor.sixTextColorLight,
              fontSize: 23,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessages() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(
            () => Row(
              children: [
                Expanded(
                  child: WidgetButtonSelectionUnderline(
                    title: 'conversations.all'.tr,
                    isSelected: controller.menuTopIndex.value ==
                        ConversationsController.MENU_ALL,
                    onTap: () => controller
                        .onSelectionMenu(ConversationsController.MENU_ALL),
                  ),
                ),
                Expanded(
                  child: WidgetButtonSelectionUnderline(
                    title: 'conversations.unread'.tr,
                    isSelected: controller.menuTopIndex.value ==
                        ConversationsController.MENU_UNREAD,
                    onTap: () => controller
                        .onSelectionMenu(ConversationsController.MENU_UNREAD),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: _buildConversation()),
      ],
    );
  }

  Widget _buildConversation() {
    return Obx(() {
      final isMore = controller.isMore.value;
      final conversations = controller.conversations
          .where((conversation) =>
              controller.menuTopIndex.value ==
                  ConversationsController.MENU_ALL ||
              conversation.isBadge())
          .toList();
      return WidgetScrollviewRefresher(
        refreshController: controller.refreshController,
        onRefresh: controller.onRefresh,
        onLoading: controller.onLoading,
        isLoadMore: isMore,
        child: ListView.builder(
          itemCount: conversations.length,
          itemBuilder: (BuildContext context, int index) => ConversationCell(
            conversations[index],
            onTap: () => controller.onConversation(conversations[index]),
          ),
        ),
      );
    });
  }

  Widget _buildMessageCell(Conversation conversation) {
    return InkWell(
      onTap: () => controller.onConversation(conversation),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          children: [
            WidgetAvatar(
              size: 64,
              isUrl: true,
              avatar: conversation.getAvatar(),
              name: conversation.getName(),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    conversation.name ?? '',
                    maxLines: 1,
                    style: AppTextStyle.heavy(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    conversation.getMessageContent(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.regular(
                      color: AppColor.niceTextColorLight,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  conversation.getTime(),
                  style: AppTextStyle.regular(
                    color: AppColor.niceTextColorLight,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    conversation.notice == 0
                        ? Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: FCoreImage(
                              IconConstants.icMute,
                              width: 16,
                              height: 16,
                            ),
                          )
                        : Container(),
                    (conversation.current?.unread != 0)
                        ? WidgeBadge(
                            conversation.current?.getUnread() ?? '',
                            margin: const EdgeInsets.only(left: 8),
                          )
                        : Container(),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
