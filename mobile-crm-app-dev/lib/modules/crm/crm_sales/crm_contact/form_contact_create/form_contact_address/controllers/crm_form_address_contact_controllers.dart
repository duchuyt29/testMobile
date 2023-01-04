import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/district.dart';
import 'package:ui_api/crm_api/models/common/province.dart';
import 'package:ui_api/crm_api/models/common/ward.dart';
import 'package:ui_api/crm_api/models/contact/contact.dart';
// import 'package:ui_api/repository/sicix_ui_repository.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/constants/common.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class CrmFromAddressContactController extends BaseController {
  Rx<Contact> contact = Rx<Contact>(Contact());

  final fbKey = GlobalKey<FormBuilderState>();

  int? indexCountry;
  RxString type = ''.obs;

  RxString countryId = ''.obs;
  Rx<int> provinceId = Rx<int>(0);
  RxString provinceName = ''.obs;
  Rx<int> districtId = Rx<int>(0);
  RxString districtName = ''.obs;
  Rx<int> wardId = Rx<int>(0);
  RxString wardName = ''.obs;

  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  CrmFromAddressContactController() {
    final arguments = Get.arguments as Map;
    contact.value = arguments[CONTACT_INFO];
    type.value = arguments[CONTACT_ADDRESS_TYPE];

    if (type.value == CommonConstants.contactBilling) {
      countryId.value = contact.value.contactBillingCountryId ?? '';
      provinceId.value = contact.value.contactBillingProvinceId ?? 0;
      provinceName.value = contact.value.contactBillingProvinceName ?? '';
      districtId.value = contact.value.contactBillingDistrictId ?? 0;
      districtName.value = contact.value.contactBillingDistrictName ?? '';
      wardId.value = contact.value.contactBillingWardId ?? 0;
      wardName.value = contact.value.contactBillingWardName ?? '';
      zipCodeController.text = contact.value.contactBillingPostalCode ?? '';
      addressController.text = contact.value.contactBillingStreet ?? '';
    } else {
      countryId.value = contact.value.contactShippingCountryId ?? '';
      provinceId.value = contact.value.contactShippingProvinceId ?? 0;
      provinceName.value = contact.value.contactShippingProvinceName ?? '';
      districtId.value = contact.value.contactShippingDistrictId ?? 0;
      districtName.value = contact.value.contactShippingDistrictName ?? '';
      wardId.value = contact.value.contactShippingWardId ?? 0;
      wardName.value = contact.value.contactShippingWardName ?? '';
      zipCodeController.text = contact.value.contactShippingPostalCode ?? '';
      addressController.text = contact.value.contactShippingStreet ?? '';
    }

    if (countryId.value.isNotEmpty) {
      indexCountry = crmMasterData?.listCountry
          ?.indexWhere((e) => e.id == countryId.value);
    }
  }

  Future<void> selectCountry(int index) async {
    try {
      countryId.value = crmMasterData?.listCountry?[index].id ?? '';
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadProvince() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_PROVINCE, arguments: {
        COUNTRY_ID: countryId.value,
        PROVINCE_ID: provinceId.value
      })?.then((value) {
        if (value != null && value is Province) {
          provinceId.value = value.id!;
          provinceName.value = value.provinceName ?? '';
          districtId.value = 0;
          districtName.value = '';
          wardId.value = 0;
          wardName.value = '';
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadDistrict() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_DISTRICT, arguments: {
        PROVINCE_ID: provinceId.value,
        DISTRICT_ID: districtId.value
      })?.then((value) {
        if (value != null && value is District) {
          districtId.value = value.id!;
          districtName.value = value.districtName ?? '';
          wardId.value = 0;
          wardName.value = '';
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadWard() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_WARD,
              arguments: {DISTRICT_ID: districtId.value, wardId: wardId.value})
          ?.then((value) {
        if (value != null && value is Ward) {
          wardId.value = value.id!;
          wardName.value = value.wardName ?? '';
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onSubmitted() async {
    if (fbKey.currentState!.saveAndValidate()) {
      if (type == CommonConstants.contactBilling) {
        contact.value.contactBillingCountryId = countryId.value;
        contact.value.contactBillingProvinceId = provinceId.value;
        contact.value.contactBillingDistrictId = districtId.value;
        contact.value.contactBillingWardId = wardId.value;
        contact.value.contactBillingPostalCode = zipCodeController.text;
        contact.value.contactBillingStreet = addressController.text;
      } else {
        contact.value.contactShippingCountryId = countryId.value;
        contact.value.contactShippingProvinceId = provinceId.value;
        contact.value.contactShippingDistrictId = districtId.value;
        contact.value.contactShippingWardId = wardId.value;
        contact.value.contactShippingPostalCode = zipCodeController.text;
        contact.value.contactShippingStreet = addressController.text;
      }
      await updateChange();
    }
  }

  Future<void> updateChange() async {
    try {
      await crmUIRepository
          .updateContact(contact.value.id!, contact.value)
          .then((response) async {
        await EasyLoading.dismiss();
        if (response.success) {
          Get.back(result: response.data);
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
