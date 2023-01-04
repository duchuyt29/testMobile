import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/images_constants.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class WidgetLeadName extends StatelessWidget {
  final String name;
  final Color? color;

  const WidgetLeadName(this.name, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.secondBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ListTile(
        leading: FCoreImage(
          ImageConstants.crmAccount,
          width: 45,
          height: 45,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('crm.lead'.tr),
            Text(
              name,
              style: AppTextStyle.bold(
                  fontSize: 20, color: color ?? AppColor.primaryTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
