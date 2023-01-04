import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:ui_api/repository/sicix_ui_repository.dart';

class CrmProductFamilyEditController extends GetxController {
  // final sicixUIRepository = Get.find<SicixUIRepository>();

  final language = RxString('language'.tr);

  final TextEditingController MaPrice = TextEditingController();
  final TextEditingController TenPrice = TextEditingController();
  final TextEditingController MoTa = TextEditingController();
}
