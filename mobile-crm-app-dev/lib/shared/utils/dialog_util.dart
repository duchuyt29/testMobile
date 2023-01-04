import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../styles/text_style/text_style.dart';
import '../widgets/button/widget_button.dart';
import '../widgets/button/widget_text_button.dart';

class DialogUtil {
  DialogUtil._();

  static Future createDialogMessage({
    required String message,
    BuildContext? context,
    String? title,
    VoidCallback? onPressed,
    String? textButton,
  }) async {
    await showCupertinoDialog(
      context: context ?? Get.context!,
      builder: (context) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: CupertinoAlertDialog(
            title: (title?.isEmpty ?? true)
                ? null
                : Text(
                    title ?? '',
                    style: AppTextStyle.heavy(),
                    textAlign: TextAlign.center,
                  ),
            content: Text(
              message,
              style: AppTextStyle.regular(),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onPressed != null) {
                    onPressed();
                  }
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size(100, 50),
                  padding: EdgeInsets.zero,
                  backgroundColor: AppColor.buttonBackgroundColor,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: Text(
                  textButton ?? 'ok'.tr,
                  style: AppTextStyle.heavy(color: AppColor.secondTextColor),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future createDialogConfirm({
    required String title,
    required String message,
    required String confirmTitle,
    required Function() onConfirm,
    Color? backgroundButtonColor,
  }) async {
    await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: AlertDialog(
              insetPadding: const EdgeInsets.all(14),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              title: Text(
                title,
                style: AppTextStyle.heavy(),
                textAlign: TextAlign.center,
              ),
              contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              content: Container(
                width: Get.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message,
                      style:
                          AppTextStyle.regular(color: AppColor.fourthTextColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: WidgetButton(
                            title: confirmTitle,
                            backgroundButtonColor:
                                backgroundButtonColor ?? AppColor.stateError,
                            onPressed: () {
                              Navigator.pop(context);
                              onConfirm();
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: WidgetTextButton(
                            title: 'cancel'.tr,
                            onPressed: () => Navigator.pop(context),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static Future showDialogDatePicker(
    Widget content,
    Function(dynamic value) onValue,
  ) async {
    await showDialog(
        context: Get.overlayContext!,
        builder: (context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: AlertDialog(
              backgroundColor: AppColor.primaryBackgroundColor,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              content: content,
            ),
          );
        }).then((value) => onValue(value));
  }
}
