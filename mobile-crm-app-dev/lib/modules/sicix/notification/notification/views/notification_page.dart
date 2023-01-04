import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_loading.dart';
import '../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../controllers/notification_controller.dart';
import 'notification_cell.dart';

class NotificationPage extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text(
          'notification.title'.tr,
          style: AppTextStyle.heavy(
            fontSize: 20,
            color: AppColor.secondTextColor,
          ),
        ),
        leading: IconButton(
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
      body: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const WidgetCenterLoading();
        } else if (controller.notifications.isEmpty) {
          return _buildEmptyNotification();
        } else {
          return _buildNotifications();
        }
      },
    );
  }

  Widget _buildEmptyNotification() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FCoreImage(
            ImageConstants.notifyEmpty,
            width: Get.width * 0.46,
          ),
          const SizedBox(height: 24),
          Text(
            'notification.empty'.tr,
            style: AppTextStyle.heavy(
              color: AppColor.sixTextColorLight,
              fontSize: 23,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotifications() {
    return Obx(() {
      final isMore = controller.isMore.value;
      final conversations = controller.notifications;
      return WidgetScrollviewRefresher(
        refreshController: controller.refreshController,
        onRefresh: controller.onRefresh,
        onLoading: controller.onLoading,
        isLoadMore: isMore,
        child: ListView.builder(
          itemCount: conversations.length,
          itemBuilder: (BuildContext context, int index) => NotificationCell(
            notification: controller.notifications[index],
            onTap: () =>
                controller.onReadNotification(controller.notifications[index]),
          ),
        ),
      );
    });
  }
}
