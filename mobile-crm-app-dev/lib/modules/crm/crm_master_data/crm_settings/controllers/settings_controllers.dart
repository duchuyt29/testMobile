import 'package:get/get.dart';
// import 'package:ui_api/repository/sicix_ui_repository.dart';

import '../../../../../data/app_data_global.dart';
import '../../../../../routes/crm_pages.dart';
import '../../../../../routes/sicix_pages.dart';

class SettingsController extends GetxController {
  // final sicixUIRepository = Get.find<SicixUIRepository>();

  final companySelected = Rxn(AppDataGlobal.userConfig?.getLastCompany());
  final name = RxString(AppDataGlobal.userInfo?.getName() ?? '');
  final avatar = RxString(AppDataGlobal.userInfo?.getAvatar() ?? '');
  final phone = RxString(AppDataGlobal.userInfo?.getPhone() ?? '');

  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  final language = RxString('language'.tr);

  @override
  void refresh() {
    super.refresh();

    final company = AppDataGlobal.userConfig?.getLastCompany();
    if (companySelected.value?.id != company?.id) {
      companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
    }
  }

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

  Future<void> onViewCurrenExRate() async {
    await Get.toNamed(CRMRoutes.CRM_CURRENCY_EXCHANGE_RATE);
  }

  Future<void> onViewProductManagement() async {
    await Get.toNamed(CRMRoutes.CRM_PRODUCT_MANAGEMENT);
  }
}
