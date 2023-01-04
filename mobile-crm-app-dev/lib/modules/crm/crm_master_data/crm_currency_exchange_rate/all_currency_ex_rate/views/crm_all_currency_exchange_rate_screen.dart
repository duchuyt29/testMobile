import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/currency_exchange_rate.dart';

import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../controllers/crm_all_curren_exchange_controller.dart';

class CrmAllCurrencyExchangeRatePage
    extends GetView<CrmAllCurrencyExchangeRateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.select.currency'.tr,
          style: AppTextStyle.regular(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SafeArea(
        top: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        _buildSearchBar(),
        Expanded(
          child: Obx(
            () => ListView.separated(
              itemCount: controller.currencyExchangeRateList.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, i) => _buildCurrencyExchangeRateItem(
                  controller.currencyExchangeRateList[i]),
            ),
          ),
        )
      ],
    );
  }

  Container _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onChanged: controller.onSearch,
        decoration: InputDecoration(
          hintText: 'search'.tr,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26,
          ),
        ),
      ),
    );
  }

  Widget _buildCurrencyExchangeRateItem(
      CurrencyExchangeRate currencyExchangeRate) {
    return ListTile(
      onTap: () =>
          controller.onSelectedCurrencyExchangeRate(currencyExchangeRate),
      title: Text(
        currencyExchangeRate.currencyName ?? '',
        style: AppTextStyle.regular(fontSize: 16),
      ),
      subtitle: Text(
        currencyExchangeRate.currencyCode ?? '',
        style: AppTextStyle.regular(
          fontSize: 14,
        ),
      ),
      leading: controller.selectedCurrencyExchangeRate.value.currencyCode ==
              currencyExchangeRate.currencyCode
          ? Icon(
              Icons.radio_button_checked,
              color: AppColor.primaryColor,
            )
          : Icon(
              Icons.radio_button_unchecked,
              color: AppColor.primaryColor,
            ),
    );
  }
}
