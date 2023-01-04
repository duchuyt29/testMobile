import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity_info.dart';
import 'package:ui_api/crm_api/request/opportunity/opportunity_additional_information_request.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../shared/utils/dialog_util.dart';

class OpportunityAdditionalFormController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();
  final opportunityInfo = Rxn<OpportunityInfo>();
  final opportunityRequest = OpportunityAdditionalInformationRequest();

  OpportunityAdditionalFormController() {
    if (Get.arguments != null) {
      opportunityInfo.value = Get.arguments;
    }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> onSubmitted() async {
    try {
      if (fbKey.currentState!.saveAndValidate()) {
        final data = fbKey.currentState!.value;
        opportunityRequest.id = opportunityInfo.value?.id;
        opportunityRequest.description = data['description'];

        await updateOpportunity();
      }
    } catch (e) {
      await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: e.toString());
    }
  }

  // API
  Future<void> updateOpportunity() async {
    try {
      await EasyLoading.show();
      await crmUIRepository.updateOpportunityAdditionalInfo(opportunityRequest);
      Get.back(
        result: true,
      );
      await EasyLoading.dismiss();
    } catch (e) {
      await EasyLoading.dismiss();
      await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: e.toString());
    }
  }
}
