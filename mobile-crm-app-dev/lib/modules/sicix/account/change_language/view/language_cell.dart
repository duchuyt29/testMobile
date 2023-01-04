import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controller/change_language_controller.dart';

class ItemLanguage extends StatelessWidget {
  final Language language;
  final GestureTapCallback onTap;
  const ItemLanguage({
    Key? key,
    required this.language,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            Image.asset(language.image),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    language.label,
                    style: AppTextStyle.heavy(
                      color: AppColor.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            FCoreImage(
              language.isChecked
                  ? IconConstants.icRadioOn
                  : IconConstants.icRadioOff,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
