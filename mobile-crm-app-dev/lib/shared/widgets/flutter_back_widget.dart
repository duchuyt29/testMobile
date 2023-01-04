import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/text_style/text_style.dart';

class BackPageWidget extends StatelessWidget {
  const BackPageWidget({Key? key, this.backText = 'Quay lại', this.onTap})
      : super(key: key);

  final String backText;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Get.back,
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: Colors.blue,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                backText,
                style: AppTextStyle.regular(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
