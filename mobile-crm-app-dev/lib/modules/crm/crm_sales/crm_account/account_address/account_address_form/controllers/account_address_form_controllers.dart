import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import 'package:ui_api/crm_api/models/account/account_address.dart';
import 'package:ui_api/crm_api/models/common/district.dart';
import 'package:ui_api/crm_api/models/common/province.dart';
import 'package:ui_api/crm_api/models/common/ward.dart';
import 'package:ui_api/crm_api/request/account/account_address_request.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/constants/common.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class AccountAddressFormController extends BaseController {
  final accountInfo = Rxn<AccountInfo>();
  final fbKey = GlobalKey<FormBuilderState>();

  final provinces = Rxn<List<Province>>();
  final districts = Rxn<List<District>>();
  final wards = Rxn<List<Ward>>();

  int? addressId;
  int? indexAddressType;
  int? indexCountry;
  final indexProvince = Rxn<int>();
  int? indexDistrict;
  int? indexWard;
  List<AccountAddress> listAddress = [];

  final TextEditingController zipCode = TextEditingController();
  final TextEditingController address = TextEditingController();

  final accountAddress = Rxn<AccountAddress>(AccountAddress());

  AccountAddressFormController() {
    final arguments = Get.arguments as Map;
    accountInfo.value = arguments[ACCOUNT_INFO];

    if (arguments[ADDRESS_ID] != null) {
      addressId = arguments[ADDRESS_ID];
      final index = accountInfo.value?.accountAddresses
          ?.indexWhere((element) => element.id == addressId);
      accountAddress.value = accountInfo.value?.accountAddresses?[index!];

      if (accountAddress.value?.accountAddressTypeId != null) {
        indexAddressType = crmMasterData?.listAccountAddressType?.indexWhere(
            (e) => e.id == accountAddress.value?.accountAddressTypeId);
      }
      if (accountAddress.value?.accountAddressCountryId != null) {
        indexCountry = crmMasterData?.listCountry?.indexWhere(
            (e) => e.id == accountAddress.value?.accountAddressCountryId);
      }

      zipCode.text = accountAddress.value?.accountAddressPostalCode ?? '';
      address.text = accountAddress.value?.accountAddressStreet ?? '';
    }
  }
  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> loadProvince() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_PROVINCE, arguments: {
        COUNTRY_ID: accountAddress.value?.accountAddressCountryId ?? '',
        PROVINCE_ID: accountAddress.value?.accountAddressProvinceId
      })?.then((value) {
        if (value != null) {
          final item = value as Province;
          accountAddress.value?.accountAddressProvinceId = item.id;
          accountAddress.value?.accountAddressProvinceName = item.provinceName;
          accountAddress.value?.accountAddressDistrictId = 0;
          accountAddress.value?.accountAddressDistrictName = '';
          accountAddress.value?.accountAddressWardId = 0;
          accountAddress.value?.accountAddressWardName = '';
          accountAddress.refresh();
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadDistrict() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_DISTRICT, arguments: {
        PROVINCE_ID: accountAddress.value?.accountAddressProvinceId ?? '',
        DISTRICT_ID: accountAddress.value?.accountAddressDistrictId
      })?.then((value) {
        if (value != null) {
          final item = value as District;
          accountAddress.value?.accountAddressDistrictId = item.id;
          accountAddress.value?.accountAddressDistrictName = item.districtName;
          accountAddress.value?.accountAddressWardId = 0;
          accountAddress.value?.accountAddressWardName = '';
          accountAddress.refresh();
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadWard() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_WARD, arguments: {
        DISTRICT_ID: accountAddress.value?.accountAddressDistrictId ?? '',
        WARD_ID: accountAddress.value?.accountAddressWardId
      })?.then((value) {
        if (value != null) {
          final item = value as Ward;
          accountAddress.value?.accountAddressWardId = item.id;
          accountAddress.value?.accountAddressWardName = item.wardName;
          accountAddress.refresh();
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectType(int index) async {
    try {
      accountAddress.value?.accountAddressTypeId =
          crmMasterData?.listAccountAddressType?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectCountry(int index) async {
    try {
      accountAddress.value?.accountAddressCountryId =
          crmMasterData?.listCountry?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectWard(int index) async {
    try {
      accountAddress.value?.accountAddressWardId = wards.value?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  //address
  Future<void> onSubmitAddress() async {
    try {
      if (fbKey.currentState?.validate() ?? false) {
        accountAddress.value?.accountAddressPostalCode = zipCode.text;
        accountAddress.value?.accountAddressStreet = address.text;
        if (addressId != null) {
          await _update();
        } else {
          await _insert();
        }
      }
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> _insert() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .insertAccountAddress(AccountAddressRequest(
        accountId: accountInfo.value?.id ?? 0,
        id: accountAddress.value?.id ?? 0,
        accountAddressTypeId: accountAddress.value?.accountAddressTypeId,
        accountAddressStreet: accountAddress.value?.accountAddressStreet,
        accountAddressWardId: accountAddress.value?.accountAddressWardId,
        accountAddressDistrictId:
            accountAddress.value?.accountAddressDistrictId,
        accountAddressProvinceId:
            accountAddress.value?.accountAddressProvinceId,
        accountAddressCountryId: accountAddress.value?.accountAddressCountryId,
        accountAddressPostalCode:
            accountAddress.value?.accountAddressPostalCode,
        isMain: accountAddress.value?.isMain,
      ))
          .then((response) async {
        await EasyLoading.dismiss();
        if (response.success) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: 'notify.success'.tr,
              onPressed: () {
                Get.back(result: true);
              });
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

  Future<void> _update() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .updateAccountAddress(
              accountAddress.value!.id!,
              AccountAddressRequest(
                accountId: accountInfo.value?.id ?? 0,
                id: accountAddress.value?.id ?? 0,
                accountAddressTypeId:
                    accountAddress.value?.accountAddressTypeId,
                accountAddressStreet:
                    accountAddress.value?.accountAddressStreet,
                accountAddressWardId:
                    accountAddress.value?.accountAddressWardId,
                accountAddressDistrictId:
                    accountAddress.value?.accountAddressDistrictId,
                accountAddressProvinceId:
                    accountAddress.value?.accountAddressProvinceId,
                accountAddressCountryId:
                    accountAddress.value?.accountAddressCountryId,
                accountAddressPostalCode:
                    accountAddress.value?.accountAddressPostalCode,
                isMain: accountAddress.value?.isMain,
              ))
          .then((response) async {
        await EasyLoading.dismiss();
        if (response.success) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr,
              message: 'notify.success'.tr,
              onPressed: () {
                Get.back(result: true);
              });
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
}
