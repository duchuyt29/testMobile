import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';

import '../../../../../base/base_controller.dart';
import '../../../../../data/app_data_global.dart';
import '../../../../../shared/constants/arguments.dart';

class EmployeeController extends BaseController {
  final isMultiSelect = RxBool(false);
  final employeeSelected = RxList<EmployeeModel>();

  String searchText = '';
  final filterData = RxList<EmployeeModel>();

  /* Init */

  EmployeeController() {
    isMultiSelect.value = Get.arguments[IS_MULTI_SELECT] ?? false;
    if (Get.arguments[LIST_SELECTED]?.isNotEmpty ?? false) {
      employeeSelected.value = Get.arguments[LIST_SELECTED] ?? RxList.empty();
    }

    onSearch(searchText);
  }

  /* Action */

  void onSelect() => Get.back(result: employeeSelected.toList());

  void onSearch(String searchText) {
    this.searchText = searchText;
    if (searchText.isEmpty) {
      filterData.value = AppDataGlobal.employees;
    } else {
      filterData.value = AppDataGlobal.employees
          .where((element) => element.isCompare(searchText))
          .toList();
    }
  }

  Future<void> onSelectionEmployee(EmployeeModel employeeModel) async {
    if (isMultiSelect.value) {
      final index = employeeSelected
          .indexWhere((element) => element.id == employeeModel.id);
      if (index == -1) {
        employeeSelected.add(employeeModel);
      } else {
        employeeSelected.removeAt(index);
      }
    } else {
      Get.back(result: employeeModel);
    }
  }
}
