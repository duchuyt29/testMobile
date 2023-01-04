import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_notification.dart';
import '../controllers/settings_controllers.dart';

class SettingsPage extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: _buildBodyContent(),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        _buildHeaderContent(),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            buildBackToMainMenuListTile(),
          ],
        ),
        Container(
          height: 5,
          color: Colors.grey.shade200,
        ),
        _buildListTile(
            leading: const Icon(Icons.list),
            title: 'crm.settings.menu'.tr,
            onTap: () {}),
        _buildListTile(
            leading: FCoreImage(
              ImageConstants.crmLead,
              width: 24,
              height: 24,
            ),
            title: 'crm.settings.notification'.tr,
            onTap: () {}),
        _buildListTile(
          leading: const Icon(Icons.list),
          title: 'crm.settings.status'.tr,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildListTile({
    required Widget leading,
    required String title,
    required Function onTap,
    Widget? trailing,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: ListTile(
        leading: leading,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        title: Text(title),
        trailing: trailing ?? const SizedBox(),
        onTap: () {
          onTap();
        },
      ),
    );
  }

  Widget buildBackToMainMenuListTile() {
    return ListTile(
      leading: Container(
        width: 35,
        child: const Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      title: Text('back.to.main.menu'.tr),
      onTap: Get.back,
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Obx(
                () => Container(
                  padding: const EdgeInsets.only(right: 20, bottom: 20),
                  child: WidgetAvatar(
                    size: 50,
                    isUrl: true,
                    border: 0.5,
                    avatar: controller.avatar.value,
                    name: controller.name.value,
                  ),
                ),
              ),
              Positioned(
                right: 5,
                bottom: 5,
                child: IconButton(
                  onPressed: controller.onViewDetail,
                  icon: FCoreImage(IconConstants.icSettingEdit,
                      width: 20, height: 20),
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.name.value,
                    style: AppTextStyle.heavy(fontSize: 20),
                  ),
                  if (controller.phone.value.isNotEmpty)
                    Text(
                      controller.phone.value,
                      style: AppTextStyle.regular(),
                    ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 6),
                    decoration: BoxDecoration(
                      color: AppColor.buttonBackgroundColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      controller.companySelected.value?.name ?? '',
                      style: AppTextStyle.heavy(
                          color: AppColor.secondTextColor, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildHeaderContent() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.blue.shade600,
            width: 2,
          ),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Obx(() => controller.isNotification.value
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: WidgetNotification(
                    content: controller.notificationMessage.value,
                    marginBottom: 0.0,
                    backgroundColor: controller.isBlueNotification.value
                        ? AppColor.pollBackgroundColor
                        : null,
                    iconColor: controller.isBlueNotification.value
                        ? AppColor.stateInfoColor
                        : null,
                    textColor: controller.isBlueNotification.value
                        ? AppColor.stateInfoColor
                        : null,
                  ),
                )
              : Container()),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildUserInfo(),
              ),
              const SizedBox(width: 16),
              Row(
                children: [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.search,
                        color: Colors.blue.shade700,
                      )),
                  IconButton(
                      onPressed: null,
                      icon: Icon(Icons.notifications,
                          color: Colors.blue.shade700)),
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'settings'.tr,
                style: AppTextStyle.bold(
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
