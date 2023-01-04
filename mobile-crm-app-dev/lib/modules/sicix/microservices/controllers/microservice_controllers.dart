import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../routes/crm_pages.dart';
import '../../../../routes/sicix_pages.dart';
import '../../../../shared/utils/dialog_util.dart';
import '../../master/controllers/master_controller.dart';

class MicroserviceController extends BaseController {
  final MasterController masterController;

  final companySelected = Rxn(AppDataGlobal.userConfig?.getLastCompany());
  final name = RxString(AppDataGlobal.userInfo?.getName() ?? '');
  final avatar = RxString(AppDataGlobal.userInfo?.getAvatar() ?? '');
  final phone = RxString(AppDataGlobal.userInfo?.getPhone() ?? '');

  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  MicroserviceController(this.masterController);

  @override
  void refresh() {
    super.refresh();

    final company = AppDataGlobal.userConfig?.getLastCompany();
    if (companySelected.value?.id != company?.id) {
      companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
      // _refreshPage();
    }
  }

  /* Action */

  Future<void> onChangeCompany() async {
    await Get.toNamed(SicixRoutes.CHOOSE_COMPANY)?.then((value) {
      if (value is bool && value) {
        companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
      }
    });
  }

  Future<void> onViewCrm() async {
    if (AppDataGlobal.crmMasterData != null) {
      await _callGetEmployees();
      return;
    }

    await _callCrmMasterData();
  }

  // Call API

  Future<void> _callCrmMasterData() async {
    try {
      await EasyLoading.show();
      await crmUIRepository.getMasterData().then((response) async {
        if (response.success && response.data != null) {
          AppDataGlobal.crmMasterData = response.data;
          await _callGetEmployees();
        } else {
          await EasyLoading.dismiss();
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: response.message ?? 'notify.error'.tr);
        }
      }).catchError((onError) {
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> _callGetEmployees() async {
    try {
      await crmUIRepository.getEmployees().then((response) async {
        if (response.success && response.data != null) {
          await EasyLoading.dismiss();
          AppDataGlobal.employees = response.data ?? [];
          await Get.toNamed(CRMRoutes.CRM_MASTER_MENU);
        } else {
          await EasyLoading.dismiss();
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: response.message ?? 'notify.error'.tr);
        }
      }).catchError((onError) {
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }
}
