import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../resource/assets_constant/images_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/styles/text_style/text_style.dart';
import '../../../shared/widgets/button/widget_button.dart';
import '../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../shared/widgets/widget_loading.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoaded.value) {
        return _buildWelcome();
      } else {
        return _buildLoading();
      }
    });
  }

  Widget _buildLoading() {
    return Column(
      children: [
        Expanded(
          child: FCoreImage(
            ImageConstants.logoSplash,
            width: Get.width * 0.82,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          child: WidgetLoading(),
        ),
      ],
    );
  }

  Widget _buildWelcome() {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FCoreImage(
                ImageConstants.logoSplash,
                width: Get.width * 0.82,
                fit: BoxFit.fitWidth,
              ),
              Text(
                'splash.welcome'.tr,
                style: AppTextStyle.regular(fontSize: 20),
              ),
            ],
          ),
        ),
        WidgetButton(
          title: 'next'.tr,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          onPressed: controller.onNext,
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
