import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../controller/change_language_controller.dart';
import 'language_cell.dart';

part 'change_language_extension.dart';

class ChangeLanguageScreen extends GetView<ChangeLanguageController> {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.canvasColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          centerTitle: true,
          leading: IconButton(
              onPressed: Get.back,
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColor.canvasColor,
              )),
          title: Text(
            'account.change_language.label'.tr,
            style: AppTextStyle.heavy(
              fontSize: 18.0,
              color: AppColor.secondTextColor,
            ),
          ),
        ),
        body: GetBuilder<ChangeLanguageController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                _buidlLanguageList(controller.languages),
              ],
            ),
          );
        }));
  }
}
