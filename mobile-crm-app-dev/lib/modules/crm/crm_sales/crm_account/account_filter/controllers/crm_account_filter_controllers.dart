import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_account.dart';
import 'package:ui_api/crm_api/models/common/district.dart';
import 'package:ui_api/crm_api/models/common/province.dart';
import 'package:ui_api/crm_api/models/common/ward.dart';
import 'package:ui_api/crm_api/models/contact/contact.dart';
import 'package:ui_api/crm_api/models/employee/employee_model.dart';
import 'package:ui_api/crm_api/request/account/account_filter_request.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/arguments.dart';

class CrmAccountFilterController extends BaseController {
  int? indexAccountType;
  int? indexIndustry;
  int? indexGender;
  int? indexCountry;

  Rx<AccountFilterRequest> filter =
      Rx<AccountFilterRequest>(AccountFilterRequest());

  RxString responsiableText = ''.obs;

  CrmAccountFilterController() {
    if (Get.arguments != null) {
      filter.value = Get.arguments;

      if (filter.value.ownerEmployee != null) {
        responsiableText.value = filter.value.ownerEmployeeNameToString();
      }

      if (filter.value.accountTypeId != null) {
        indexAccountType = crmMasterData?.listAccountType
            ?.indexWhere((e) => e.id == filter.value.accountTypeId);
      }

      if (filter.value.industryId != null) {
        indexIndustry = crmMasterData?.listIndustry
            ?.indexWhere((e) => e.id == filter.value.industryId);
      }
      if (filter.value.genderId != null) {
        indexGender = crmMasterData?.listGender
            ?.indexWhere((e) => e.id == filter.value.genderId);
      }
      if (filter.value.accountBillingCountryId != null) {
        indexCountry = crmMasterData?.listCountry
            ?.indexWhere((e) => e.id == filter.value.accountBillingCountryId);
      }
    }
  }

  Future<void> loadEmployee() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_EMPLOYEE, arguments: {
        IS_MULTI_SELECT: true,
        LIST_SELECTED: filter.value.ownerEmployee,
      })?.then(
        (value) {
          if (value != null && value is List<EmployeeModel>) {
            filter.value.ownerEmployee = value;
            responsiableText.value = '';
            if (filter.value.ownerEmployee != null) {
              for (var i = 0; i < filter.value.ownerEmployee!.length; i++) {
                if (i == filter.value.ownerEmployee!.length - 1) {
                  responsiableText.value +=
                      filter.value.ownerEmployee![i].getFullname();
                } else {
                  responsiableText.value +=
                      '${filter.value.ownerEmployee![i].getFullname()},\n';
                }
              }
            }
            filter.refresh();
          }
        },
      );
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectAccountType(int index) async {
    try {
      filter.value.accountTypeId = crmMasterData?.listAccountType?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectIndustry(int index) async {
    try {
      filter.value.industryId = crmMasterData?.listIndustry?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadContact() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_CONTACT_ALL_MASTER, arguments: {
        IS_MULTI_SELECT: true,
        CONTACT_INFO: filter.value.relativeContact
      })?.then(
        (value) {
          if (value != null && value is List<Contact>) {
            filter.value.relativeContact = value;
            filter.refresh();
          }
        },
      );
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadCustomer() async {
    try {
      await Get.toNamed(
        CRMRoutes.CRM_ACTIVITY_ACCOUNT,
      )?.then((value) {
        if (value != null && value is ActivityAccount) {
          filter.value.relativeAccount = value;
          filter.refresh();
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectGender(int index) async {
    try {
      filter.value.genderId = crmMasterData?.listGender?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectCountry(int index) async {
    try {
      filter.value.accountBillingCountryId =
          crmMasterData?.listCountry?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadProvince() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_PROVINCE, arguments: {
        COUNTRY_ID: filter.value.accountBillingCountryId ?? '',
        PROVINCE_ID: filter.value.accountBillingProvince?.id ?? 0
      })?.then((value) {
        if (value != null) {
          final item = value as Province;
          filter.value.accountBillingProvince = item;
          filter.value.accountBillingDistrict = null;
          filter.value.accountBillingWard = null;
          filter.refresh();
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadDistrict() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_DISTRICT, arguments: {
        PROVINCE_ID: filter.value.accountBillingProvince?.id ?? 0,
        DISTRICT_ID: filter.value.accountBillingWard?.id ?? 0
      })?.then((value) {
        if (value != null) {
          final item = value as District;
          filter.value.accountBillingDistrict = item;
          filter.value.accountBillingWard = null;
          filter.refresh();
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadWard() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_WARD, arguments: {
        DISTRICT_ID: filter.value.accountBillingDistrict?.id ?? 0,
        WARD_ID: filter.value.accountBillingWard?.id ?? 0
      })?.then((value) {
        if (value != null) {
          final item = value as Ward;
          filter.value.accountBillingWard = item;
          filter.refresh();
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onSubmitted() async {
    Get.back(result: filter.value);
  }

  Future<void> onClear() async {
    filter = Rx<AccountFilterRequest>(AccountFilterRequest());
    Get.back(result: filter.value);
  }
}
