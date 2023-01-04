import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/text_style/text_style.dart';

class WidgetPinMessage extends StatelessWidget {
  final bool isGroup;
  final GestureTapCallback onPinGroup;
  final GestureTapCallback onPinPrivate;

  const WidgetPinMessage({
    Key? key,
    required this.isGroup,
    required this.onPinGroup,
    required this.onPinPrivate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isGroup
              ? _buildOptionCell(title: 'chat.pin.group'.tr, onTap: onPinGroup)
              : Container(),
          _buildOptionCell(title: 'chat.pin.private'.tr, onTap: onPinPrivate)
        ],
      ),
    );
  }

  Widget _buildOptionCell({
    required String title,
    required GestureTapCallback onTap,
  }) {
    return InkWell(
      onTap: () {
        Get.back();
        onTap();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Text(
          title,
          style: AppTextStyle.regular(),
        ),
      ),
    );
  }
}
