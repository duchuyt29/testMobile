import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resource/assets_constant/icon_constants.dart';
import '../constants/colors.dart';
import '../styles/text_style/text_style.dart';
import '../widgets/image_widget/fcore_image.dart';

// ignore: avoid_classes_with_only_static_members
class ThemeDecoration {
  static BoxDecoration get appGradient => const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.lightBlue,
            Colors.blue,
          ],
        ),
      );

  static BoxDecoration get textShadow => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Colors.white,
            Colors.white.withOpacity(0.2),
          ],
        ),
      );

  static BoxDecoration get textFieldWithShadow => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      );

  static BoxDecoration get promotion => BoxDecoration(
        color: const Color(0xCCFFFFFF),
        // borderRadius: const BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 6),
          ),
        ],
      );

  static InputDecoration get inputNoneBorder => const InputDecoration(
        border: InputBorder.none,
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
      );

  static InputDecoration searchInputDecoration({String? hintText}) {
    // return InputDecoration(
    //   hintStyle:
    //       AppTextStyle.regular(color: AppColor.primaryHintColor, fontSize: 14),
    //   hintText: hintText ?? 'search'.tr,
    //   prefixIcon: const Icon(Icons.search),
    //   border: InputBorder.none,
    // );

    return inputNoneBorder.copyWith(
      hintText: hintText ?? 'search'.tr,
      suffixIcon: Align(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: FCoreImage(
          IconConstants.icSearch1,
          width: 20,
          height: 20,
        ),
      ),
    );
  }

  static InputDecoration searchAppBarInputDecoration({String? hintText}) {
    return InputDecoration(
      hintStyle:
          AppTextStyle.regular(color: AppColor.primaryHintColor, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
      hintText: hintText ?? 'search'.tr,
      suffixIcon: const Icon(Icons.search),
      border: InputBorder.none,
    );
  }
}
