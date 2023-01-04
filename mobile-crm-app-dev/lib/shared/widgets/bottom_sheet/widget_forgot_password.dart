import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../constants/colors.dart';
import '../../services/path_service.dart';
import '../../styles/text_style/text_style.dart';
import '../button/widget_button.dart';
import '../button/widget_text_button.dart';

class WidgetForgotPassword extends StatelessWidget {
  const WidgetForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'forgot.button'.tr,
            style: AppTextStyle.heavy(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'forgot.cap'.tr,
            style: AppTextStyle.regular(color: AppColor.fourthTextColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 35),
          Row(
            children: [
              Expanded(
                child: WidgetButton(
                  title: 'continue'.tr,
                  onPressed: () async {
                    Get.back();
                    await launchUrlString(PathService.forgotPassPath,
                        mode: LaunchMode.externalApplication);
                    // final forgotUrl = Uri.parse(PathService.forgotPassPath);
                    // await launchUrl(forgotUrl);
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: WidgetTextButton(
                  title: 'close'.tr,
                  onPressed: Get.back,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
