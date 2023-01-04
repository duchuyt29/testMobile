import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/flutter_back_widget.dart';
import '../../../../../shared/widgets/widget_notification.dart';
import '../controllers/crm_activity_controllers.dart';

class CrmActivityPage extends GetView<CrmActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'crm.activity'.tr,
                style: AppTextStyle.heavy(fontSize: 20),
              ),
            ),
            TextButton(
                onPressed: () {
                  controller.showCreateModalBottomSheet();
                },
                child: Text('crm.create.new'.tr))
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
                size: 26,
              ),
              // helperText: "Search your topic",
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: 'crm.activity.search'.tr,
              labelStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              isDense: true,
            ),
          ),
        ),
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
              leading: const Icon(Icons.list),
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              title: Text('crm.activity.all'.tr),
              onTap: controller.onViewAllActi),
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
