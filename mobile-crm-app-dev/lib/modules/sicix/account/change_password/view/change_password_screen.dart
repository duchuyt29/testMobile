import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_error.dart';
import '../controller/change_password_controller.dart';

part 'change_password_extension.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.canvasColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColor.canvasColor,
          ),
        ),
        title: Text(
          'change.password.title'.tr,
          style: AppTextStyle.heavy(
            fontSize: 18.0,
            color: AppColor.secondTextColor,
          ),
        ),
        actions: [
          InkWell(
            onTap: controller.onChangePassword,
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
      body: SingleChildScrollView(
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _buildCurrentPass(),
          const SizedBox(height: 24),
          _buildNewPassword(),
          const SizedBox(height: 24),
          _buildRetypePassword(),
        ],
      ),
    );
  }

  Widget _buildCurrentPass() {
    return Obx(
      () => _buildInputArea(
        'change.password.current.password'.tr,
        'change.password.current.password.hint'.tr,
        controller.currentPaswordController,
        controller.hideCurrentPassword.value,
        true,
        suffix: InkWell(
          onTap: () {
            controller.hideCurrentPassword.value =
                !controller.hideCurrentPassword.value;
          },
          child: Text(
            controller.hideCurrentPassword.value ? 'show'.tr : 'hide'.tr,
            style: AppTextStyle.regular(
              color: AppColor.blackColor,
            ),
          ),
        ),
        belowWidget: controller.errorCurrentPassword.value != ''
            ? WidgetError(
                error: controller.errorCurrentPassword.value,
              )
            : const SizedBox(),
        formatters: [
          LengthLimitingTextInputFormatter(32),
        ],
      ),
    );
  }

  Widget _buildNewPassword() {
    return Obx(
      () => _buildInputArea(
        'change.password.new.password'.tr,
        'change.password.new.password.hint'.tr,
        controller.newPasswordController,
        controller.hideNewPassword.value,
        true,
        suffix: Container(
          height: 24.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.errorNewPassword.value != ''
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        controller.errorNewPassword.value != ''
                            ? InkWell(
                                child: FCoreImage(IconConstants.icClose),
                                onTap: () {
                                  controller.resetInput(
                                      controller.newPasswordController);
                                })
                            : FCoreImage(IconConstants.iconCheck),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          width: 1.0,
                          height: double.infinity,
                          color: AppColor.grayScale,
                        ),
                      ],
                    )
                  : const SizedBox(),
              InkWell(
                onTap: () {
                  controller.hideNewPassword.value =
                      !controller.hideNewPassword.value;
                },
                child: Text(
                  controller.hideNewPassword.value ? 'show'.tr : 'hide'.tr,
                  style: AppTextStyle.regular(
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        belowWidget: controller.errorNewPassword.value != ''
            ? WidgetError(
                error: controller.errorNewPassword.value,
              )
            : Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 24.0),
                child: Text(
                  'change.password.request'.tr,
                  style: AppTextStyle.regular(fontSize: 14),
                ),
              ),
        formatters: [
          LengthLimitingTextInputFormatter(32),
        ],
      ),
    );
  }

  Widget _buildRetypePassword() {
    return Obx(
      () => _buildInputArea(
        'change.password.input.new.password'.tr,
        'change.password.input.new.password'.tr,
        controller.retypeNewPasswordController,
        controller.hideInputPassword.value,
        true,
        suffix: Container(
          height: 24.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.errorRetypePassword.value != ''
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        controller.errorRetypePassword.value != ''
                            ? InkWell(
                                child: FCoreImage(IconConstants.icClose),
                                onTap: () {
                                  controller.resetInput(
                                      controller.retypeNewPasswordController);
                                },
                              )
                            : FCoreImage(IconConstants.iconCheck),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          width: 1.0,
                          height: double.infinity,
                          color: AppColor.grayScale,
                        ),
                      ],
                    )
                  : const SizedBox(),
              InkWell(
                onTap: () {
                  controller.hideInputPassword.value =
                      !controller.hideInputPassword.value;
                },
                child: Text(
                  controller.hideInputPassword.value ? 'show'.tr : 'hide'.tr,
                  style: AppTextStyle.regular(
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        belowWidget: controller.errorRetypePassword.value != ''
            ? WidgetError(
                error: controller.errorRetypePassword.value,
              )
            : Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 24.0),
                child: Text(
                  'change.password.request'.tr,
                  style: AppTextStyle.regular(fontSize: 14),
                ),
              ),
        formatters: [
          LengthLimitingTextInputFormatter(32),
        ],
      ),
    );
  }
}
