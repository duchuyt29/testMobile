import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class WidgetLoading extends StatelessWidget {
  final double? size;

  WidgetLoading({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? Get.width * 0.1,
      width: size ?? Get.width * 0.1,
      child: CircularProgressIndicator(
        color: AppColor.primaryColor,
        backgroundColor: AppColor.primaryColor.withOpacity(0.5),
        strokeWidth: 4,
      ),
    );
  }
}

class WidgetCenterLoading extends StatelessWidget {
  const WidgetCenterLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          WidgetLoading(),
          Expanded(
            flex: 2,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
