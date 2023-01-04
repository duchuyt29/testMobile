import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_error.dart';
import '../../../../../shared/widgets/widget_touch_hide_keyboard.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WidgetTouchHideKeyBoard(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.center,
            child: _buildBodyContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
      child: Form(
        key: controller.formGlobalKey,
        child: Column(
          children: [
            FCoreImage(
              ImageConstants.appIcon,
              width: Get.width * 0.28,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 24),
            Text(
              'login.title'.tr,
              style: AppTextStyle.heavy(fontSize: 29),
            ),
            const SizedBox(height: 40),
            _buildInputUsername(),
            const SizedBox(height: 24),
            _buildInputPassword(),
            const SizedBox(height: 16),
            _buildSaveLogin(),
            const SizedBox(height: 40),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputUsername() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
          child: RichText(
            text: TextSpan(
              style: AppTextStyle.heavy(color: AppColor.thirdTextColor),
              children: [
                TextSpan(text: 'login.account.title'.tr),
                TextSpan(
                  text: '*',
                  style: AppTextStyle.heavy(color: AppColor.errorColor),
                ),
              ],
            ),
          ),
        ),
        TextFormField(
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'login.input.email.title'.tr,
            errorStyle: const TextStyle(height: 0),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
          ],
          validator: (email) => controller.validatorEmail(email),
        ),
        Obx(
          () => (controller.errorEmail.value.isEmpty)
              ? Container()
              : WidgetError(error: controller.errorEmail.value),
        )
      ],
    );
  }

  Widget _buildInputPassword() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
          child: RichText(
            text: TextSpan(
              style: AppTextStyle.heavy(color: AppColor.thirdTextColor),
              children: [
                TextSpan(text: 'login.input.pass.title'.tr),
                TextSpan(
                  text: '*',
                  style: AppTextStyle.heavy(color: AppColor.errorColor),
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => TextFormField(
            controller: controller.passwordController,
            obscureText: !controller.isShowPassword.value,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'login.input.pass.hint'.tr,
              suffixIcon: IconButton(
                onPressed: () {
                  controller.isShowPassword.value =
                      !controller.isShowPassword.value;
                },
                icon: Icon(
                  controller.isShowPassword.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColor.neutral,
                  size: 20,
                ),
              ),
              // errorMaxLines: 1,
              // errorText: '',
              errorStyle: const TextStyle(height: 0),
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(32),
            ],
            validator: (password) => controller.validatorPass(password),
          ),
        ),
        Obx(
          () => (controller.errorPassword.value.isEmpty)
              ? Container()
              : WidgetError(error: controller.errorPassword.value),
        )
      ],
    );
  }

  Widget _buildSaveLogin() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => TextButton(
              onPressed: controller.onSavePassword,
              child: Row(
                children: [
                  FCoreImage(
                    controller.isSaveLogin.value
                        ? IconConstants.icCheckboxOn
                        : IconConstants.icCheckboxOff,
                    width: 14,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'login.save.login'.tr,
                    style: AppTextStyle.heavy(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: controller.onForgotPassword,
            child: Text(
              'forgot.title'.tr,
              style: AppTextStyle.heavy(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return WidgetButton(
      title: 'login.title'.tr,
      onPressed: controller.onLogin,
    );
  }
}
