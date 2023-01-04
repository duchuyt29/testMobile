import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/district.dart';
import 'package:ui_api/crm_api/models/common/province.dart';
import 'package:ui_api/crm_api/models/common/ward.dart';
import 'package:ui_api/crm_api/request/common/filter_request.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/arguments.dart';

class CrmFilterContactController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();
  int? indexGender;
  int? indexCountry;
  RxString type = ''.obs;
  Rx<FilterRequest> filter = Rx<FilterRequest>(FilterRequest());

  CrmFilterContactController() {
    if (Get.arguments != null) {
      filter.value = Get.arguments;
    }

    if (filter.value.genderId != null && filter.value.genderId != 0) {
      indexGender = crmMasterData?.listGender
          ?.indexWhere((e) => e.id == filter.value.genderId);
    }

    if (filter.value.countryId != null && filter.value.countryId!.isNotEmpty) {
      indexCountry = crmMasterData?.listCountry
          ?.indexWhere((e) => e.id == filter.value.countryId!);
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
      filter.value.countryId = crmMasterData?.listCountry?[index].id ?? '';
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadProvince() async {
    try {
      if (filter.value.countryId == null || filter.value.countryId!.isEmpty) {
        await EasyLoading.showToast('Chưa chọn Quốc gia');
        return;
      }
      await Get.toNamed(CRMRoutes.CRM_PROVINCE, arguments: {
        COUNTRY_ID: filter.value.countryId,
        PROVINCE_ID: filter.value.provinceId
      })?.then((value) {
        if (value != null && value is Province) {
          filter.value.provinceId = value.id!;
          filter.value.provinceName = value.provinceName ?? '';
          filter.value.districtId = 0;
          filter.value.districtName = '';
          filter.value.wardId = 0;
          filter.value.wardName = '';
          filter.refresh();
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadDistrict() async {
    try {
      if (filter.value.provinceId == null || filter.value.provinceId == 0) {
        await EasyLoading.showToast('Chưa chọn Tỉnh/Thành phố');
        return;
      }
      await Get.toNamed(CRMRoutes.CRM_DISTRICT, arguments: {
        PROVINCE_ID: filter.value.provinceId,
        DISTRICT_ID: filter.value.districtId
      })?.then((value) {
        if (value != null && value is District) {
          filter.value.districtId = value.id!;
          filter.value.districtName = value.districtName ?? '';
          filter.value.wardId = 0;
          filter.value.wardName = '';
          filter.refresh();
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> loadWard() async {
    try {
      if (filter.value.districtId == null || filter.value.districtId == 0) {
        await EasyLoading.showToast('Chưa chọn Quận huyện');
        return;
      }
      await Get.toNamed(CRMRoutes.CRM_WARD, arguments: {
        DISTRICT_ID: filter.value.districtId,
        WARD_ID: filter.value.wardId
      })?.then((value) {
        if (value != null && value is Ward) {
          filter.value.wardId = value.id!;
          filter.value.wardName = value.wardName ?? '';
          filter.refresh();
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> onSubmitted() async {
    if (fbKey.currentState!.saveAndValidate()) {
      Get.back(result: filter.value);
    }
  }

  Future<void> onClear() async {
    filter.value.genderId = 0;
    filter.value.countryId = '';
    filter.value.provinceId = 0;
    filter.value.provinceName = '';
    filter.value.districtId = 0;
    filter.value.districtName = '';
    filter.value.wardId = 0;
    filter.value.wardName = '';
    Get.back(result: filter.value);
  }
}
