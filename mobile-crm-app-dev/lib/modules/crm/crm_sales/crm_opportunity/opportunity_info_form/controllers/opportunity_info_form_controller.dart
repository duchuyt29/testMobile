import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/currency_exchange_rate.dart';
import 'package:ui_api/crm_api/models/opportunity/opp_account.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity_info.dart';
import 'package:ui_api/crm_api/request/opportunity/opportunity_info_request.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/app_data_global.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/arguments.dart';
import '../../../../../../shared/utils/dialog_util.dart';

class OpportunityInfoFormController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();
  final opportunityInfo = Rxn<OpportunityInfo>();
  final opportunityInfoRequest = OpportunityInfoRequest();
  final accountList = RxList<OppAccount>([]);
  final selectedAccount = RxList<OppAccount>([]);
  @override
  final crmMasterData = AppDataGlobal.crmMasterData;

  OpportunityInfoFormController() {
    if (Get.arguments != null) {
      opportunityInfo.value = Get.arguments;
      opportunityInfoRequest.accountId = opportunityInfo.value?.accountId;
      opportunityInfoRequest.currencyExchangeRateId =
          opportunityInfo.value?.currencyExchangeRateId;
    }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
    await loadAccount();
    selectedAccount.assignAll(accountList
        .where((element) => element.id == opportunityInfo.value?.accountId)
        .toList());
  }

  void onCurrencyChange(int? value) {
    fbKey.currentState?.fields['amount']
        ?.didChange(opportunityInfo.value!.getAmountByCurrencyId(value!));
  }

  Future<void> onCurrency() async {
    await Get.toNamed(CRMRoutes.ALL_CURRENCY_EXCHANGE_RATE,
            arguments: opportunityInfo.value?.currencyExchangeRateId)
        ?.then((value) {
      if (value != null && value is CurrencyExchangeRate) {
        onCurrencyChange(value.id);
        opportunityInfo.value!.currencyExchangeRateId = value.id;
        opportunityInfoRequest.currencyExchangeRateId = value.id;
        fbKey.currentState!.fields['currencyExchangeRateId']!
            .didChange(value.currencyName);
      }
    });
  }

  // Load account
  Future<void> loadAccount() async {
    try {
      await EasyLoading.show();
      final data = await crmUIRepository.getAllAccount();
      accountList.assignAll(data.data ?? []);
      await EasyLoading.dismiss();
    } catch (e) {
      await EasyLoading.dismiss();
      await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    }
  }

  Future onAccount() async {
    await Get.toNamed(CRMRoutes.CRM_SELECT_ACCOUNT, arguments: {
      IS_MULTI_SELECT: false,
      LIST_SELECTED: selectedAccount,
    })?.then((value) {
      if (value != null && value is OppAccount) {
        selectedAccount.clear();
        selectedAccount.add(value);
        fbKey.currentState!.fields['accountId']!.didChange(value.accountName);
        opportunityInfoRequest.accountId = value.id;
      }
    });
  }

  Future<void> onSubmitted() async {
    try {
      if (fbKey.currentState!.saveAndValidate()) {
        final data = fbKey.currentState!.value;
        opportunityInfoRequest.id = opportunityInfo.value?.id;
        opportunityInfoRequest.opportunityName =
            data['opportunityName'] ?? opportunityInfo.value?.opportunityName;
        opportunityInfoRequest.probability =
            data['probability'].toString().isEmpty
                ? 0
                : double.parse(data['probability'].toString()) / 100;
        opportunityInfoRequest.typeId =
            data['typeId'] ?? opportunityInfo.value?.opportunityTypeId;
        opportunityInfoRequest.leadSourceId =
            data['leadSourceId'] ?? opportunityInfo.value?.leadSourceId;

        await updateOpportunity();
      }
    } catch (e) {
      await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: e.toString());
    }
  }

  // API
  Future<void> updateOpportunity() async {
    try {
      await EasyLoading.show();
      await crmUIRepository.updateOpportunityInfo(opportunityInfoRequest);
      Get.back(
        result: true,
      );
      await EasyLoading.dismiss();
    } catch (e) {
      await EasyLoading.dismiss();
      await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: e.toString());
    }
  }
}
