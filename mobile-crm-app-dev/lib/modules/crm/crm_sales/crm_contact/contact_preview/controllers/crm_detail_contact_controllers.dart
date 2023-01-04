import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/contact/contact.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../shared/widgets/bottom_sheet/widget_crm_menu_action.dart';
import '../views/widgets/delete_contact_modal_bottom_sheet.dart';
import '../views/widgets/lock_contact_modal_bottom_sheet.dart';

class CrmDetailContactController extends BaseController {
  Rx<Contact> contact = Rx(Contact());
  CrmDetailContactController() {
    contact.value = Get.arguments;
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      await crmUIRepository
          .getContactDetail(contact.value.id ?? 0)
          .then((response) async {
        await EasyLoading.dismiss();
        if (response.success && response.data != null) {
          contact.value = response.data!;
        } else {
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

  /* Action */
  Future<void> showCreateModalBottomSheet() async {
    await BottomSheetUtil.showBottomSheet(
      child: WidgetCrmMenuAction(
        // onAddActivity: () {},
        onDeleteTap: onDeleteContact,
        onLockTap: () {},
      ),
    ).then(
      (value) {
        if (value != null && value) {
          Get.back(result: true);
        }
      },
    );
  }

  Future<void> onDeleteItem() async {
    try {
      await crmUIRepository
          .deleteContact(contact.value.id ?? 0)
          .then((response) async {
        if (response.success) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: 'notify.success'.tr,
              onPressed: () {
                Get.back(result: true);
              });
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

  Future<void> onDeleteContact() async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'crm.contact.delete'.tr,
      message: 'crm.contact.delete_confirm'.tr,
      confirmTitle: 'Xóa',
      onConfirm: () {
        onDeleteItem();
      },
    );
  }

  Future<void> showDeleteModalBottomSheet() async {
    await Get.bottomSheet(const DeleteContactModalBottomSheet(),
        isScrollControlled: true,
        backgroundColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )));
  }

  Future<void> showLockModalBottomSheet() async {
    await Get.bottomSheet(const LockContactModalBottomSheet(),
        isScrollControlled: true,
        backgroundColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )));
  }

  Future<void> onViewContactDetail() async {
    await Get.toNamed(CRMRoutes.CRM_CONTACT_DETAIL_DETAIL,
            arguments: contact.value)
        ?.then((value) {
      _loadData();
    });
  }

  Future<void> onViewPersonalReleventContact() async {
    await Get.toNamed(CRMRoutes.CRM_CONTACT_PERSONALRELEVANT,
        arguments: contact.value);
  }

  Future<void> onViewRelatedRelationshipContact() async {
    await Get.toNamed(CRMRoutes.CRM_CONTACT_RELATED_RELATIONSHIP,
        arguments: contact.value);
  }

  Future<void> onViewDocumentContact() async {
    await Get.toNamed(CRMRoutes.CRM_CONTACT_DOCUMENT);
  }

  Future<void> onViewFormInformation() async {
    await Get.toNamed(CRMRoutes.CRM_CONTACT_FORM_INFORMATION);
  }

  Future<void> onPhoneAction() async {
    final phoneUri = Uri(scheme: 'tel', path: contact.value.contactPhone ?? '');
    await EasyLoading.show();
    await canLaunchUrl(phoneUri).then((value) async {
      await EasyLoading.dismiss();
      if (value) {
        await launchUrl(phoneUri);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
    });
  }
}
