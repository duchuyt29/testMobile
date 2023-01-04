import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/app_data_global.dart';
import '../../../../routes/crm_pages.dart';
import '../../../../routes/sicix_pages.dart';

class CrmMasterMenuController extends BaseController {
  final companySelected = Rxn(AppDataGlobal.userConfig?.getLastCompany());
  final name = RxString(AppDataGlobal.userInfo?.getName() ?? '');
  final avatar = RxString(AppDataGlobal.userInfo?.getAvatar() ?? '');
  final phone = RxString(AppDataGlobal.userInfo?.getPhone() ?? '');

  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  @override
  void refresh() {
    super.refresh();

    final company = AppDataGlobal.userConfig?.getLastCompany();
    if (companySelected.value?.id != company?.id) {
      companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
    }
  }

  /* Action */

  Future<void> onViewDetail() async {
    await Get.toNamed(SicixRoutes.PROFILE_DETAIL,
            arguments: AppDataGlobal.userInfo)
        ?.then((value) async {
      name.value = AppDataGlobal.userInfo?.getName() ?? '';
      avatar.value = AppDataGlobal.userInfo?.getAvatar() ?? '';
      phone.value = AppDataGlobal.userInfo?.getPhone() ?? '';
      if (value is bool && value) {
        isNotification.value = true;
        isBlueNotification.value = false;
        notificationMessage.value = 'notification.update.profile.success'.tr;
        await Future.delayed(const Duration(milliseconds: 3000)).then((value) {
          isNotification.value = false;
          notificationMessage.value = '';
        });
      }
    });
  }

  Future<void> onEdit() async {
    await Get.toNamed(SicixRoutes.EDIT_PROFILE,
            arguments: AppDataGlobal.userInfo)
        ?.then((value) async {
      name.value = AppDataGlobal.userInfo?.getName() ?? '';
      avatar.value = AppDataGlobal.userInfo?.getAvatar() ?? '';
      phone.value = AppDataGlobal.userInfo?.getPhone() ?? '';
      if (value is bool && value) {
        isNotification.value = true;
        isBlueNotification.value = false;
        notificationMessage.value = 'notification.update.profile.success'.tr;
        await Future.delayed(const Duration(milliseconds: 3000)).then((value) {
          isNotification.value = false;
          notificationMessage.value = '';
        });
      }
    });
  }

  Future<void> onViewCrm(BuildContext context) async {
    await Get.toNamed(CRMRoutes.CRM_CRM);
  }

  Future<void> onViewMasterData(BuildContext context) async {
    await Get.toNamed(CRMRoutes.CRM_MD);
  }
}
