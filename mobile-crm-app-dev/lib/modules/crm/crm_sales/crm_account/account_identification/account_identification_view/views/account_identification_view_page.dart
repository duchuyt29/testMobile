import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account_address.dart';
import 'package:ui_api/crm_api/models/account/account_document.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../../shared/widgets/crm/widget_slidable.dart';
import '../controllers/account_identification_view_controllers.dart';

class AccountIdentificationViewPage
    extends GetView<AccountIdentificationViewController> {
  AccountIdentificationViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('crm.account.edit.identification'.tr,
            style: AppTextStyle.heavy(fontSize: 20, color: Colors.white)),
        actions: [
          CrmWidgetButton(
            bgColor: const Color.fromARGB(255, 85, 176, 249),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 18,
            ),
            onTap: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        top: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
      child: Text('www'),
    );
  }

  Container _buildItemsDocuments({required AccountDocument item}) {
    return Container(
      child: Column(
        children: [
          _buildItemField(
            label: 'crm.account.kind.of.papers'.tr,
            value: item.documentTypeName ?? '',
          ),
          _buildItemField(
            label: 'crm.account.number.of.papers'.tr,
            value: item.documentNumber ?? '',
          ),
          _buildItemField(
            label: 'crm.account.date.range'.tr,
            value: item.getIssueDate(),
          ),
          _buildItemField(
            label: 'crm.account.place'.tr,
            value: item.issuePlace ?? '',
          ),
          _buildItemField(
            label: 'crm.account.note'.tr,
            value: item.note ?? '',
          ),
        ],
      ),
    );
  }

  Container _buildItemField({
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: Text(label)),
          Expanded(flex: 3, child: Text(value))
        ],
      ),
    );
  }
}
