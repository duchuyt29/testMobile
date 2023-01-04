import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/theme/theme_decoration.dart';
import '../../../../../shared/widgets/messenger/widget_user_create_chat_cell.dart';
import '../../../../../shared/widgets/messenger/widget_user_selected.dart';
import '../../../../../shared/widgets/widget_loading.dart';
import '../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../../../../../shared/widgets/widget_search_empty.dart';
import '../../../../../shared/widgets/widget_touch_hide_keyboard.dart';
import '../controllers/create_personal_conversation_controller.dart';

class CreatePersonalConversationView
    extends GetView<CreatePersonalConversationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'messenger.create.personal'.tr,
          style: AppTextStyle.heavy(
            color: AppColor.secondTextColor,
            fontSize: 20,
          ),
        ),
        actions: [
          Obx(
            () => TextButton(
              onPressed: controller.userSelected.value == null
                  ? null
                  : controller.onCreate,
              child: Text(
                'create'.tr,
                style: AppTextStyle.heavy(color: AppColor.secondTextColor),
              ),
            ),
          )
        ],
      ),
      body: WidgetTouchHideKeyBoard(
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSearchBar(),
        _buildSelectedUser(),
        const Divider(height: 28, thickness: 4),
        Expanded(
          child: Obx(
            () {
              if (controller.isLoading.value) {
                return const WidgetCenterLoading();
              } else if (controller.userInfos.isEmpty) {
                return WidgetSearchEmpty();
              } else {
                return _buildAllUser();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColor.secondBackgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller.searchController,
        textInputAction: TextInputAction.search,
        decoration: ThemeDecoration.searchInputDecoration(
          hintText: 'messenger.create.search'.tr,
        ),
        onChanged: (value) => controller.onSubmittedSearh(value),
      ),
    );
  }

  Widget _buildSelectedUser() {
    return Obx(
      () => controller.userSelected.value == null
          ? Container()
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: WidgetUserSelected(
                userInfo: controller.userSelected.value!,
                onPressed: controller.onDeselectUser,
              ),
            ),
    );
  }

  Widget _buildAllUser() {
    return WidgetScrollviewRefresher(
      refreshController: controller.refreshController,
      onRefresh: controller.onRefresh,
      onLoading: controller.onLoading,
      isLoadMore: controller.isMore.value,
      child: ListView.builder(
        itemCount: controller.userInfos.length,
        itemBuilder: (BuildContext context, int index) {
          return Obx(
            () => WidgetUserCreateChatCell(
              controller.userInfos[index],
              controller.userSelected.value?.id ==
                  controller.userInfos[index].id,
              onSelection: (userInfo) => controller.onSelectUser(userInfo),
            ),
          );
        },
      ),
    );
  }
}
