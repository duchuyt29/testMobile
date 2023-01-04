import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/images_constants.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class WidgetHeaderName extends StatelessWidget {
  final String name;
  final String title;
  final String? icon;

  const WidgetHeaderName(
      {required this.name, required this.title, this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.secondBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ListTile(
        leading: FCoreImage(
          icon ?? ImageConstants.crmCrmLead,
          width: 45,
          height: 45,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(
              name,
              style: AppTextStyle.bold(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
