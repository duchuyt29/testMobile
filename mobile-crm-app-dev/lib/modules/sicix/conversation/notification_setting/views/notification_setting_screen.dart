import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/services/path_service.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/theme/theme_decoration.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_loading.dart';
import '../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../../../../../shared/widgets/widget_search_empty.dart';
import '../../../../../shared/widgets/widget_touch_hide_keyboard.dart';
import '../controllers/notification_setting_controller.dart';

class NotificationSettingScreen extends GetView<NotificationSettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'messenger.menu.notification.setting'.tr,
          style: AppTextStyle.heavy(
            color: AppColor.secondTextColor,
            fontSize: 20,
          ),
        ),
        // leading: TextButton(
        //   onPressed: Get.back,
        //   child: Text(
        //     'cancel'.tr,
        //     style: AppTextStyle.heavy(color: AppColor.secondTextColor),
        //   ),
        // ),
        // actions: [
        //   TextButton(
        //     onPressed: controller.onSave,
        //     child: Text(
        //       'save'.tr,
        //       style: AppTextStyle.heavy(color: AppColor.secondTextColor),
        //     ),
        //   ),
        // ],
      ),
      body: WidgetTouchHideKeyBoard(
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchBar(),
          const SizedBox(height: 12),
          _buildNotifySettingButton(),
          const SizedBox(height: 12),
          Obx(
            () => controller.conversations.isEmpty
                ? Container()
                : Text(
                    'messenger.conversation.title'.tr,
                    style: AppTextStyle.heavy(
                      color: AppColor.fourthTextColor,
                      fontSize: 14,
                    ),
                  ),
          ),
          Expanded(child: _buildConversation()),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.secondBackgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller.searchController,
        textInputAction: TextInputAction.search,
        decoration: ThemeDecoration.searchInputDecoration(),
        onChanged: (value) => controller.onSubmittedSearh(value),
      ),
    );
  }

  Widget _buildNotifySettingButton() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextButton.icon(
              onPressed: () => controller.onAllNotificaiton(),
              icon: FCoreImage(
                IconConstants.icNotifyOn,
                width: 20,
                height: 20,
              ),
              label: Text(
                'messenger.on.all.notify'.tr,
                maxLines: 2,
                style: AppTextStyle.heavy(
                  color: AppColor.sixTextColorLight,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextButton.icon(
              onPressed: () => controller.offAllNotificaiton(),
              icon: FCoreImage(
                IconConstants.icNotifyOff,
                width: 20,
                height: 20,
              ),
              label: Text(
                'messenger.off.all.notify'.tr,
                maxLines: 2,
                style: AppTextStyle.heavy(
                  color: AppColor.sixTextColorLight,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConversation() {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const WidgetCenterLoading();
        } else if (controller.conversations.isEmpty) {
          return WidgetSearchEmpty();
        } else {
          return Obx(() {
            final isMore = controller.isMore.value;
            final conversations = controller.conversations;
            return SafeArea(
              child: WidgetScrollviewRefresher(
                refreshController: controller.refreshController,
                onRefresh: controller.onRefresh,
                onLoading: controller.onLoading,
                isLoadMore: isMore,
                child: ListView.builder(
                  itemCount: conversations.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _buildNotifySettingCell(
                    conversations[index],
                    onChanged: (value) =>
                        controller.onChangeNotify(index, value),
                  ),
                ),
              ),
            );
          });
        }
      },
    );
  }

  Widget _buildNotifySettingCell(Conversation conversation,
      {ValueChanged<bool>? onChanged}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          WidgetAvatar(
            size: 64,
            avatar: PathService.imagePath(conversation.avatar),
            name: conversation.name ?? '',
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              conversation.name ?? '',
              maxLines: 1,
              style: AppTextStyle.heavy(),
            ),
          ),
          const SizedBox(width: 10),
          CupertinoSwitch(
            value: conversation.notice == 1,
            onChanged: onChanged,
            activeColor: AppColor.secondButtonColor,
          ),
        ],
      ),
    );
  }
}
