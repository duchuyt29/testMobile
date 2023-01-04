import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:ui_api/repository/sicix_ui_repository.dart';

import '../../../../../data/app_data_global.dart';
import '../../../../../routes/crm_pages.dart';
import '../../../../../routes/sicix_pages.dart';
import '../../crm_productfamily/crm_productfamily/binding/crm_product_family_binding.dart';
import '../../crm_productfamily/crm_productfamily/views/crm_product_family_screen.dart';

class ProductManagementController extends GetxController {
  // final sicixUIRepository = Get.find<SicixUIRepository>();
  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');
  final language = RxString('language'.tr);

  final companySelected = Rxn(AppDataGlobal.userConfig?.getLastCompany());
  final name = RxString(AppDataGlobal.userInfo?.getName() ?? '');
  final avatar = RxString(AppDataGlobal.userInfo?.getAvatar() ?? '');
  final phone = RxString(AppDataGlobal.userInfo?.getPhone() ?? '');

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

  Future<void> onViewProductFamily(BuildContext context) async {
    await Navigator.push(
        context,
        GetPageRoute(
          page: () => CrmProductFamilyScreen(),
          binding: CrmProductFamilyBinding(),
        ));
  }

  Future<void> onViewPrice() async {
    await Get.toNamed(CRMRoutes.CRM_PRICE);
  }
}
