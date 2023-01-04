import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/sicix_pages.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../button/widget_button.dart';
import '../button/widget_text_button.dart';

class WidgetSetupDomain extends StatelessWidget {
  final String domain;

  const WidgetSetupDomain(this.domain, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'login.failure.title'.tr,
            style: AppTextStyle.heavy(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'login.failure.change.domain.cap'.trArgs([domain]),
            style: AppTextStyle.regular(color: AppColor.fourthTextColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 35),
          Row(
            children: [
              Expanded(
                child: WidgetButton(
                  title: 'continue'.tr,
                  onPressed: Get.back,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: WidgetTextButton(
                  title: 'login.failure.change.domain.button'.tr,
                  textButtonColor: AppColor.primaryButtonColor,
                  onPressed: () => Get.offAllNamed(SicixRoutes.DOMAIN),
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
