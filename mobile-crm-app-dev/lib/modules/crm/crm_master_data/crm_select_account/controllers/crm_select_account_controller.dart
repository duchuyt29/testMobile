import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/opportunity/opp_account.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../shared/constants/arguments.dart';
import '../../../../../shared/utils/dialog_util.dart';

class CrmSelectAccountController extends BaseController {
  List<OppAccount> accounts = RxList<OppAccount>();
  final isMultiSelect = RxBool(false);
  String searchText = '';
  final filterAccounts = RxList<OppAccount>();
  List<OppAccount> selectedAccounts = RxList<OppAccount>();

  CrmSelectAccountController() {
    isMultiSelect.value = Get.arguments[IS_MULTI_SELECT] ?? false;
    final temp = Get.arguments[LIST_SELECTED];
    if (temp != null && temp.isNotEmpty) {
      for (var i = 0; i < temp.length; i++) {
        selectedAccounts.add(temp[i]);
      }
    }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    if (accounts.isEmpty) {
      await loadData();
    } else {
      onSearchProduct(searchText);
    }
  }

  /* Action */

  void onSubbmit() {
    Get.back(result: selectedAccounts);
  }

  void onSearchProduct(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterAccounts.value = accounts;
    } else {
      filterAccounts.value =
          accounts.where((element) => element.isCompare(searchText)).toList();
    }
  }

  Future<void> onSelectAccount(OppAccount? oppAccount) async {
    try {
      Get.back(result: oppAccount);
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onSelectProduct(OppAccount oppAccount) async {
    final index =
        selectedAccounts.indexWhere((element) => element.id == oppAccount.id);
    if (index == -1) {
      selectedAccounts.add(oppAccount);
    } else {
      selectedAccounts.removeAt(index);
    }
    filterAccounts.refresh();
  }

  /* Call API */

  Future<void> loadData() async {
    await EasyLoading.show();
    await crmUIRepository.getAllAccount().then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        accounts = response.data ?? [];
        onSearchProduct(searchText);
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
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
        onPressed: Get.back,
      );
    });
  }
}
