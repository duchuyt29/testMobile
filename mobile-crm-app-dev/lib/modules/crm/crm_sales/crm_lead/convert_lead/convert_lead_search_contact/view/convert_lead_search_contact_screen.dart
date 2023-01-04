import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/activity/activity_account.dart';
import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/widgets/button/widget_icon_button.dart';
import '../controller/convert_lead_search_contact_controller.dart';

class ConvertLeadSearchContactScreen
    extends GetView<ConvertLeadSearchContactController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          WidgetIconButton(
            onPressed: controller.createContact,
            icon: Icons.add,
            backgroundColor: AppColor.addIconButtonColor,
            size: 30,
          ),
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
        Divider(
          height: 2,
          thickness: 2,
          color: Colors.blue.shade400,
        ),
        Expanded(
          child: Obx(
            () => ListView.separated(
              itemCount: controller.filterAccounts.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) =>
                  _buildAccountCell(controller.filterAccounts[index]),
            ),
          ),
        ),
      ],
    );
  }

  Container _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onChanged: controller.onSearch,
        decoration: InputDecoration(
          hintText: 'crm.contact.search'.tr,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26,
          ),
        ),
      ),
    );
  }

  Widget _buildAccountCell(ActivityAccount account) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      horizontalTitleGap: 5,
      title: Text(account.accountName ?? ''),
      onTap: () => controller.onSelectionAccount(account),
    );
  }
}
