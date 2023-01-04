import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';

import '../../../../../../shared/styles/text_style/text_style.dart';
import '../controllers/crm_account_search_controller.dart';

part 'crm_account_extension.dart';

class CrmAccountSearchPage extends GetView<CrmAccountSearchController> {
  const CrmAccountSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
        toolbarHeight: 10,
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
        _buildSearchInput(),
        Obx(() =>
            controller.accounts.isNotEmpty || (controller.isSearch == true)
                ? _buildSearchListAccount()
                : _buildRecentAccount())
      ],
    );
  }

  Widget _buildRecentAccount() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              'crm.account.recent'.tr,
              style: AppTextStyle.heavy(),
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: controller.recentAccounts.length,
              itemBuilder: (context, index) {
                return _buildAccountItem(
                    controller.recentAccounts[index], index);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 0,
                  color: Colors.grey.shade200,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearchListAccount() {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: controller.accounts.length,
        itemBuilder: (context, index) {
          return _buildAccountItem(controller.accounts[index], index);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 0,
            color: Colors.grey.shade200,
          );
        },
      ),
    );
  }

  Widget _buildAccountItem(Account account, int index) {
    return ListTile(
      title: Text(account.accountName ?? ''),
      subtitle: Text('Title: ${account.accountCode ?? ''}'),
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
    );
  }
}
