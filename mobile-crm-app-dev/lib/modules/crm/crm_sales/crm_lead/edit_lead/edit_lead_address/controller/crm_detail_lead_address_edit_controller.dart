import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/district.dart';
import 'package:ui_api/crm_api/models/common/province.dart';
import 'package:ui_api/crm_api/models/common/ward.dart';
import 'package:ui_api/crm_api/models/lead/lead_detail.dart';
import 'package:ui_api/crm_api/request/lead/lead_address_request.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class CrmEditLeadAddressController extends BaseController {
  LeadDetail? leadDetail;

  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();

  int? indexAddressType;
  int? indexCountry;

  final currentProvince = Rxn<Province>();
  final currentDistrict = Rxn<District>();
  final currentWard = Rxn<Ward>();

  /* Init */

  CrmEditLeadAddressController() {
    leadDetail = Get.arguments as LeadDetail?;

    indexAddressType = crmMasterData?.listAccountAddressType
        ?.indexWhere((element) => element.id == leadDetail?.leadAddressTypeId);
    indexAddressType = indexAddressType == -1 ? null : indexAddressType;

    indexCountry = crmMasterData?.listCountry
        ?.indexWhere((element) => element.id == leadDetail?.leadCountryId);
    indexCountry = indexCountry == -1 ? null : indexCountry;
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    if (leadDetail == null) {
      Get.back();
    }

    addressController.text = leadDetail?.leadStreet ?? '';
    postalCodeController.text = leadDetail?.leadPostalCode ?? '';

    currentProvince.value = leadDetail?.getProvince();
    currentDistrict.value = leadDetail?.getDistrict();
    currentWard.value = leadDetail?.getWard();
  }

  /* Action */

  Future onSelectedAddressType(int index) async {
    indexAddressType = index;
  }

  Future onSelectedCountry(int index) async {
    indexCountry = index;
  }

  Future<void> onSelectionProvince() async {
    if (indexCountry == null) {
      await EasyLoading.showToast('Chưa chọn Quốc gia');
      return;
    }
    await Get.toNamed(CRMRoutes.CRM_PROVINCE, arguments: {
      COUNTRY_ID: crmMasterData?.listCountry?[indexCountry!].id,
      PROVINCE_ID: currentProvince.value?.id,
    })?.then((value) {
      if (value != null &&
          value is Province &&
          value.id != currentProvince.value?.id) {
        currentProvince.value = value;
        currentDistrict.value = null;
        currentWard.value = null;
      }
    });
  }

  Future<void> onSelectionDistrict() async {
    if (currentProvince.value == null) {
      await EasyLoading.showToast('Chưa chọn Tỉnh/Thành phố');
      return;
    }
    await Get.toNamed(CRMRoutes.CRM_DISTRICT, arguments: {
      PROVINCE_ID: currentProvince.value?.id,
      DISTRICT_ID: currentDistrict.value?.id
    })?.then((value) {
      if (value != null &&
          value is District &&
          value.id != currentDistrict.value?.id) {
        currentDistrict.value = value;
        currentWard.value = null;
      }
    });
  }

  Future<void> onSelectionWard() async {
    if (currentDistrict.value == null) {
      await EasyLoading.showToast('Chưa chọn Quận/Huyện');
      return;
    }
    await Get.toNamed(CRMRoutes.CRM_WARD, arguments: {
      DISTRICT_ID: currentDistrict.value?.id,
      WARD_ID: currentWard.value?.id
    })?.then((value) {
      if (value != null && value is Ward && value.id != currentWard.value?.id) {
        currentWard.value = value;
      }
    });
  }

  Future onUpdate() async => _callUpdateLead();

  void onCancel() => Get.back();

  /* Function */

  String getFullAddress() {
    final address = <String>[];
    if (addressController.text.isNotEmpty) {
      address.add(addressController.text);
    }
    if (currentWard.value?.wardName?.isNotEmpty ?? false) {
      address.add(currentWard.value!.wardName!);
    }
    if (currentDistrict.value?.districtName?.isNotEmpty ?? false) {
      address.add(currentDistrict.value!.districtName!);
    }
    if (currentProvince.value?.provinceName?.isNotEmpty ?? false) {
      address.add(currentProvince.value!.provinceName!);
    }
    final country = indexCountry == null
        ? null
        : crmMasterData?.listCountry?[indexCountry!];
    if (country?.countryName?.isNotEmpty ?? false) {
      address.add(country!.countryName!);
    }

    return address.join(', ');
  }

  /* Call API */

  Future<void> _callUpdateLead() async {
    final leadAddressRequest = LeadAddressRequest(id: leadDetail?.id);
    leadAddressRequest.leadAddressTypeId = indexAddressType == null
        ? null
        : crmMasterData?.listAccountAddressType?[indexAddressType!].id;

    leadAddressRequest.leadCountryId = indexCountry == null
        ? null
        : crmMasterData?.listCountry?[indexCountry!].id;

    leadAddressRequest.leadStreet = addressController.text;
    leadAddressRequest.leadPostalCode = postalCodeController.text;
    leadAddressRequest.leadWardId = currentWard.value?.id;
    leadAddressRequest.leadDistrictId = currentDistrict.value?.id;
    leadAddressRequest.leadProvinceId = currentProvince.value?.id;
    leadAddressRequest.leadStreet = getFullAddress();

    await EasyLoading.show();
    await crmUIRepository
        .updateLeadAddress(leadAddressRequest)
        .then((response) async {
      if (response.success) {
        await _callGetLeadDetail();
      } else {
        await EasyLoading.dismiss();
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
        );
      }
    }).catchError((onError) {
      EasyLoading.dismiss();

      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<void> _callGetLeadDetail() async {
    await crmUIRepository
        .getLeadDetail(leadDetail?.id ?? -1)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        leadDetail = response.data;
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'Cập nhật khách hàng tiềm năng thành công!',
          onPressed: () => Get.back(result: leadDetail),
        );
      } else {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
          onPressed: Get.back,
        );
      }
    }).catchError((onError) {
      EasyLoading.dismiss();

      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }
}
