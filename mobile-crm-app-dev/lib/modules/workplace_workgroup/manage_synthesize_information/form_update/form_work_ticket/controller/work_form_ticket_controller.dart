import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class WorkFormTicketController extends GetxController {
  final fbKey = GlobalKey<FormBuilderState>();

  Future<void> onSubmitted() async {
    if (fbKey.currentState!.saveAndValidate()) {
      print(fbKey.currentState!.value);
    }
  }
}
