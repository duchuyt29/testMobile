import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonWidget {
  static AppBar appBar(BuildContext context, String title,
      {void Function()? callback,
      IconData? backIcon,
      Color? color,
      bool? automaticallyImplyLeading}) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      leading: backIcon == null
          ? null
          : IconButton(
              icon: Icon(backIcon, color: color),
              onPressed: () {
                if (callback != null) {
                  callback();
                } else {
                  Navigator.pop(context);
                }
              },
            ),
      title: Text(
        title,
        style: TextStyle(color: color ?? Colors.white, fontFamily: 'Rubik'),
      ),
      backgroundColor: Colors.green,
      elevation: 0,
    );
  }

  static SizedBox rowHeight({double height = 30}) {
    return SizedBox(height: height);
  }

  static SizedBox rowWidth({double width = 30}) {
    return SizedBox(width: width);
  }

  static Future<void> snackBar(String error) async {
    Get.snackbar(
      'error'.tr,
      error,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static bool isVideo(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith('.mov') ||
        ext.endsWith('.mp4') ||
        ext.endsWith('.avi') ||
        ext.endsWith('.wmv') ||
        ext.endsWith('.rmvb') ||
        ext.endsWith('.mpg') ||
        ext.endsWith('.mpeg') ||
        ext.endsWith('.3gp');
  }
}
