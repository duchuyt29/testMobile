import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/crm_api/models/contact/contact.dart';
import 'package:ui_api/crm_api/request/common/filter_request.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/app_data_global.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';

class CrmAllContactController extends BaseController {
  final scrollController = ScrollController();
  RxList<Contact> listData = RxList<Contact>();

  final allRefreshController = RefreshController();
  final isMore = RxBool(true);
  int _pageAll = 0;
  FilterRequest filter = FilterRequest();

  final TextEditingController keyword = TextEditingController();

  CrmAllContactController() {
    if (AppDataGlobal.userConfig?.menuActions?.crmMasterDataContact?.view !=
        null) {
      onRefresh();
    }
  }

  void onRefresh() => _loadData(0);
  void onLoading() => _loadData(_pageAll + 1);

  void _updateRefreshController(int page, {bool isError = false}) {
    if (page == 0) {
      isError
          ? allRefreshController.refreshFailed()
          : allRefreshController.refreshCompleted();
    } else {
      isError
          ? allRefreshController.loadFailed()
          : allRefreshController.loadComplete();
    }
  }

  Future<void> _loadData(int page) async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .getContacts(
              page,
              CommonConstants.defaultSize,
              CommonConstants.sortId,
              keyword.text,
              filter.genderId ?? 0,
              filter.countryId ?? '',
              filter.provinceId ?? 0,
              filter.districtId ?? 0,
              filter.wardId ?? 0)
          .then((response) async {
        if (response.success) {
          _updateRefreshController(page);
          if (page == 0) {
            listData.clear();
          }

          final accountContents = response.data?.content ?? [];
          await Future.forEach(accountContents, (Contact item) async {
            listData.add(item);
          });
          _pageAll = page;
          isMore.value = response.data?.isMore() ?? false;
          await EasyLoading.dismiss();
        } else {
          _updateRefreshController(page, isError: true);
          await EasyLoading.dismiss();
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: response.message ?? 'notify.error'.tr);
        }
      }).catchError((onError) {
        _updateRefreshController(page, isError: true);
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onViewDetail(Contact item) async {
    await Get.toNamed(CRMRoutes.CRM_CONTACT_DETAIL, arguments: item)
        ?.then((value) => onRefresh());
  }

  Future<void> onCreateNew() async {
    await Get.toNamed(CRMRoutes.CRM_CONTACT_FORM_INFORMATION)?.then((value) {
      if (value != null) {
        onRefresh();
      }
    });
  }

  Future<void> onFilter() async {
    await Get.toNamed(CRMRoutes.CRM_CONTACT_FILTER, arguments: filter)
        ?.then((value) {
      if (value != null && value is FilterRequest) {
        filter = value;
        onRefresh();
      }
    });
  }

  Future onSearch() async {
    await _loadData(0);
  }

  Future<void> onDeleteItem(int id) async {
    try {
      await crmUIRepository.deleteContact(id).then((response) async {
        if (response.success) {
          onRefresh();
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

  Future<void> onDeleteContact(int id) async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'crm.contact.delete'.tr,
      message: 'crm.contact.delete_confirm'.tr,
      confirmTitle: 'Xóa',
      onConfirm: () {
        onDeleteItem(id);
      },
    );
  }
}
