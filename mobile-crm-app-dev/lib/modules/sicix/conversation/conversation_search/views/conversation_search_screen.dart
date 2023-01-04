import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/theme/theme_decoration.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/messenger/widget_search_account_cell.dart';
import '../../../../../shared/widgets/widget_loading.dart';
import '../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../../../../../shared/widgets/widget_search_empty.dart';
import '../../../../../shared/widgets/widget_touch_hide_keyboard.dart';
import '../controllers/conversation_search_controller.dart';

class ConversationSearchScreen extends GetView<ConversationSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColor.primaryBackgroundColor,
        leadingWidth: 72,
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: controller.onBack,
            icon: FCoreImage(
              IconConstants.icBack,
              width: 40,
              height: 40,
            ),
          ),
        ),
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
            decoration: ThemeDecoration.searchInputDecoration(),
            onChanged: (value) => controller.onChangedSearh(value),
            onSubmitted: (value) => controller.onSubmittedSearh(value),
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
        } else if (controller.conversations.isEmpty) {
          return WidgetSearchEmpty();
        } else {
          return _buildConversation();
        }
      },
    );
  }

  Widget _buildConversation() {
    return Obx(() {
      final isMore = controller.isMore.value;
      final conversations = controller.conversations;
      return WidgetScrollviewRefresher(
        refreshController: controller.refreshController,
        onRefresh: controller.onRefresh,
        onLoading: controller.onLoading,
        isLoadMore: isMore,
        child: ListView.builder(
          itemCount: conversations.length,
          itemBuilder: (BuildContext context, int index) =>
              WidgetSearchAccountCell(
            avatar: conversations[index].getAvatar(),
            name: conversations[index].getName(),
            onTap: () => controller.onConversation(conversations[index]),
          ),
        ),
      );
    });
  }
}
