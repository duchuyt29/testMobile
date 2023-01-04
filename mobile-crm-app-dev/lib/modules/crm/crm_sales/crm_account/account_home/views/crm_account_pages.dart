import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_crm_drawer.dart';
import '../../../../../../shared/widgets/crm/widget_search_bar.dart';
import '../controllers/crm_account_controllers.dart';

class CrmAccountPage extends GetView<CrmAccountController> {
  CrmAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'crm.account'.tr,
          style: AppTextStyle.heavy(fontSize: 24),
        ),
        leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
              size: 18,
            )),
        actions: [
          IconButton(
              onPressed: controller.onViewCreateNewAccount,
              icon: const Icon(
                Icons.add_circle_rounded,
                size: 24,
                color: Colors.blue,
              ))
        ],
      ),
      drawer: CrmDrawer(),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: _buildBodyContent(),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CrmWidgetSearchBar(
            label: 'crm.account.search'.tr, onTap: controller.onSearchAccount),
        const Divider(
          height: 25,
          color: Colors.blue,
          thickness: 4,
        ),
        Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'crm.list'.tr,
              style: AppTextStyle.heavy(fontSize: 16, color: Colors.black54),
            )),
        Container(
          child: ListTile(
              leading: Icon(
                Icons.list,
                color: Colors.blue.shade900,
                size: 34,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              minLeadingWidth: 0,
              title: Text('crm.account.all'.tr,
                  style: AppTextStyle.regular(fontSize: 18)),
              onTap: controller.onViewAllAccount),
        ),
        Container(
          height: 10,
          color: Colors.grey.shade200,
        ),
        // BoxDecoration()
        const SizedBox(
          height: 5,
        ),
        Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'crm.recently.viewed'.tr,
              style: AppTextStyle.heavy(fontSize: 16, color: Colors.black54),
            )),
      ],
    );
  }
}
