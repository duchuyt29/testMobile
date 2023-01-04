import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../resource/assets_constant/icon_constants.dart';
import '../constants/colors.dart';
import '../styles/text_style/text_style.dart';
import '../widgets/button/widget_button.dart';
import '../widgets/button/widget_text_button.dart';
import '../widgets/image_widget/fcore_image.dart';

class BottomSheetUtil {
  BottomSheetUtil._();

  static Future showBottomSheet({required Widget child}) async {
    await showModalBottomSheet(
      context: Get.context!,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: AppColor.primaryBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(16),
          topStart: Radius.circular(16),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.only(top: 8, bottom: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 38,
              height: 3,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: AppColor.primaryBorderColor,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }

  static Future createBottomSheet({
    String title = '',
    required Widget child,
    Function(dynamic value)? onVaLue,
  }) async {
    await showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: AppColor.primaryBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(16),
          topStart: Radius.circular(16),
        ),
      ),
      builder: (context) => SafeArea(
        top: false,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 38.0,
                height: 3.0,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColor.neutral8,
                ),
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 12),
                child: Text(
                  title,
                  style: AppTextStyle.heavy(),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(child: child),
            ],
          ),
        ),
      ),
    ).then((value) {
      if (onVaLue != null) {
        onVaLue(value);
      }
    });
  }

  static Future createConfirmBottomSheet({
    required String title,
    String message = '',
    required String confirmTitle,
    required Function() onConfirm,
  }) async {
    await showCupertinoModalBottomSheet(
      context: Get.context!,
      backgroundColor: AppColor.primaryBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(16),
          topStart: Radius.circular(16),
        ),
      ),
      builder: (_) => SafeArea(
        top: false,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 38.0,
                  height: 3.0,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColor.neutral8,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 12),
                  child: Text(
                    title,
                    style: AppTextStyle.heavy(),
                    textAlign: TextAlign.center,
                  ),
                ),
                message.isEmpty
                    ? Container()
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: Text(
                          message,
                          style: AppTextStyle.regular(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: WidgetButton(
                          title: confirmTitle,
                          backgroundButtonColor: AppColor.stateError,
                          onPressed: () {
                            Get.back();
                            onConfirm();
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade400),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: WidgetTextButton(
                            title: 'cancel'.tr,
                            onPressed: Get.back,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 10,
              top: 11,
              child: IconButton(
                onPressed: Get.back,
                icon: FCoreImage(IconConstants.iconClose),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Future createMultiSelectItemBottomSheet({
    String title = '',
    List<dynamic>? selectedItems,
    required Widget child,
    Function(dynamic value)? onVaLue,
  }) async {
    await showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: AppColor.primaryBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(16),
          topStart: Radius.circular(16),
        ),
      ),
      builder: (context) => SafeArea(
        top: false,
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 38.0,
                height: 3.0,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColor.neutral8,
                ),
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 12),
                child: Text(
                  title,
                  style: AppTextStyle.heavy(),
                  textAlign: TextAlign.center,
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    ).then((value) {
      if (onVaLue != null) {
        onVaLue(value);
      }
    });
  }
}
