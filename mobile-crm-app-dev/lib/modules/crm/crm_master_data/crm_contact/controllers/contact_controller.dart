import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/contact/contact.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../routes/crm_pages.dart';
import '../../../../../shared/constants/arguments.dart';
import '../../../../../shared/utils/dialog_util.dart';

class ContactController extends BaseController {
  final RxBool isMultiSelect = false.obs;
  int? initialValue;

  List<Contact> contacts = [];
  RxList<Contact> listSelect = RxList.empty(growable: true);
  RxList<int> listSelectId = RxList.empty(growable: true);

  String searchText = '';
  final filterData = RxList<Contact>();

  /* Init */

  ContactController() {
    _loadData();
    if (Get.arguments != null) {
      final arguments = Get.arguments as Map;
      initialValue = arguments[CONTACT_ID];
      if (arguments[CONTACT_INFO] != null) {
        listSelect.value = arguments[CONTACT_INFO];
        listSelectId.value =
            listSelect.map((element) => element.id ?? 0).toList();
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

  Future<void> onChange(Contact item) async {
    if (isMultiSelect.value) {
      if (!listSelect.any((element) => element.id == item.id)) {
        listSelect.add(item);
      } else {
        listSelect.removeAt(
            listSelect.indexWhere((element) => element.id == item.id));
      }
      listSelectId.value =
          listSelect.map((element) => element.id ?? 0).toList();
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
      filterData.value = contacts;
    } else {
      filterData.value =
          contacts.where((element) => element.isCompare(searchText)).toList();
    }
  }

  Future<void> onCreateNew() async {
    await Get.toNamed(CRMRoutes.CRM_CONTACT_FORM_INFORMATION)?.then((value) {
      if (value != null) {
        Get.back(result: value);
      }
    });
  }

  /* Call API */

  Future _loadData() async {
    await EasyLoading.show();
    await crmUIRepository.getAllContacts().then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        contacts = response.data ?? [];
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
