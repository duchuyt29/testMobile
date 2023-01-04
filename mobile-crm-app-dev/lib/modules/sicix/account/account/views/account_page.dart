import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_notification.dart';
import '../controllers/account_controller.dart';

class AccountPage extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
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
        const SizedBox(height: 44),
        _buildUserInfo(),
        const Divider(height: 1),
        _buildChangePassword(
          IconConstants.icSettingPassword,
          'account.change_password.label'.tr,
          onTap: controller.onChangePassword,
        ),
        const Divider(height: 1),
        _buildChangePassword(
          IconConstants.icSettingCompany,
          'account.change_company.label'.tr,
          onTap: controller.onChangeCompany,
        ),
        const Divider(height: 1),
        Obx(
          () => _buildNotification(
            IconConstants.icSettingNotification,
            'account.general_notification.label'.tr,
            controller.isNotification.value,
            onChanged: controller.onNotificationChanged,
          ),
        ),
        const Divider(height: 1),
        Obx(
          () => _buildChangePassword(
            IconConstants.icSettingNetwork,
            'account.change_language.label'.tr,
            value: controller.language.value,
            onTap: controller.onChangeLanguage,
          ),
        ),
        const Divider(height: 1),
        _buildLogout(),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Stack(
            children: [
              Obx(
                () => Container(
                  padding: const EdgeInsets.only(right: 20, bottom: 20),
                  child: WidgetAvatar(
                    size: 100,
                    isUrl: true,
                    border: 0.5,
                    avatar: controller.avatar.value,
                    name: controller.name.value,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: IconButton(
                  onPressed: controller.onViewDetail,
                  icon: FCoreImage(IconConstants.icSettingEdit,
                      width: 32, height: 32),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.name.value,
                      style: AppTextStyle.heavy(fontSize: 23),
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
                            color: AppColor.secondTextColor, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChangePassword(
    String icon,
    String title, {
    GestureTapCallback? onTap,
    String? value,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            FCoreImage(icon, width: 48, height: 48),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.heavy(fontSize: 16),
              ),
            ),
            (value?.isEmpty ?? true)
                ? Container()
                : Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: Text(
                      value!,
                      style: AppTextStyle.regular(fontSize: 16),
                    ),
                  ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 8),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotification(
    String icon,
    String title,
    bool value, {
    GestureTapCallback? onTap,
    ValueChanged<bool>? onChanged,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            FCoreImage(icon, width: 48, height: 48),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.heavy(fontSize: 16),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 8),
              child: CupertinoSwitch(
                value: value,
                onChanged: onChanged,
                activeColor: AppColor.secondButtonColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogout() {
    return InkWell(
      onTap: controller.onLogout,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            FCoreImage(IconConstants.icSettingLogout, width: 48, height: 48),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'logout.title'.tr,
                style: AppTextStyle.heavy(
                    fontSize: 16, color: AppColor.errorColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
