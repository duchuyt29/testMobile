import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/currency_exchange_rate.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/lead_source.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/opportunity_stage.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';
import 'package:ui_api/crm_api/models/opportunity/opp_account.dart';
import 'package:ui_api/crm_api/models/product/product.dart';
import 'package:ui_api/crm_api/request/opportunity/opportunity_filter_request.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/arguments.dart';
import '../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../shared/widgets/bottom_sheet/widget_multi_selection.dart';

class OpportunityFilterController extends BaseController {
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final fromStartDateController = TextEditingController();
  final toStartDateController = TextEditingController();

  final filter = Rx<OpportunityFilterRequest>(OpportunityFilterRequest());

  List<int> indexSelectedStage = [];
  List<int> indexSelectedSource = [];
  List<int> indexSelectedCurrency = [];

  OpportunityFilterController() {
    if (Get.arguments is OpportunityFilterRequest) {
      filter.value = Get.arguments;
    }
  }

  // Action
  Future onEmployeeInCharge() async {
    await Get.toNamed(CRMRoutes.CRM_EMPLOYEE, arguments: {
      IS_MULTI_SELECT: true,
      LIST_SELECTED: filter.value.ownerEmployees,
    })?.then((value) {
      if (value != null && value is List<EmployeeModel>) {
        filter.value.ownerEmployees = value;
        // responsiableText.value = '';
        // if (filter.value.ownerEmployee != null) {
        //   for (var i = 0; i < filter.value.ownerEmployee!.length; i++) {
        //     if (i == filter.value.ownerEmployee!.length - 1) {
        //       responsiableText.value +=
        //           filter.value.ownerEmployee![i].getFullname();
        //     } else {
        //       responsiableText.value +=
        //           '${filter.value.ownerEmployee![i].getFullname()},\n';
        //     }
        //   }
        // }
        filter.refresh();
      }
    });
  }

  Future onAccount() async {
    await Get.toNamed(CRMRoutes.CRM_SELECT_ACCOUNT, arguments: {
      IS_MULTI_SELECT: true,
      LIST_SELECTED: filter.value.accountId,
    })?.then((value) {
      if (value != null && value is List<OppAccount>) {
        filter.value.accountId = value;
        filter.refresh();
      }
    });
  }

  Future onLeadProduct() async {
    await Get.toNamed(CRMRoutes.CRM_CREATE_LEAD_PRODUCT,
            arguments: filter.value.productId)
        ?.then((value) {
      if (value != null && value is List<Product>) {
        filter.value.productId = value;
        filter.refresh();
      }
    });
  }

  Future onSource() async => BottomSheetUtil.createBottomSheet(
        title: 'crm.lead.source'.tr,
        child: WidgetMultiSelection<LeadSource>(
          items: crmMasterData?.leadSources
                  ?.map((e) => MultiSelectItem(e, e.leadSourceName ?? ''))
                  .toList() ??
              [],
          initialValue: filter.value.leadSourceId ?? [],
          onSelectionChanged: (leadSources) {
            filter.value.leadSourceId = leadSources.map((e) => e).toList();
            filter.refresh();
          },
        ),
      );

  Future onOpportunityStage() async => BottomSheetUtil.createBottomSheet(
        title: 'crm.opportunity.stage'.tr,
        child: WidgetMultiSelection<OpportunityStage>(
          items: crmMasterData?.listOpportunityStage
                  ?.map((e) => MultiSelectItem(e, e.opportunityStageName ?? ''))
                  .toList() ??
              [],
          initialValue: filter.value.stageId ?? [],
          onSelectionChanged: (opportunityStages) {
            filter.value.stageId = opportunityStages.map((e) => e).toList();
            filter.refresh();
          },
        ),
      );

  Future onCurrency() async => BottomSheetUtil.createBottomSheet(
        title: 'crm.opportunity.currency'.tr,
        child: WidgetMultiSelection<CurrencyExchangeRate>(
          items: crmMasterData?.listCurrencyExchangeRate
                  ?.map((e) => MultiSelectItem(e, e.currencyName ?? ''))
                  .toList() ??
              [],
          initialValue: filter.value.currencyExchangeRateId ?? [],
          onSelectionChanged: (currencies) {
            filter.value.currencyExchangeRateId =
                currencies.map((e) => e).toList();
            filter.refresh();
          },
        ),
      );

  Future selectFromDate() async => showDatePicker(
        context: Get.context!,
        initialDate: filter.value.fromDate ?? DateTime.now(),
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
        initialDate: filter.value.toDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      ).then((date) {
        if (date == null) {
          return;
        }
        filter.value.toDate = date;
        toDateController.text = filter.value.getToDateText();
      });

  Future selectFromStartDate() async => showDatePicker(
        context: Get.context!,
        initialDate: filter.value.fromStartDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      ).then((date) {
        if (date == null) {
          return;
        }
        filter.value.fromStartDate = date;
        fromStartDateController.text = filter.value.getFromStartDateText();
      });

  Future selectToStartDate() async => showDatePicker(
        context: Get.context!,
        initialDate: filter.value.toStartDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      ).then((date) {
        if (date == null) {
          return;
        }
        filter.value.toStartDate = date;
        toStartDateController.text = filter.value.getToStartDateText();
      });

  Future<void> onSubmitted() async => Get.back(result: filter.value);

  Future<void> onClear() async => Get.back(result: OpportunityFilterRequest());
}
