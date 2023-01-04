import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/opportunity/opp_account.dart';

import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../controllers/crm_select_account_controller.dart';

class CrmSelectAccountScreen extends GetView<CrmSelectAccountController> {
  const CrmSelectAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.customer'.tr,
          style: AppTextStyle.regular(fontSize: 20, color: Colors.white),
        ),
        actions: [
          controller.isMultiSelect.value
              ? TextButton(
                  onPressed: controller.onSubbmit,
                  child: Text('crm.select'.tr,
                      style: AppTextStyle.heavy(color: Colors.white)),
                )
              : const SizedBox.shrink(),
        ],
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
              itemCount: controller.filterAccounts.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, i) =>
                  _buildAccountCell(controller.filterAccounts[i]),
            ),
          ),
        ),
      ],
    );
  }

  Container _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onChanged: controller.onSearchProduct,
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

  Widget _buildAccountCell(OppAccount account) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      horizontalTitleGap: 5,
      leading: controller.isMultiSelect.value
          ? controller.selectedAccounts
                  .any((element) => element.id == account.id)
              ? Icon(
                  Icons.check_box,
                  color: AppColor.primaryColor,
                )
              : Icon(
                  Icons.check_box_outline_blank,
                  color: AppColor.primaryColor,
                )
          : controller.selectedAccounts
                  .any((element) => element.id == account.id)
              ? Icon(
                  Icons.radio_button_checked,
                  color: AppColor.primaryColor,
                )
              : Icon(
                  Icons.radio_button_off_outlined,
                  color: AppColor.primaryColor,
                ),
      title: Text(account.accountName ?? ''),
      onTap: () => {
        if (controller.isMultiSelect.value)
          {
            controller.onSelectProduct(account),
          }
        else
          {
            controller.onSelectAccount(account),
          }
      },
    );
  }
}
