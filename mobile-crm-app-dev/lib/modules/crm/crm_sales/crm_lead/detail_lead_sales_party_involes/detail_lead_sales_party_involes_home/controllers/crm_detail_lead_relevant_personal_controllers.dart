import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/lead/lead_model.dart';
import 'package:ui_api/crm_api/models/lead/lead_party_involved.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/constants/common.dart';
import '../../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../../shared/widgets/bottom_sheet/widget_crm_menu_option.dart';

class CrmDetailLeadRelevantPersonalController extends BaseController {
  final scrollController = ScrollController();
  RxList<LeadPartyInvolved> listLeadPartyInvolved = RxList<LeadPartyInvolved>();

  LeadModel? lead;
  CrmDetailLeadRelevantPersonalController() {
    lead = Get.arguments;
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .getLeadPartyInvolved(lead?.id ?? 0)
          .then((response) async {
        if (response.success) {
          await EasyLoading.dismiss();
          listLeadPartyInvolved.value = response.data!;
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

  Future<void> onDeleteAccount(int id) async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'Bạn có chắc chắn muốn xóa Nhân sự liên quan này?',
      message: 'Nhân sự liên quan sẽ bị xóa vĩnh viễn',
      confirmTitle: 'Xóa',
      onConfirm: () {
        onDeleteItem(id);
      },
    );
  }

  Future<void> onDeleteItem(int id) async {
    try {
      await crmUIRepository.deleteLeadPartyInvolved(id).then((response) async {
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

  Future<void> showCreateModalBottomSheet() async {
    await BottomSheetUtil.showBottomSheet(
      child: WidgetCrmMenuOption(
        title: 'crm.contact.involve.choose.subject'.tr,
        option: [
          MenuOptionModel(
              onAction: () {
                onViewCreate(CommonConstants.subjectPersonal);
              },
              title: 'crm.contact.involve.personal'.tr),
          MenuOptionModel(
              onAction: () {
                onViewCreate(CommonConstants.subjectGroup);
              },
              title: 'crm.contact.involve.users'.tr),
        ],
      ),
    ).then(
      (value) {
        if (value != null && value) {
          Get.back(result: true);
        }
      },
    );
  }

  Future<void> onViewCreate(String type) async {
    await Get.toNamed(CRMRoutes.CRM_CREATE_LEAD_DETAIL_RELEVANT_PERSONAL,
        arguments: {
          PARTY_INVOLVED_TYPE: type,
          LEAD_MODEL: lead,
        })?.then((value) {
      if (value != null) {
        Get.back();
        _loadData();
      }
    });
  }

  Future<void> onViewUpdate(LeadPartyInvolved item) async {
    await Get.toNamed(CRMRoutes.CRM_CREATE_LEAD_DETAIL_RELEVANT_PERSONAL,
        arguments: {
          PARTY_INVOLVED_TYPE: CommonConstants.subjectPersonal,
          LEAD_MODEL: lead,
          PARTY_INVOLVED: item,
        })?.then((value) {
      if (value != null) {
        _loadData();
      }
    });
  }
}
