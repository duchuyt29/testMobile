import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import 'package:ui_api/crm_api/models/account/account_address.dart';
import 'package:ui_api/crm_api/models/account/account_document.dart';
import 'package:ui_api/crm_api/models/activity/activity_account.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/document_type.dart';
import 'package:ui_api/crm_api/models/common/district.dart';
import 'package:ui_api/crm_api/models/common/province.dart';
import 'package:ui_api/crm_api/models/common/ward.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/app_data_global.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/arguments.dart';
import '../../../../../../shared/utils/app_util.dart';
import '../../../../../../shared/utils/date_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';

class AccountFormCreateController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();
  Rx<AccountInfo> accountInfo = Rx<AccountInfo>(AccountInfo());
  final accountAddress = Rxn<AccountAddress>(AccountAddress());
  final accountDocument = Rxn<AccountDocument>(AccountDocument());
  List<AccountAddress> listAddress = [];
  List<AccountDocument> listDocument = [];

  RxList<DocumentType> listDocumentType = RxList.empty(growable: true);
  final userInfo = AppDataGlobal.userInfo;
  int? indexAddressType;
  int? indexCountry;
  int? indexIndustry;
  int? indexGender;
  RxString parentName = ''.obs;
  int? parentId;

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController phone1 = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController note = TextEditingController();
  final TextEditingController zipCode = TextEditingController();
  final TextEditingController address = TextEditingController();

  DateTime issueDate = DateTime.now();

  final TextEditingController documentNumberController =
      TextEditingController();
  final TextEditingController issueDateController = TextEditingController();
  final TextEditingController issuePlaceController = TextEditingController();
  final TextEditingController noteDocumentController = TextEditingController();

  AccountFormCreateController() {
    accountInfo.value.accountTypeId = Get.arguments;
    accountInfo.value.accountTypeName =
        crmMasterData?.getAccountTypeName(accountInfo.value.accountTypeId ?? 0);
    _loadDocumentType(accountInfo.value.accountTypeId ?? 0);
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  Future<void> loadParentAccount() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_ACCOUNT_LIST_ALL)?.then((value) {
        if (value != null && value is ActivityAccount) {
          parentName.value = value.accountName ?? '';
          parentId = value.id;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectGender(int index) async {
    try {
      accountInfo.value.genderId = crmMasterData?.listGender?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectIndustry(int index) async {
    try {
      accountInfo.value.industryId = crmMasterData?.listIndustry?[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectAddressType(int index) async {
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

  Future<void> selectDocumentType(int index) async {
    try {
      accountDocument.value?.documentTypeId = listDocumentType[index].id;
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectDate(
      TextEditingController field, DateTime dateTime) async {
    await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      // styles
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
      // select hour
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    ).then((date) {
      dateTime = DateTime(date!.year, date.month, date.day);

      field.text = DateUtil.formatDatetimeToString(dateTime.toUtc(),
          type: DateUtil.DATE_TYPE);
    });
  }

  Future<void> onSubmitted() async {
    if (fbKey.currentState!.saveAndValidate()) {
      if (!AppUtil.isPhoneNumber(phone.text)) {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'account.change_profile.error.phone.invalid'.tr,
        );
        return;
      }

      if (email.text.isNotEmpty && !GetUtils.isEmail(email.text)) {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: 'account.change_profile.error.email.invalid'.tr,
        );
        return;
      }
      final id = const Uuid().v4();
      accountInfo.value.accountUUID = id;

      accountInfo.value.accountName = name.text;
      accountInfo.value.accountPhone = phone.text;
      accountInfo.value.accountPhoneSecond = phone1.text;
      accountInfo.value.accountEmail = email.text;
      accountInfo.value.accountDescription = note.text;
      accountInfo.value.ownerEmployeeId =
          AppDataGlobal.userInfo?.employeeInfo?.id;
      accountInfo.value.parentAccountId = parentId;

      //account address
      accountAddress.value?.isMain = 1;
      accountAddress.value?.accountAddressPostalCode = zipCode.text;
      accountAddress.value?.accountAddressStreet = address.text;
      listAddress.add(accountAddress.value!);
      accountInfo.value.accountAddresses = listAddress;

      //account document
      accountDocument.value?.documentNumber = documentNumberController.text;
      accountDocument.value?.issueDate = issueDate;
      accountDocument.value?.issuePlace = issuePlaceController.text;
      accountDocument.value?.note = noteDocumentController.text;
      accountDocument.value?.accountId = accountInfo.value.id;
      listDocument.add(accountDocument.value!);
      accountInfo.value.accountDocuments = listDocument;

      await saveChange();
    }
  }

  /// Call API */
  Future<void> _loadDocumentType(int id) async {
    try {
      await crmUIRepository.getDocumentType(id).then((response) async {
        await EasyLoading.dismiss();
        if (response.success && response.data != null) {
          listDocumentType.value = response.data!;
          listDocumentType.refresh();
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> saveChange() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .insertAccount(accountInfo.value)
          .then((response) async {
        await EasyLoading.dismiss();
        if (response.success) {
          await crmUIRepository
              .getAccountDetail(response.data?.id ?? 0)
              .then((response) async {
            await EasyLoading.dismiss();
            if (response.success && response.data != null) {
              await DialogUtil.createDialogMessage(
                  title: 'notify.title'.tr,
                  message: 'notify.success'.tr,
                  onPressed: () {
                    Get.back(result: response.data);
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
