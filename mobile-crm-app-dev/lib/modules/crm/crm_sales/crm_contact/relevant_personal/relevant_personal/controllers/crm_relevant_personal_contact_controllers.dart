import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/contact/contact.dart';
import 'package:ui_api/crm_api/models/contact/contact_party_involved.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/constants/common.dart';
import '../../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../../shared/widgets/bottom_sheet/widget_crm_menu_option.dart';

class CrmRelevantPersonalContactController extends BaseController {
  final scrollController = ScrollController();
  RxList<ContactPartyInvolved> listContactPartyInvolved =
      RxList<ContactPartyInvolved>();

  Contact? contact;
  CrmRelevantPersonalContactController() {
    contact = Get.arguments;
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .getContactPartyInvolved(contact?.id ?? 0)
          .then((response) async {
        if (response.success) {
          await EasyLoading.dismiss();
          listContactPartyInvolved.value = response.data!;
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
      title: 'Xoá nhân sự liên quan',
      message:
          'Bạn có chắc chắn muốn xóa Nhân sự liên quan này? \nNhân sự liên quan sẽ bị xóa vĩnh viễn',
      confirmTitle: 'Xóa',
      onConfirm: () {
        onDeleteItem(id);
      },
    );
  }

  Future<void> onDeleteItem(int id) async {
    try {
      await crmUIRepository
          .deleteContactPartyInvolved(id)
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

  Future<void> showCreateModalBottomSheet() async {
    await BottomSheetUtil.showBottomSheet(
      child: WidgetCrmMenuOption(
        title: 'crm.contact.involve.choose.subject'.tr,
        option: [
          MenuOptionModel(
              onAction: () {
                Get.back();
                onViewCreate(CommonConstants.subjectPersonal);
              },
              title: 'crm.contact.involve.personal'.tr),
          MenuOptionModel(
              onAction: () {
                Get.back();
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
    await Get.toNamed(CRMRoutes.CRM_CONTACT_CREATE_FORM_PERSONALRELEVANT,
        arguments: {
          PARTY_INVOLVED_TYPE: type,
          CONTACT_INFO: contact,
        })?.then((value) {
      if (value != null) {
        _loadData();
      }
    });
  }

  Future<void> onViewUpdate(ContactPartyInvolved item) async {
    final type = item.employeeId != null && item.employeeId != 0
        ? CommonConstants.subjectPersonal
        : CommonConstants.subjectGroup;
    await Get.toNamed(CRMRoutes.CRM_CONTACT_CREATE_FORM_PERSONALRELEVANT,
        arguments: {
          PARTY_INVOLVED_TYPE: type,
          CONTACT_INFO: contact,
          PARTY_INVOLVED: item,
        })?.then((value) {
      if (value != null) {
        _loadData();
      }
    });
  }
}
