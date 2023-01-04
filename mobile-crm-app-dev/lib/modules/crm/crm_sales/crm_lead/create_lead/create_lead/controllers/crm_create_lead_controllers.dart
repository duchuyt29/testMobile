import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:tiengviet/tiengviet.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/account_address_type.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/country.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/gender.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/lead_stage.dart';
import 'package:ui_api/crm_api/models/common/district.dart';
import 'package:ui_api/crm_api/models/common/province.dart';
import 'package:ui_api/crm_api/models/common/ward.dart';
import 'package:ui_api/crm_api/models/lead/lead_detail.dart';
import 'package:ui_api/crm_api/models/lead/lead_stage_reason.dart';
import 'package:ui_api/crm_api/models/product/product.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../data/app_data_global.dart';
import '../../../../../../../routes/common_pages.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../../shared/utils/date_util.dart';
import '../../../../../../../shared/utils/dialog_util.dart';
import '../../../../../../../shared/widgets/bottom_sheet/widget_single_selection.dart';

class CrmCreateLeadController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();

  final employeeInChargeController = TextEditingController();
  final startDateController = TextEditingController();

  final leadStageReasonController = TextEditingController();
  final isRequiredLeadStageReason = RxBool(false);
  final selcetedLeadStageReason = Rxn<LeadStageReason>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final positionController = TextEditingController();
  final companyController = TextEditingController();
  final sourceDescriptionController = TextEditingController();

  final genderController = TextEditingController();
  final selectedGender = Rxn<Gender>();

  final descriptionController = TextEditingController();

  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();

  final productController = TextEditingController();

  int? indexLeadStage;
  int? indexPotenitalLevel;
  DateTime startDate = DateTime.now();

  int? indexSalutation;
  // int? indexGender;
  int? indexIndustry;
  int? indexSource;

  final accountAddressTypeController = TextEditingController();
  final selectedAccountAddressType = Rxn<AccountAddressType>();

  final countryController = TextEditingController();
  final selectedCountry = Rxn<Country>();
  // int? indexAddressType;
  // int? indexCountry;

  final currentProvince = Rxn<Province>();
  final currentDistrict = Rxn<District>();
  final currentWard = Rxn<Ward>();

  final products = RxList<Product>();

  /* Init */

  CrmCreateLeadController() {
    if (crmMasterData?.listLeadStage?.isNotEmpty ?? false) {
      indexLeadStage = 0;
      final leadStateId = crmMasterData?.listLeadStage?[0].id ?? 0;
      _callGetLeadStageReason(leadStateId);
    }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    startDateController.text =
        DateUtil.formatDatetimeToString(startDate.toUtc());
    employeeInChargeController.text = AppDataGlobal.userInfo?.getName() ?? '';
  }

  /* Action */

  Future onScanQRCode() async {
    await Get.toNamed(CommonRoutes.SCAN_QR_CODE)?.then((value) async {
      if (value != null && value is String) {
        final infos = value.split('|');
        if (infos.isEmpty) {
          return;
        }
        infos.asMap().forEach((index, value) {
          switch (index) {
            case 0: // cccd number
              break;
            case 1: // old cccd number
              break;
            case 2:
              nameController.text = value;
              break;
            case 3: // Birthday
              break;
            case 4: // Gender
              if (TiengViet.parse(value).toLowerCase().contains('nam')) {
                selectedGender.value = Gender.male;
                genderController.text = selectedGender.value?.genderName ?? '';
              } else if (TiengViet.parse(value).toLowerCase().contains('nu')) {
                selectedGender.value = Gender.female;
                genderController.text = selectedGender.value?.genderName ?? '';
              }
              break;
            case 5: // Address
              _callGetAddressFromString(value);
              break;
          }
        });
      }
    });
  }

  Future onSelectedLeadStatus(int index) async {
    indexLeadStage = index;

    final leadStage = crmMasterData?.listLeadStage?[index];
    await _callGetLeadStageReason(leadStage?.id ?? 0);
  }

  Future onSelectedPotenitalLevel(int index) async {
    indexPotenitalLevel = index;
  }

  Future selectStartDate() async {
    await showDatePicker(
      context: Get.context!,
      initialDate: startDate.toLocal(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((date) {
      if (date == null) {
        return;
      }
      startDate = date;
      startDateController.text = DateUtil.formatDatetimeToString(date.toUtc());
    });
  }

  Future onSalutation(int index) async {
    indexSalutation = index;
  }

  Future onSelectedSource(int index) async {
    indexSource = index;
  }

  Future onSelectedGender() async {
    return BottomSheetUtil.createBottomSheet(
      title: 'crm.account.gender'.tr,
      child: WidgetSingleSelection<Gender>(
        items: crmMasterData?.listGender
                ?.map((e) => SingleSelectionItem(e, e.genderName ?? ''))
                .toList() ??
            [],
        initialValue: selectedGender.value,
        onSelectionChanged: (leadStageReason) {
          selectedGender.value = leadStageReason;
          genderController.text = leadStageReason.genderName ?? '';
        },
      ),
    );
  }

  Future onSelectedIndustry(int index) async {
    indexIndustry = index;
  }

  Future onSelectedAddressType() async {
    return BottomSheetUtil.createBottomSheet(
      title: 'crm.account.address.type'.tr,
      child: WidgetSingleSelection<AccountAddressType>(
        items: crmMasterData?.listAccountAddressType
                ?.map((e) =>
                    SingleSelectionItem(e, e.accountAddressTypeName ?? ''))
                .toList() ??
            [],
        initialValue: selectedAccountAddressType.value,
        onSelectionChanged: (accountAddressType) {
          selectedAccountAddressType.value = accountAddressType;
          accountAddressTypeController.text =
              accountAddressType.accountAddressTypeName ?? '';
        },
      ),
    );
  }

  Future onLeadProduct() async {
    await Get.toNamed(CRMRoutes.CRM_CREATE_LEAD_PRODUCT,
            arguments: products.toList())
        ?.then((value) {
      if (value != null && value is List<Product>) {
        products.value = value;
      }
    });
  }

  Future onChangeLeadStageReason() async {
    final leadStageId = indexLeadStage == null
        ? null
        : crmMasterData?.listLeadStage?[indexLeadStage!].id;
    if (leadStageId == null) {
      return;
    }
    // final leadStageReasons = await _getLeadStageReason(leadStageId);
    // if (leadStageReasons == null || leadStageReasons.isEmpty) {
    //   await EasyLoading.showToast(
    //       'Không có lý do từ chối ứng với trạng thái đang chọn');
    //   return;
    // }
    final leadStageReasons = AppDataGlobal.leadStageReasons[leadStageId] ?? [];
    if (leadStageReasons.isEmpty) {
      await EasyLoading.showToast(
          'Không có lý do từ chối ứng với trạng thái đang chọn');
      return;
    }
    return BottomSheetUtil.createBottomSheet(
      title: 'crm.lead.refusal.reason'.tr,
      child: WidgetSingleSelection<LeadStageReason>(
        items: leadStageReasons
            .map((e) => SingleSelectionItem(e, e.leadStageReasonName ?? ''))
            .toList(),
        initialValue: selcetedLeadStageReason.value,
        onSelectionChanged: (leadStageReason) {
          selcetedLeadStageReason.value = leadStageReason;
          leadStageReasonController.text =
              leadStageReason.leadStageReasonName ?? '';
        },
      ),
    );
  }

  Future onSelectedCountry() async {
    return BottomSheetUtil.createBottomSheet(
      title: 'crm.account.country'.tr,
      child: WidgetSingleSelection<Country>(
        items: crmMasterData?.listCountry
                ?.map((e) => SingleSelectionItem(e, e.countryName ?? ''))
                .toList() ??
            [],
        initialValue: selectedCountry.value,
        onSelectionChanged: (country) {
          selectedCountry.value = country;
          countryController.text = country.countryName ?? '';
        },
      ),
    );
  }

  Future<void> onSelectionProvince() async {
    if (selectedCountry.value == null) {
      await EasyLoading.showToast('Chưa chọn Quốc gia');
      return;
    }
    await Get.toNamed(CRMRoutes.CRM_PROVINCE, arguments: {
      COUNTRY_ID: selectedCountry.value!.id,
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

  Future onSave() async {
    // await Get.toNamed(CRMRoutes.CRM_LEAD_CREATE_FORM_INFORMATION);
    if (fbKey.currentState!.saveAndValidate()) {
      final leadPhoneExist = await _callCheckLeadPhoneExist();
      if (leadPhoneExist) {
        await DialogUtil.createDialogConfirm(
          title: 'Trùng số điện thoại',
          message:
              'Số điện thoại bạn vừa nhập trùng với khách hàng tiềm năng khác. Bạn có chắc chắn muốn lưu?',
          confirmTitle: 'Lưu và đóng',
          backgroundButtonColor: AppColor.primaryColor,
          onConfirm: () {
            _callCreateLead();
          },
        );
      } else {
        await _callCreateLead();
      }
    } else {
      await EasyLoading.showToast(
          'Chưa điền đủ thông tin để tạo khách hàng tiềm năng!');
    }
  }

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
    if (selectedCountry.value?.countryName?.isNotEmpty ?? false) {
      address.add(selectedCountry.value!.countryName!);
    }

    return address.join(', ');
  }

  /* Call API */

  Future<void> _callCreateLead() async {
    await EasyLoading.show();

    final request = LeadDetail(
      employeeId: AppDataGlobal.userInfo?.employeeInfo?.id ?? 0,
      // genderId: indexGender == null
      //     ? null
      //     : crmMasterData?.listGender?[indexGender!].id,
      genderId: selectedGender.value?.id,
      salutationId: indexSalutation == null
          ? null
          : crmMasterData?.listSalutation?[indexSalutation!].id,
      leadCode: '',
      leadName: nameController.text,
      leadEmail: emailController.text,
      leadPhone: phoneController.text,
      leadStageId: indexLeadStage == null
          ? null
          : crmMasterData?.listLeadStage?[indexLeadStage!].id,
      leadStageReasonId: selcetedLeadStageReason.value?.id,
      company: companyController.text,
      leadIndustryId: indexIndustry == null
          ? null
          : crmMasterData?.listIndustry?[indexIndustry!].id,
      leadTitle: positionController.text,
      leadAddressTypeId: selectedAccountAddressType.value?.id,
      leadSourceId: indexSource == null
          ? null
          : crmMasterData?.leadSources?[indexSource!].id,
      sourceDescription: sourceDescriptionController.text,
      leadStreet: addressController.text,
      leadWardId: currentWard.value?.id,
      leadWardName: currentWard.value?.wardName,
      leadDistrictId: currentDistrict.value?.id,
      leadDistrictName: currentDistrict.value?.districtName,
      leadProvinceId: currentProvince.value?.id,
      leadProvinceName: currentProvince.value?.provinceName,
      leadCountryId: selectedCountry.value?.id,
      leadPostalCode: postalCodeController.text,
      description: descriptionController.text,
      fullAddress: getFullAddress(),
      leadPotentialLevelId: indexPotenitalLevel == null
          ? null
          : crmMasterData?.listLeadPotentialLevel?[indexPotenitalLevel!].id,
      leadUuid: const Uuid().v4(),
      startDate: startDate,
      leadProducts: products
          .map((element) =>
              Product(id: element.id, productId: element.productId, status: 1))
          .toList(),
    );
    await crmUIRepository.createLead(request).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'Tạo khách hàng tiềm năng thành công!',
          onPressed: () => Get.back(result: true),
        );
      } else {
        await EasyLoading.dismiss();
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

  Future<bool> _callCheckLeadPhoneExist() async {
    await EasyLoading.show();

    return crmUIRepository
        .checkLeadPhoneExist(phoneController.text)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success && response.data?.isUsed == 1) {
        return true;
      } else {
        return false;
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      printError(info: 'Create lead check phone error ${onError.toString()}');
      return false;
    });
  }

  // Lấy DS lý do từ chối ứng với mỗi trạng thái KHTN, bỏ qua nếu đã lấy
  Future _callGetLeadStageReason(int id) async {
    isRequiredLeadStageReason.value = id == LeadStage.leadDoneNotConvert;
    selcetedLeadStageReason.value = null;
    leadStageReasonController.text = '';

    if (AppDataGlobal.leadStageReasons[id] != null) {
      return;
    }

    await EasyLoading.show();
    await crmUIRepository.leadStageReason(id).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        AppDataGlobal.leadStageReasons[id] = response.data ?? [];
      } else {
        await EasyLoading.showToast(response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      printError(info: 'Get lead reason close not convert $onError');
      EasyLoading.showToast('notify.error'.tr);
    });
  }

  Future _callGetAddressFromString(String address) async {
    await EasyLoading.show();
    await crmUIRepository
        .getAddressDetailFromString(address)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success && response.data != null) {
        addressController.text = response.data?.address ?? '';
        selectedAccountAddressType.value = AccountAddressType.home;
        accountAddressTypeController.text =
            AccountAddressType.home.accountAddressTypeName ?? '';
        selectedCountry.value = Country.vietnam;
        countryController.text = Country.vietnam.countryName ?? '';
        currentProvince.value = response.data?.getProvince();
        currentDistrict.value = response.data?.getDistrict();
        currentWard.value = response.data?.getWard();
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      printError(info: '_callGetAddressFromString $onError');
    });
  }
}
