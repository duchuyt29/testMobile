import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/opportunity/opp_sale_party_involved.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/arguments.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';
import '../views/widgets/create_sale_party_involved_modal_sheet.dart';

class OpportunitySalePartyInvolvedController extends BaseController {
  final opportunity = Rx<Opportunity>(Opportunity());
  final oppSalePartyInvolved = RxList<OppSalePartyInvolved>([]);
  OpportunitySalePartyInvolvedController() {
    opportunity.value = Get.arguments;
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
    await _loadData();
  }

  // ACTION
  Future<void> onDeleteOpportunitySalePartyInvolved(int id) async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'Bạn có chắc chắn muốn xóa Nhân sự liên quan này?',
      message: 'Nhân sự liên quan sẽ bị xóa vĩnh viễn',
      confirmTitle: 'Xóa',
      onConfirm: () {
        deleteSalePartyInvolved(id);
      },
    );
  }

  Future<void> showCreateModalBottomSheet() async {
    await Get.bottomSheet(
        CreateSalePartyInvolvedModalBottomSheet(
          onCreate: onViewCreate,
        ),
        isScrollControlled: true,
        backgroundColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ))).then((value) {
      if (value != null && value) {
        Get.back(result: true);
      }
    });
  }

  Future<void> onViewCreate(String type) async {
    await Get.offNamed(CRMRoutes.CRM_OPPORTUNITY_SALE_PARTY_INVOLVED_FORM,
        arguments: {
          PARTY_INVOLVED_TYPE: type,
          OPPORTUNITY_INFO: opportunity,
        })?.then((value) {
      if (value != null) {
        _loadData();
      }
    });
  }

  Future<void> onViewUpdate(OppSalePartyInvolved item) async {
    final type = item.employeeId != null && item.employeeId != 0
        ? CommonConstants.subjectPersonal
        : CommonConstants.subjectGroup;
    await Get.toNamed(CRMRoutes.CRM_OPPORTUNITY_SALE_PARTY_INVOLVED_FORM,
        arguments: {
          PARTY_INVOLVED_TYPE: type,
          OPPORTUNITY_INFO: opportunity,
          PARTY_INVOLVED: item,
        })?.then((value) {
      if (value != null) {
        _loadData();
      }
    });
  }

  // API CALL
  Future<void> _loadData() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .getOpportunitySalePartyInvolved(opportunity.value.id!)
          .then((response) async {
        if (response.success && response.data != null) {
          oppSalePartyInvolved.clear();
          oppSalePartyInvolved.addAll(response.data ?? []);
          await EasyLoading.dismiss();
        } else {
          await EasyLoading.dismiss();
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: response.message ?? 'notify.error'.tr);
        }
      }).catchError((onError) {
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> deleteSalePartyInvolved(int id) async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .deleteOpportunityPartyInvolved(id)
          .then((response) async {
        if (response.success) {
          await _loadData();
        } else {
          await EasyLoading.dismiss();
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: response.message ?? 'notify.error'.tr);
        }
      }).catchError((onError) {
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }
}
