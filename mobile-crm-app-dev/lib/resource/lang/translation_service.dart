import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'translations/en_us.dart';
import 'translations/vi_vn.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_us,
        'vi_VN': vi_vn,
      };
}
