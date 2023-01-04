import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ManageTimeFormController extends GetxController {
  final fbKey = GlobalKey<FormBuilderState>();

  final checkStatus = RxBool(false);

  Future<void> onSubmitted() async {
    if (fbKey.currentState!.saveAndValidate()) {
      print(fbKey.currentState!.value);
    }
  }

  void onToggle(bool status) {
    checkStatus.value = status;
  }
}
