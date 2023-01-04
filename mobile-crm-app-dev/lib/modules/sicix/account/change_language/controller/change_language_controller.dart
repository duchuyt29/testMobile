import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../data/app_data_global.dart';
import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/constants/storage.dart';
import '../../../../../shared/widgets/bottom_sheet/widget_confirm.dart';

class ChangeLanguageController extends GetxController {
  final RxInt languageIndex = RxInt(0);
  final storage = Get.find<SharedPreferences>();
  final languages = <Language>[];
  final preIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadDataLanguage();
    preIndex.value = languages.indexWhere((item) => item.isChecked);
    log('Index: ${preIndex.value}');
  }

  void loadDataLanguage() {
    languages.add(Language(
      ImageConstants.vnEnsign,
      'Tiếng Việt (VN)',
      storage
              .getString(StorageConstants.language)!
              .compareTo(VIETNAMESE_LANG) ==
          0,
      VIETNAMESE_LANG,
    ));
    languages.add(
      Language(
        ImageConstants.usEnsign,
        'English (EN)',
        storage.getString(StorageConstants.language)!.compareTo(ENGLISH_LANG) ==
            0,
        ENGLISH_LANG,
      ),
    );
    update();
  }

  /* Action */

  void onChooseLanguage(int index) {
    languages[index].isChecked = !languages[index].isChecked;
    languages[preIndex.value].isChecked = !languages[index].isChecked;
    preIndex.value = index;
    Get.bottomSheet(
      WidgetConfirm(
        title: 'change.language.title'.tr,
        message: '${'change.language.message'.tr}${languages[index].label} ?',
        positive: 'yes'.tr,
        negative: 'no'.tr,
        onAccept: () => onSaveLanguage(index),
        onCancel: Get.back,
      ),
    );
    update();
  }

  void onSaveLanguage(int currentIndex) {
    Get.back(
      result: languages[currentIndex].label,
      closeOverlays: true,
    );
    if (languages[currentIndex].language == VIETNAMESE_LANG) {
      Get.updateLocale(const Locale('vi', 'VN'));
      timeago.setLocaleMessages('vi', CustomTimeagoMessages());
    } else {
      Get.updateLocale(const Locale('en', 'US'));
      timeago.setLocaleMessages('en', CustomTimeagoMessages());
    }
    AppDataGlobal.saveLanguage(languages[currentIndex].language);
  }
}

class Language {
  String image;
  String label;
  bool isChecked;
  String language;

  Language(this.image, this.label, this.isChecked, this.language);
}

class CustomTimeagoMessages implements timeago.LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'ago'.tr;
  @override
  String suffixFromNow() => 'ago'.tr;
  @override
  String lessThanOneMinute(int seconds) => 'now'.tr;
  @override
  String aboutAMinute(int minutes) => 'minute'.trArgs([minutes.toString()]);
  @override
  String minutes(int minutes) => 'minutes'.trArgs([minutes.toString()]);
  @override
  String aboutAnHour(int minutes) => 'minutes'.trArgs([minutes.toString()]);
  @override
  String hours(int hours) => 'hour'.trArgs([hours.toString()]);
  @override
  String aDay(int hours) => 'hours'.trArgs([hours.toString()]);
  @override
  String days(int days) => 'day'.trArgs([days.toString()]);
  @override
  String aboutAMonth(int days) => 'days'.trArgs([days.toString()]);
  @override
  String months(int months) => 'months'.trArgs([months.toString()]);
  @override
  String aboutAYear(int year) => 'year'.trArgs([year.toString()]);
  @override
  String years(int years) => 'years'.trArgs([years.toString()]);
  @override
  String wordSeparator() => ' ';
}
