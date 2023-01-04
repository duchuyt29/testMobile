import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../../base/base_controller.dart';

class CrmAddPriceStandardFormController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();

  Future<void> onSubmitted() async {
    if (fbKey.currentState!.saveAndValidate()) {
      print(fbKey.currentState!.value);
    }
  }
}
