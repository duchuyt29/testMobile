import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../controllers/employee_controller.dart';

class CrmEmployeePage extends GetView<EmployeeController> {
  CrmEmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            'crm.activity.employee'.tr,
            style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
          ),
          actions: [
            controller.isMultiSelect.value
                ? TextButton(
                    onPressed: controller.onSelect,
                    child: Text('crm.select'.tr,
                        style: AppTextStyle.heavy(color: Colors.white)),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        body: SafeArea(
          top: false,
          child: _buildBodyContent(),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Container(
      child: Column(
        children: [
          _buildSearchBar(),
          Divider(
            height: 2,
            thickness: 2,
            color: Colors.blue.shade400,
          ),
          Expanded(
            child: Obx(() {
              return ListView.separated(
                itemCount: controller.filterData.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) =>
                    _buildAccountCell(controller.filterData[index]),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountCell(EmployeeModel employeeModel) {
    return Obx(() {
      return ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        horizontalTitleGap: 5,
        title: Text(employeeModel.getFullname()),
        leading: controller.isMultiSelect.value
            ? Icon((controller.employeeSelected
                    .any((element) => element.id == employeeModel.id))
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank_outlined)
            : null,
        onTap: () => controller.onSelectionEmployee(employeeModel),
      );
    });
  }

  Container _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onChanged: controller.onSearch,
        decoration: InputDecoration(
          hintText: 'search'.tr,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26,
          ),
        ),
      ),
    );
  }
}
