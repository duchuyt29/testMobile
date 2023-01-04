import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/theme/theme_decoration.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/messenger/widget_user_create_chat_cell.dart';
import '../../../../../shared/widgets/messenger/widget_user_selected.dart';
import '../../../../../shared/widgets/widget_loading.dart';
import '../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../../../../../shared/widgets/widget_search_empty.dart';
import '../../../../../shared/widgets/widget_touch_hide_keyboard.dart';
import '../controllers/create_group_conversation_controller.dart';

class CreateGroupConversationView
    extends GetView<CreateGroupConversationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'messenger.create.group'.tr,
          style: AppTextStyle.heavy(
            color: AppColor.secondTextColor,
            fontSize: 20,
          ),
        ),
        actions: [
          TextButton(
            onPressed: controller.onCreate,
            child: Text(
              'create'.tr,
              style: AppTextStyle.heavy(color: AppColor.secondTextColor),
            ),
          ),
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
        _builfInfoGroup(),
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

  Widget _builfInfoGroup() {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: TextField(
        controller: controller.groupNameController,
        decoration: ThemeDecoration.inputNoneBorder.copyWith(
          hintText: 'messenger.create.group.name.hint'.tr,
          hintStyle: AppTextStyle.regular(
            color: AppColor.primaryHintColor,
            fontSize: 18,
          ),
        ),
      ),

      // Row(
      //   children: [
      //     InkWell(
      //       onTap: controller.onSelectGroupAvatar,
      //       child: ClipOval(
      //         child: Obx(
      //           () => SizedBox.fromSize(
      //             size: const Size.fromRadius(28),
      //             child: FCoreImage(
      //               controller.groupAvatar.value?.path ??
      //                   IconConstants.icCamera,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(width: 16),
      //     Expanded(
      //       child: TextField(
      //         controller: controller.groupNameController,
      //         decoration: ThemeDecoration.inputNoneBorder.copyWith(
      //           hintText: 'messenger.create.group.name.hint'.tr,
      //           hintStyle: AppTextStyle.regular(
      //             color: AppColor.primaryHintColor,
      //             fontSize: 18,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
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
      () => controller.userSelecteds.isEmpty
          ? Container()
          : SizedBox(
              height: 70,
              child: Obx(
                () => ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: controller.userSelecteds.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 16);
                  },
                  itemBuilder: (BuildContext context, int index) =>
                      WidgetUserSelected(
                    userInfo: controller.userSelecteds[index],
                    onPressed: () => controller
                        .onDeselectUser(controller.userSelecteds[index]),
                  ),
                ),
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
              controller.userSelecteds.any(
                  (element) => element.id == controller.userInfos[index].id),
              onSelection: (userInfo) => controller.onSelectUser(userInfo),
            ),
          );
        },
      ),
    );
  }
}
