import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import 'package:ui_api/crm_api/request/account/account_filter_request.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/app_data_global.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../shared/widgets/bottom_sheet/widget_crm_menu_option.dart';

class CrmAllAccountController extends BaseController {
  final scrollController = ScrollController();
  RxList<Account> listAccounts = RxList<Account>();
  AccountFilterRequest filter = AccountFilterRequest();

  final allRefreshController = RefreshController();
  final isMore = RxBool(true);
  int _pageAll = 0;

  final TextEditingController keyword = TextEditingController();

  CrmAllAccountController() {
    if (AppDataGlobal.userConfig?.menuActions
            ?.crmMasterDataAccount?.view !=
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
          .searchAccounts(
        page: page,
        size: CommonConstants.defaultSize,
        sort: CommonConstants.sortId,
        search: keyword.text,
        ownerEmployeeId: filter.ownerEmployeeIdToString(),
        accountTypeId:
            filter.accountTypeId != null ? filter.accountTypeId.toString() : '',
        industryId:
            filter.industryId != null ? filter.industryId.toString() : '',
        relativeAccount: filter.relativeAccount != null
            ? filter.relativeAccount?.id.toString() ?? ''
            : '',
        relativeContact: filter.contactIdToString(),
        genderId: filter.genderId != null ? filter.genderId.toString() : '',
        accountBillingCountryId: filter.accountBillingCountryId ?? '',
        accountBillingProvinceId: filter.accountBillingProvince?.id ?? 0,
        accountBillingDistrictId: filter.accountBillingDistrict?.id ?? 0,
        accountBillingWardId: filter.accountBillingWard?.id ?? 0,
      )
          .then((response) async {
        if (response.success) {
          _updateRefreshController(page);
          if (page == 0) {
            listAccounts.clear();
          }

          final accountContents = response.data?.content ?? [];
          await Future.forEach(accountContents, (Account account) async {
            listAccounts.add(account);
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

  Future<void> onViewAccountDetail(Account item) async {
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_DETAIL, arguments: item)
        ?.then((value) => onRefresh());
  }

  Future<void> onFilter() async {
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_FILTER, arguments: filter)
        ?.then((value) {
      if (value != null && value is AccountFilterRequest) {
        filter = value;
        onRefresh();
      }
    });
  }

  Future<void> onViewCreateNewAccount() async {
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_FORM_CREATE)?.then((value) {
      if (value != null && value) {
        onRefresh();
      }
    });
  }

  Future onSearchAccount() async {
    await _loadData(0);
  }

  Future<void> onDeleteItem(int id) async {
    try {
      await crmUIRepository.deleteAccount(id).then((response) async {
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

  Future<void> onLockAccount(Account item) async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title:
          item.isActive == 1 ? 'crm.account.lock'.tr : 'crm.account.unlock'.tr,
      message: item.isActive == 1
          ? 'crm.account.lock_confirm'.tr
          : 'crm.account.unlock_confirm'.tr,
      confirmTitle: 'confirm'.tr,
      onConfirm: () {
        _onValidateLock(item);
      },
    );
  }

  Future<void> _onValidateLock(Account item) async {
    try {
      if (item.isActive == 1) {
        await crmUIRepository
            .getAccountCount(item.id ?? 0)
            .then((response) async {
          if (response.success) {
            final isUsed = response.data?.isUsed ?? 0;
            if (isUsed > 0) {
              await DialogUtil.createDialogMessage(
                  title: 'notify.title'.tr,
                  message:
                      'Tài khoản đang trong giao dịch, không thể khoá.'.tr);
            } else {
              await _onLockAccount(item.id ?? 0);
            }
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
      } else {
        await _onLockAccount(item.id ?? 0);
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> _onLockAccount(int id) async {
    try {
      await crmUIRepository.lockAccount(id).then((response) async {
        if (response.success) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: 'notify.success'.tr,
              onPressed: onRefresh);
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
      title: 'crm.account.delete.account'.tr,
      message: 'crm.account.delete_confirm'.tr,
      confirmTitle: 'Xóa',
      onConfirm: () {
        onDeleteItem(id);
      },
    );
  }

  Future<void> showCreateModalBottomSheet(BuildContext context) async {
    await Get.bottomSheet(
      Wrap(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text('crm.create.choose_type'.tr,
                  style: AppTextStyle.bold(fontSize: 18)),
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
            ListTile(
              title: Text(
                'crm_activity_job'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.heavy(color: Colors.blue.shade700),
              ),
              onTap: () => Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_JOB)
                  ?.then((value) {
                if (value != null && value) {
                  onRefresh();
                }
              }),
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
            ListTile(
              title: Text(
                'crm_activity_call'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.heavy(color: Colors.blue.shade700),
              ),
              onTap: () => Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_CALL)
                  ?.then((value) {
                if (value != null && value) {
                  onRefresh();
                }
              }),
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
            ListTile(
              title: Text(
                'crm_activity_email'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.heavy(color: Colors.blue.shade700),
              ),
              onTap: () => Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_EMAIL)
                  ?.then((value) {
                if (value != null && value) {
                  onRefresh();
                }
              }),
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
            ListTile(
              title: Text(
                'crm_activity_meeting'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.heavy(color: Colors.blue.shade700),
              ),
              onTap: () =>
                  Get.offNamed(CRMRoutes.CRM_ACTIVITY_ADD_FORM_APPOINTMENT)
                      ?.then((value) {
                if (value != null && value) {
                  onRefresh();
                }
              }),
            ),
            Container(
              height: 1,
              color: Colors.grey.shade300,
            ),
            InkWell(
              onTap: Get.back,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                margin: const EdgeInsets.only(left: 2, right: 2, bottom: 2),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   border: Border.all(color: Colors.grey.shade300),
                //   borderRadius: BorderRadius.circular(15),
                // ),
                child: Text('crm_discard'.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.heavy(color: Colors.blue.shade700)),
              ),
            ),
          ],
        ),
      ]),
      isScrollControlled: true,
      backgroundColor: Colors.grey.shade200,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  Future<void> onPhoneAction(Account item) async {
    final phoneUri = Uri(scheme: 'tel', path: item.accountPhone ?? '');
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

  Future<void> onViewCreateOption() async {
    await BottomSheetUtil.showBottomSheet(
      child: WidgetCrmMenuOption(
        title: 'crm.contact.involve.choose.subject'.tr,
        option: [
          ...List.generate(crmMasterData?.listAccountType?.length ?? 0,
              (index) {
            return MenuOptionModel(
                onAction: () {
                  Get.back();
                  _onViewCreate(crmMasterData?.listAccountType?[index].id ?? 0);
                },
                title: crmMasterData?.listAccountType?[index].accountTypeName ??
                    '');
          }),
          // MenuOptionModel(
          //     onAction: Get.back,
          //     title: 'cancel'.tr)
        ],
      ),
    );
  }

  Future<void> _onViewCreate(int type) async {
    await Get.toNamed(CRMRoutes.CRM_ACCOUNT_FORM_CREATE, arguments: type)
        ?.then((value) {
      if (value != null) {
        refresh();
      }
    });
  }
}
