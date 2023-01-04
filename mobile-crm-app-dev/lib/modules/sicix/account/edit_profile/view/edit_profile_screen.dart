import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_error.dart';
import '../../../../../shared/widgets/widget_notification.dart';
import '../../../../../shared/widgets/widget_touch_hide_keyboard.dart';
import '../controller/edit_profile_controller.dart';

part 'edit_profile_extension.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.canvasColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(result: controller.userInfo),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColor.canvasColor,
          ),
        ),
        title: Text(
          'account.change_profile.title'.tr,
          style: AppTextStyle.heavy(
            color: AppColor.secondTextColor,
          ),
        ),
        actions: [
          InkWell(
            onTap: controller.onChange,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  'save'.tr,
                  style: AppTextStyle.heavy(color: AppColor.secondTextColor),
                ),
              ),
            ),
          ),
        ],
      ),
      body: WidgetTouchHideKeyBoard(
        child: _buildBodyContent(),
      ),
      bottomNavigationBar: TextButton(
        onPressed: controller.onRemoveAccount,
        child: Text(
          'remove.account'.tr,
          style: AppTextStyle.heavy(fontSize: 16, color: AppColor.errorColor),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => controller.notification.value != null
                  ? WidgetNotification(
                      content: controller.notification.value!,
                    )
                  : const SizedBox(height: 24.0)),
              _buildAvatar(),
              const SizedBox(height: 24),
              _buildFullnameInput(),
              Obx(
                () => controller.errorName.value != null
                    ? controller.errorName.value!.isNotEmpty
                        ? WidgetError(error: controller.errorName.value!)
                        : Container()
                    : Container(),
              ),
              const SizedBox(height: 20),
              _buildUsernameInfo(),
              const SizedBox(height: 20),
              _buildPhoneAndBirthdayInput(),
              Obx(() => controller.errorPhone.value != null &&
                      controller.errorBirthday.value != null
                  ? WidgetError(
                      error:
                          '${controller.errorPhone.value!}, ${controller.errorBirthday.value!}')
                  : controller.errorBirthday.value != null
                      ? WidgetError(error: controller.errorBirthday.value!)
                      : controller.errorPhone.value != null
                          ? WidgetError(error: controller.errorPhone.value!)
                          : Container()),
              const SizedBox(height: 20),
              _buildEmailInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFullnameInput() {
    return _buildInputArea(
      title: 'account.change_profile.name'.tr,
      hint: 'account.change_profile.hint_name'.tr,
      controller: controller.nameController,
      formatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(controller.source)),
      ],
    );
  }

  Widget _buildUsernameInfo() {
    return _buildInputArea(
      title: 'account.change_profile.username'.tr,
      hint: 'account.change_profile.hint_username'.tr,
      controller: controller.usernameController,
      isReadOnly: true,
    );
  }

  Widget _buildEmailInfo() {
    return _buildInputArea(
      title: 'account.change_profile.email'.tr,
      hint: 'account.change_profile.hint_email'.tr,
      controller: controller.emailController,
      inputType: TextInputType.emailAddress,
      isReadOnly: true,
    );
  }

  Widget _buildPhoneAndBirthdayInput() {
    return Row(
      children: [
        Expanded(
          child: _buildInputArea(
            title: 'account.change_profile.phone_number'.tr,
            hint: 'account.change_profile.hint_phone'.tr,
            inputType: TextInputType.phone,
            controller: controller.phoneController,
            formatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ],
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _buildInputArea(
            title: 'account.change_profile.birthday'.tr,
            hint: 'account.change_profile.hint_birthday'.tr,
            controller: controller.birthdayController,
            isRequired: false,
            isReadOnly: true,
            onSelection: () => controller.onChooseBirthday(),
            suffixIcon:
                FCoreImage(IconConstants.iconDate, width: 20, height: 20),
          ),
        ),
      ],
    );
  }
}
