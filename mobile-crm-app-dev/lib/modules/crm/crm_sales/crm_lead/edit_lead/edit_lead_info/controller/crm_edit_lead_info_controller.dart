import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/lead/lead_detail.dart';
import 'package:ui_api/crm_api/request/lead/lead_info_request.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class CrmEditLeadInfoController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();

  LeadDetail? leadDetail;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final positionController = TextEditingController();
  final companyController = TextEditingController();
  final sourceDescriptionController = TextEditingController();

  int? indexSalutation;
  int? indexGender;
  int? indexIndustry;
  int? indexSource;

  /* Init */

  CrmEditLeadInfoController() {
    leadDetail = Get.arguments as LeadDetail?;

    indexSalutation = crmMasterData?.listSalutation
        ?.indexWhere((element) => element.id == leadDetail?.salutationId);
    indexSalutation = indexSalutation == -1 ? null : indexSalutation;

    indexGender = crmMasterData?.listGender
        ?.indexWhere((element) => element.id == leadDetail?.genderId);
    indexGender = indexGender == -1 ? null : indexGender;

    indexIndustry = crmMasterData?.listIndustry
        ?.indexWhere((element) => element.id == leadDetail?.leadIndustryId);
    indexIndustry = indexIndustry == -1 ? null : indexIndustry;

    indexSource = crmMasterData?.leadSources
        ?.indexWhere((element) => element.id == leadDetail?.leadSourceId);
    indexSource = indexSource == -1 ? null : indexSource;
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    if (leadDetail == null) {
      Get.back();
    }

    nameController.text = leadDetail?.leadName ?? '';
    phoneController.text = leadDetail?.leadPhone ?? '';
    emailController.text = leadDetail?.leadEmail ?? '';
    positionController.text = leadDetail?.leadTitle ?? '';
    companyController.text = leadDetail?.company ?? '';
    sourceDescriptionController.text = leadDetail?.sourceDescription ?? '';
  }

  /* Action */

  Future onSelectedGender(int index) async {
    indexGender = index;
  }

  Future onSelectedIndustry(int index) async {
    indexIndustry = index;
  }

  Future onSalutation(int index) async {
    indexSalutation = index;
  }

  Future onSelectedSource(int index) async {
    indexSource = index;
  }

  Future onUpdate() async {
    if (fbKey.currentState!.saveAndValidate()) {
      await _callUpdateLead();
    } else {
      await EasyLoading.showToast(
          'Chưa điền đủ thông tin để cập nhật thông tin khách hàng tiềm năng!');
    }
  }

  void onCancel() => Get.back();

  /* Call API */

  Future<void> _callUpdateLead() async {
    final leadInfoRequest = LeadInfoRequest(id: leadDetail?.id);
    leadInfoRequest.salutationId = indexSalutation == null
        ? null
        : crmMasterData?.listSalutation?[indexSalutation!].id;

    leadInfoRequest.genderId = indexGender == null
        ? null
        : crmMasterData?.listGender?[indexGender!].id;

    leadInfoRequest.leadIndustryId = indexIndustry == null
        ? null
        : crmMasterData?.listIndustry?[indexIndustry!].id;

    leadInfoRequest.leadSourceId = indexSource == null
        ? null
        : crmMasterData?.leadSources?[indexSource!].id;

    leadInfoRequest.leadName = nameController.text;
    leadInfoRequest.leadPhone = phoneController.text;
    leadInfoRequest.leadEmail = emailController.text;
    leadInfoRequest.leadTitle = positionController.text;
    leadInfoRequest.company = companyController.text;
    leadInfoRequest.sourceDescription = sourceDescriptionController.text;

    await EasyLoading.show();
    await crmUIRepository
        .updateLeadInfo(leadInfoRequest)
        .then((response) async {
      if (response.success) {
        await _callGetLeadDetail();
      } else {
        await EasyLoading.dismiss();
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
        );
      }
    }).catchError((onError) {
      EasyLoading.dismiss();

      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callGetLeadDetail() async {
    await crmUIRepository
        .getLeadDetail(leadDetail?.id ?? -1)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        leadDetail = response.data;
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'Cập nhật khách hàng tiềm năng thành công!',
          onPressed: () => Get.back(result: leadDetail),
        );
      } else {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
          onPressed: Get.back,
        );
      }
    }).catchError((onError) {
      EasyLoading.dismiss();

      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }
}
