import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../../routes/crm_pages.dart';

class CrmDetailLeadSalePartyInvolesCreateUsersController
    extends GetxController {
  final fbKey = GlobalKey<FormBuilderState>();

  Future<void> onSubmitted() async {
    if (fbKey.currentState!.saveAndValidate()) {
      print(fbKey.currentState!.value);
    }
  }

  List<String> options = ["GetX", "Provider", "BloC", "MobX"];
  Rx<List<String>> selectedOptionList = Rx<List<String>>([]);
  var selectedOption = ''.obs;

  Future<void> searchSalesParty() async {
    await Get.toNamed(CRMRoutes.CRM_LEAD_SEARCH_SALE_PARTY_INVOLES);
  }

  Future<void> searchUsers() async {
    await Get.toNamed(CRMRoutes.CRM_LEAD_SALES_PARTY_INVOLES_SEARCH_USERS);
  }
}
