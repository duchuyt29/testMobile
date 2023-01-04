import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/authorization_group/authorization_group.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../shared/constants/arguments.dart';
import '../../../../../shared/utils/dialog_util.dart';

class AuthorizationGroupController extends BaseController {
  int? initialValue;

  List<AuthorizationGroup> authorizationGroups = [];

  String searchText = '';
  final filterData = RxList<AuthorizationGroup>();

  /* Init */

  AuthorizationGroupController() {
    if (Get.arguments != null) {
      final arguments = Get.arguments as Map;
      initialValue = arguments[AUTHORIZATION_GROUP_ID];
    }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    await _loadData();
  }

  /* Action */

  Future<void> onChange(AuthorizationGroup item) async {
    initialValue = item.id;
    filterData.refresh();
    Get.back(result: item);
  }

  void onSearch(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterData.value = authorizationGroups;
    } else {
      filterData.value = authorizationGroups
          .where((element) => element.isCompare(searchText))
          .toList();
    }
  }

  /* Call API */

  Future _loadData() async {
    await EasyLoading.show();
    await crmUIRepository.getAuthorizationGroup().then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        authorizationGroups = response.data ?? [];
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
