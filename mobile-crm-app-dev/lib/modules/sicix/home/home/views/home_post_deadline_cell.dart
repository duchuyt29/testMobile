import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/home/post_content.dart';

import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';

class HomePostDeadlineCell extends StatelessWidget {
  final PostContent content;

  const HomePostDeadlineCell({Key? key, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (content.task?.polls?.isEmpty ?? true) {
      return Container();
    }
    final deadline = content.getDeadline();
    if (deadline.isEmpty) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
      child: Row(
        children: [
          Text(
            'home.poll.deadline'.tr,
            style: AppTextStyle.regular(
              fontSize: 14,
            ),
          ),
          Text(
            deadline,
            style: AppTextStyle.heavy(
              fontSize: 16,
              color: AppColor.eightTextColorLight,
            ),
          ),
        ],
      ),
    );
  }
}
