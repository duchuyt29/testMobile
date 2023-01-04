import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_notification.dart';
import '../controllers/profile_detail_controller.dart';

class ProfileDetailView extends GetView<ProfileDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.canvasColor,
      appBar: AppBar(
        title: Text(
          'account.change_profile.title'.tr,
          style: AppTextStyle.heavy(
            color: AppColor.secondTextColor,
          ),
        ),
      ),
      body: _buildBodyContent(),
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
              const SizedBox(height: 20),
              _buildUsernameInfo(),
              const SizedBox(height: 20),
              _buildPhoneAndBirthdayInput(),
              const SizedBox(height: 20),
              _buildEmailInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFullnameInput() {
    return _buildContent(
      title: 'account.change_profile.name'.tr,
      controller: controller.nameController,
    );
  }

  Widget _buildUsernameInfo() {
    return _buildContent(
      title: 'account.change_profile.username'.tr,
      controller: controller.usernameController,
    );
  }

  Widget _buildEmailInfo() {
    return _buildContent(
      title: 'account.change_profile.email'.tr,
      controller: controller.emailController,
    );
  }

  Widget _buildPhoneAndBirthdayInput() {
    return Row(
      children: [
        Expanded(
          child: _buildContent(
            title: 'account.change_profile.phone_number'.tr,
            controller: controller.phoneController,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _buildContent(
            title: 'account.change_profile.birthday'.tr,
            controller: controller.birthdayController,
            suffixIcon:
                FCoreImage(IconConstants.iconDate, width: 20, height: 20),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return Stack(
      children: [
        Obx(
          () => WidgetAvatar(
            size: 100.0,
            avatar: controller.userInfo.value?.getAvatar(),
            name: controller.userInfo.value?.getName(),
          ),
        ),
        Positioned(
            right: 0.0,
            bottom: 0.0,
            child: InkWell(
              onTap: controller.onChangeAvatar,
              child: Container(
                  width: 32.0,
                  height: 32.0,
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.baseColor,
                    border: Border.all(
                      color: AppColor.canvasColor,
                      width: 3.0,
                    ),
                  ),
                  child: FCoreImage(
                    IconConstants.iconCamera,
                  )),
            )),
      ],
    );
  }

  Widget _buildContent({
    required title,
    TextEditingController? controller,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.heavy(
            fontSize: 16,
            color: AppColor.thirdTextColor,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          style: AppTextStyle.heavy(fontSize: 16),
          readOnly: true,
          decoration: InputDecoration(
            suffixIcon: suffixIcon == null
                ? null
                : Container(
                    alignment: Alignment.centerLeft,
                    child: suffixIcon,
                  ),
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 20, maxWidth: 44),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ],
    );
  }
}
