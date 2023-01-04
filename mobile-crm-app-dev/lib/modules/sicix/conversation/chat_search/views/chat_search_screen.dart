import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ui_api/sicix_api/models/chat/message_data/message_item.dart';

import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/theme/theme_decoration.dart';
import '../../../../../shared/utils/date_util.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_loading.dart';
import '../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../../../../../shared/widgets/widget_search_empty.dart';
import '../../../../../shared/widgets/widget_touch_hide_keyboard.dart';
import '../controllers/chat_search_controller.dart';

class ChatSearchScreen extends GetView<ChatSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leadingWidth: 72,
        title: Container(
          height: 45,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: AppColor.secondBackgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            controller: controller.searchController,
            textInputAction: TextInputAction.search,
            autofocus: true,
            decoration: ThemeDecoration.searchInputDecoration(
                hintText: 'chat.search'.tr),
            onChanged: (value) => controller.onSubmittedSearh(value),
          ),
        ),
      ),
      body: WidgetTouchHideKeyBoard(
        child: SafeArea(
          child: _buildBodyContent(),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Obx(
      () {
        if (controller.isLoading.value == null) {
          return Container();
        } else if (controller.isLoading.value!) {
          return const WidgetCenterLoading();
        } else if (controller.messagesFound.isEmpty) {
          return WidgetSearchEmpty();
        } else {
          return Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'chat.search.result'
                    .trArgs([controller.messagesFound.length.toString()]),
                style: AppTextStyle.regular(color: AppColor.primaryHintColor),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: _buildConversation(),
              )
            ],
          );
        }
      },
    );
  }

  Widget _buildConversation() {
    return Obx(() {
      final isMore = controller.isMore.value;
      final messagesFound = controller.messagesFound;
      return WidgetScrollviewRefresher(
        refreshController: controller.refreshController,
        onRefresh: controller.onRefresh,
        onLoading: controller.onLoading,
        isLoadMore: isMore,
        child: ListView.separated(
            itemCount: messagesFound.length,
            separatorBuilder: (context, index) => const SizedBox(height: 1),
            itemBuilder: (BuildContext context, int index) =>
                _buildConversationCell(messagesFound[index])),
      );
    });
  }

  Widget _buildConversationCell(MessageItem message) {
    return InkWell(
      onTap: () => controller.onMessage(message),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            WidgetAvatar(
              size: 40,
              avatar: message.user.profileImage,
              name: message.user.getFullName(),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.user.getFullName(),
                    style: AppTextStyle.regular(),
                    maxLines: 1,
                  ),
                  Text(
                    message.getSumaryContent(),
                    style: AppTextStyle.regular(
                      color: AppColor.fourthTextColor,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text(
              message.createDate == null
                  ? ''
                  : DateUtils.isSameDay(message.createDate!, DateTime.now())
                      ? 'today'.tr
                      : DateUtil.formatDatetimeToString(message.createDate),
              style: AppTextStyle.regular(
                color: AppColor.fourthTextColor,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
