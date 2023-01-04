import 'package:flutter/cupertino.dart';

class AppFocus {
  static void unFocus() {
    // final currentFocus = FocusScope.of(context);

    // if (!currentFocus.hasPrimaryFocus) {
    //   currentFocus.unfocus();
    // }
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
