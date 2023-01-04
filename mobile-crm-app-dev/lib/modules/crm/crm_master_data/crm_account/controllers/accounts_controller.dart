import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import 'package:ui_api/crm_api/models/activity/activity_account.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../routes/crm_pages.dart';
import '../../../../../shared/constants/arguments.dart';
import '../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../shared/utils/dialog_util.dart';
import '../../../../../shared/widgets/bottom_sheet/widget_crm_menu_option.dart';

class CrmAccountsController extends BaseController {
  final RxBool isMultiSelect = false.obs;
  int? initialValue;

  List<ActivityAccount> accounts = [];
  RxList<ActivityAccount> listSelect = RxList.empty(growable: true);

  String searchText = '';
  final filterData = RxList<ActivityAccount>();

  /* Init */

  CrmAccountsController() {
    _loadData();
    if (Get.arguments != null) {
      final arguments = Get.arguments as Map;
      initialValue = arguments[ACCOUNT_ID];
      if (arguments[ACCOUNT_LIST] != null) {
        listSelect.value = arguments[ACCOUNT_LIST];
      }
      if (arguments[IS_MULTI_SELECT] != null) {
        isMultiSelect.value = arguments[IS_MULTI_SELECT];
      }
    }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  /* Action */

  Future<void> onChange(ActivityAccount item) async {
    if (isMultiSelect.value) {
      if (!listSelect.any((element) => element.id == item.id)) {
        listSelect.add(item);
      } else {
        listSelect.removeAt(
            listSelect.indexWhere((element) => element.id == item.id));
      }
      listSelect.refresh();
    } else {
      initialValue = item.id;
      filterData.refresh();
      Get.back(result: item);
    }
  }

  Future<void> onChangeList() async {
    try {
      Get.back(result: listSelect.value);
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  void onSearch(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterData.value = accounts;
    } else {
      filterData.value =
          accounts.where((element) => element.isCompare(searchText)).toList();
    }
  }

  Future<void> onViewCreateOption() async {
    await BottomSheetUtil.showBottomSheet(
      child: WidgetCrmMenuOption(
        title: 'crm.contact.involve.choose.subject'.tr,
        option: [
          ...List.generate(crmMasterData?.listAccountType?.length ?? 0,
              (index) {
            return MenuOptionModel(
                onAction: () {
                  Get.back();
                  _onViewCreate(crmMasterData?.listAccountType?[index].id ?? 0);
                },
                title: crmMasterData?.listAccountType?[index].accountTypeName ??
                    '');
          }),
        ],
      ),
    );
  }

  Future<void> _onViewCreate(int type) async {
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_FORM_CREATE, arguments: type)
        ?.then((value) {
      if (value != null && value is AccountInfo) {
        Get.back(
            result: ActivityAccount(
          id: value.id,
          accountName: value.accountName,
        ));
      }
    });
  }

  /* Call API */

  Future _loadData() async {
    await EasyLoading.show();
    await crmUIRepository.getActivityAccount().then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        accounts = response.data ?? [];
        onSearch(searchText);
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
