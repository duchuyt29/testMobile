import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';

import '../../../../../data/app_data_global.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../shared/widgets/bottom_sheet/widget_crm_multi_select.dart';
import '../../../../../shared/widgets/form/widget_form_date_field.dart';
import '../../../../../shared/widgets/form/widget_form_label_box.dart';
import '../controllers/crm_filter_activity_controllers.dart';

class CrmFilterActivityPage extends GetView<CrmFilterActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('crm.filter'.tr,
            style: AppTextStyle.heavy(fontSize: 24, color: Colors.white)),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Obx(_buildBodyContent),
        ),
      ),
      bottomNavigationBar: _buildButtonSave(),
    );
  }

  Widget _buildBodyContent() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 10),
                    CrmWidgetFormLabelBox(
                      label: 'crm.activity.type.of'.tr,
                      text: controller.activityType.value,
                      onPress: () async {
                        await BottomSheetUtil.createMultiSelectItemBottomSheet(
                          title: 'crm.activity.type.of'.tr,
                          child: WidgetCrmMultiSelectItem(
                            items: CommonConstants.activityType,
                            selectedItems: controller.activityTypeSelected,
                          ),
                          onVaLue: (value) {
                            controller.getTextFromList(controller.activityType,
                                controller.activityTypeSelected, 1, false);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    CrmWidgetFormLabelBox(
                      label: 'crm.activity.belonged'.tr,
                      text: controller.tasksObject.value,
                      onPress: () async {
                        await BottomSheetUtil.createMultiSelectItemBottomSheet(
                          title: 'crm.activity.belonged'.tr,
                          child: WidgetCrmMultiSelectItem(
                            items: CommonConstants.tasksObject,
                            selectedItems: controller.tasksObjectSelected,
                          ),
                          onVaLue: (value) {
                            controller.getTextFromList(controller.tasksObject,
                                controller.tasksObjectSelected, 2, false);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    CrmWidgetFormLabelBox(
                      label: 'crm.activity.status'.tr,
                      text: controller.state.value,
                      onPress: () async {
                        await BottomSheetUtil.createMultiSelectItemBottomSheet(
                          title: 'crm.activity.status'.tr,
                          child: WidgetCrmMultiSelectItem(
                            items: CommonConstants.filterActivityState,
                            selectedItems: controller.stateSelected,
                          ),
                          onVaLue: (value) {
                            controller.getTextFromList(controller.state,
                                controller.stateSelected, 3, true);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    CrmWidgetFormLabelBox(
                      label: 'crm.activity.priority.level'.tr,
                      text: controller.priority.value,
                      onPress: () async {
                        await BottomSheetUtil.createMultiSelectItemBottomSheet(
                          title: 'crm.activity.priority.level'.tr,
                          child: WidgetCrmMultiSelectItem(
                            items: AppDataGlobal.crmMasterData?.listPriority
                                    ?.map((e) => e.priorityName ?? '')
                                    .toList() ??
                                [],
                            selectedItems: controller.prioritySelected,
                          ),
                          onVaLue: (value) {
                            controller.getTextFromList(controller.priority,
                                controller.prioritySelected, 4, false);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    CrmWidgetFormLabelBox(
                      label: 'crm.activity.responsible'.tr,
                      text: controller.responsiableText.value,
                      onPress: controller.loadResponsibleEmployee,
                    ),
                    const SizedBox(height: 10),
                    CrmWidgetFormLabelBox(
                      label: 'crm.activity.requester'.tr,
                      text: controller.requesterText.value,
                      onPress: controller.loadRequesterEmployee,
                    ),
                    const SizedBox(height: 10),
                    CrmWidgetBuildFormDateField(
                      title: 'crm.activity.day.start.from'.tr,
                      controller: controller.dateStartFromtText,
                      selectDate: () => controller.selectDate(
                          controller.dateStartFromtText,
                          FilterActivityDateTimeType.START_DATE_FROM),
                    ),
                    const SizedBox(height: 10),
                    CrmWidgetBuildFormDateField(
                      title: 'crm.activity.day.start.come'.tr,
                      controller: controller.dateStartToText,
                      selectDate: () => controller.selectDate(
                          controller.dateStartToText,
                          FilterActivityDateTimeType.START_DATE_TO),
                    ),
                    const SizedBox(height: 10),
                    CrmWidgetBuildFormDateField(
                      title: 'crm.activity.day.end.from'.tr,
                      controller: controller.dateFinishFromtText,
                      selectDate: () => controller.selectDate(
                          controller.dateFinishFromtText,
                          FilterActivityDateTimeType.DONE_DATE_FROM),
                    ),
                    const SizedBox(height: 10),
                    CrmWidgetBuildFormDateField(
                      title: 'crm.activity.day.end.come'.tr,
                      controller: controller.dateFinishToText,
                      selectDate: () => controller.selectDate(
                          controller.dateFinishToText,
                          FilterActivityDateTimeType.DONE_DATE_TO),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtonSave() {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                controller.activityTypeSelected.clear();
                controller.activityType.value = '';
                controller.tasksObjectSelected.clear();
                controller.tasksObject.value = '';
                controller.stateSelected.clear();
                controller.state.value = '';
                controller.prioritySelected.clear();
                controller.priority.value = '';
                controller.responsiable.clear();
                controller.responsiableText.value = '';
                controller.requester.clear();
                controller.requesterText.value = '';
                controller.dateStartFrom = null;
                controller.dateStartFromtText.text = '';
                controller.dateStartTo = null;
                controller.dateStartToText.text = '';
                controller.dateDoneFrom = null;
                controller.dateFinishFromtText.text = '';
                controller.dateDoneTo = null;
                controller.dateFinishToText.text = '';
                controller.deadlineFrom = null;
                controller.deadlineFromtText.text = '';
                controller.deadlineTo = null;
                controller.deadlineToText.text = '';
              },
              child: Text(
                'crm.activity.delete.filter'.tr,
                style: AppTextStyle.regular(
                    fontSize: 18, color: AppColor.primaryColor),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                Get.back(result: {
                  'activityType': controller.activityTypeSelected,
                  'tasksObject': controller.tasksObjectSelected,
                  'state': controller
                      .getStateSelectedValue(controller.stateSelected),
                  'priority': controller.prioritySelected,
                  'responsiable': controller.responsiable.isNotEmpty
                      ? controller.responsiable.value
                      : null,
                  'requester': controller.requester.isNotEmpty
                      ? controller.requester.value
                      : null,
                  'dateStartFrom': controller.dateStartFrom,
                  'dateStartTo': controller.dateStartTo,
                  'dateDoneFrom': controller.dateDoneFrom,
                  'dateDoneTo': controller.dateDoneTo,
                  'deadlineFrom': controller.deadlineFrom,
                  'deadlineTo': controller.deadlineTo,
                });
              },
              child: Text(
                'crm.contact.apply'.tr,
                style: AppTextStyle.regular(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // Widget _buildMultiSelect({
  //   required String title,
  //   required String name,
  // }) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //           padding: const EdgeInsets.only(right: 24, bottom: 8),
  //           child: WidgetInputLabel(
  //             label: title,
  //           )),
  //       DropDownMultiSelect(
  //         options: CommonConstants.tasksObject,
  //         // whenEmpty: 'Select State Management Library',
  //         onChanged: (value) {
  //           controller.selectedOptionList.value = value;
  //           controller.selectedOption.value = '';
  //           controller.selectedOptionList.value.forEach((element) {
  //             controller.selectedOption.value =
  //                 '${controller.selectedOption.value} $element';
  //           });
  //         },
  //         selectedValues: controller.selectedOptionList.value,
  //       ),
  //     ],
  //   );
  // }
}
