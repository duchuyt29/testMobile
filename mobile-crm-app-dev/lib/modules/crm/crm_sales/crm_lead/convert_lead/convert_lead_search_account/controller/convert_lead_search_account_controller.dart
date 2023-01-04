import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_account.dart';
import 'package:ui_api/crm_api/models/lead/lead_detail.dart';
import 'package:ui_api/crm_api/request/lead/lead_convert_request.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class ConvertLeadSearchAccountController extends BaseController {
  LeadDetail? leadDetail;
  final leadConvertRequest = Rxn<LeadConvertRequest>();

  List<ActivityAccount> accounts = <ActivityAccount>[];
  String searchText = '';
  final filterAccounts = RxList<ActivityAccount>();

  /* Init */

  ConvertLeadSearchAccountController() {
    leadDetail = Get.arguments[LEAD_DETAIL] as LeadDetail?;
    leadConvertRequest.value =
        Get.arguments[LEAD_CONVERT_REQUEST] as LeadConvertRequest?;
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    await getAllAccount();
  }

  /* Action */

  Future createAccount() async {
    await Get.toNamed(CRMRoutes.CRM_CONVERT_LEAD_CREATE_ACCOUNT, arguments: {
      LEAD_DETAIL: leadDetail,
      LEAD_CONVERT_REQUEST: leadConvertRequest.value,
    })?.then((value) {
      if (value != null && value is LeadConvertRequest) {
        leadConvertRequest.value = value;
        Get.back(result: value);
      }
    });
  }

  void onSearch(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterAccounts.value = accounts;
    } else {
      filterAccounts.value =
          accounts.where((element) => element.isCompare(searchText)).toList();
    }
  }

  void onSelectionAccount(ActivityAccount account) {
    Get.back(result: account);
  }

  /* Call API */

  Future<void> getAllAccount() async {
    await crmUIRepository.getActivityAccount().then((response) async {
      if (response.success) {
        accounts = response.data ?? [];
        onSearch(searchText);
      } else {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }
}
