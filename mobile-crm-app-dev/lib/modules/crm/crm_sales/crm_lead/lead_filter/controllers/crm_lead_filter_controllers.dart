import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/lead_potential_level.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/lead_source.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/lead_stage.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';
import 'package:ui_api/crm_api/models/product/product.dart';
import 'package:ui_api/crm_api/request/lead/lead_filter_request.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/arguments.dart';
import '../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../shared/widgets/bottom_sheet/widget_multi_selection.dart';
import '../../../../../../shared/widgets/bottom_sheet/widget_single_selection.dart';

class CrmLeadFilterController extends BaseController {
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

  final filter = Rx<LeadFilterRequest>(LeadFilterRequest());

  List<int> indexSelectedPotentialLevel = [];
  List<int> indexSelectedSource = [];

  /* Init */

  CrmLeadFilterController() {
    if (Get.arguments is LeadFilterRequest) {
      filter.value = Get.arguments;
    }
  }

  /* Action */

  Future onEmployeeInCharge() async {
    await Get.toNamed(CRMRoutes.CRM_EMPLOYEE, arguments: {
      IS_MULTI_SELECT: true,
      LIST_SELECTED: filter.value.ownerEmployees,
    })?.then((value) {
      if (value != null && value is List<EmployeeModel>) {
        filter.value.ownerEmployees = value;
        filter.refresh();
      }
    });
  }

  Future onLeadPotentialLevel() async => BottomSheetUtil.createBottomSheet(
        title: 'crm.lead.source'.tr,
        child: WidgetMultiSelection<LeadPotentialLevel>(
          items: crmMasterData?.listLeadPotentialLevel
                  ?.map(
                      (e) => MultiSelectItem(e, e.leadPotentialLevelName ?? ''))
                  .toList() ??
              [],
          initialValue: filter.value.leadPotentialLevels ?? [],
          onSelectionChanged: (leadPotentialLevels) {
            filter.value.leadPotentialLevels =
                leadPotentialLevels.map((e) => e).toList();
            filter.refresh();
          },
        ),
      );

  Future onSource() async => BottomSheetUtil.createBottomSheet(
        title: 'crm.lead.source'.tr,
        child: WidgetMultiSelection<LeadSource>(
          items: crmMasterData?.leadSources
                  ?.map((e) => MultiSelectItem(e, e.leadSourceName ?? ''))
                  .toList() ??
              [],
          initialValue: filter.value.leadSources ?? [],
          onSelectionChanged: (leadSources) {
            filter.value.leadSources = leadSources.map((e) => e).toList();
            filter.refresh();
          },
        ),
      );

  Future onLeadStage() async => BottomSheetUtil.createBottomSheet(
        title: 'crm.lead.status'.tr,
        child: WidgetMultiSelection<LeadStage>(
          items: crmMasterData?.listLeadStage
                  ?.map((e) => MultiSelectItem(e, e.leadStageName ?? ''))
                  .toList() ??
              [],
          initialValue: filter.value.leadStages ?? [],
          onSelectionChanged: (leadStages) {
            filter.value.leadStages = leadStages.map((e) => e).toList();
            filter.refresh();
          },
        ),
      );

  Future onLeadProduct() async {
    await Get.toNamed(CRMRoutes.CRM_CREATE_LEAD_PRODUCT,
            arguments: filter.value.leadProducts)
        ?.then((value) {
      if (value != null && value is List<Product>) {
        filter.value.leadProducts = value;
        filter.refresh();
      }
    });
  }

  Future selectFromDate() async => showDatePicker(
        context: Get.context!,
        initialDate: filter.value.fromDate?.toLocal() ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      ).then((date) {
        if (date == null) {
          return;
        }
        filter.value.fromDate = date;
        fromDateController.text = filter.value.getFromDateText();
      });

  Future selectToDate() async => showDatePicker(
        context: Get.context!,
        initialDate: filter.value.toDate?.toLocal() ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      ).then((date) {
        if (date == null) {
          return;
        }
        filter.value.toDate = date;
        toDateController.text = filter.value.getToDateText();
      });

  Future<void> onSubmitted() async => Get.back(result: filter.value);

  Future<void> onClear() async => Get.back(result: LeadFilterRequest());
}
