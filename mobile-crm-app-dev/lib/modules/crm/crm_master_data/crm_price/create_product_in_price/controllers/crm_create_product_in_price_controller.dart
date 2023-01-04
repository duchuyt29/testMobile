import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
// import 'package:ui_api/repository/sicix_ui_repository.dart';

class CrmCreateProductsInPriceController extends GetxController {
  // final sicixUIRepository = Get.find<SicixUIRepository>();

  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  final fbKey = GlobalKey<FormBuilderState>();

  Future<void> onSubmitted() async {
    if (fbKey.currentState!.saveAndValidate()) {
      print(fbKey.currentState!.value);
    }
  }
}
