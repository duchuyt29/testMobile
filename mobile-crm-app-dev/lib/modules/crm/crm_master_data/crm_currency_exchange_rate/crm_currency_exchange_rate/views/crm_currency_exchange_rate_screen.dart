import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/flutter_back_widget.dart';
import '../../../../../../shared/widgets/widget_notification.dart';
import '../controllers/currency_exchange_rate_controller.dart';

class CrmCurrencyExchangeRatePage
    extends GetView<CrmCurrencyExchangeRateController> {
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
        Obx(() => controller.isNotification.value
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: WidgetNotification(
                  content: controller.notificationMessage.value,
                  marginBottom: 0.0,
                  backgroundColor: controller.isBlueNotification.value
                      ? AppColor.pollBackgroundColor
                      : null,
                  iconColor: controller.isBlueNotification.value
                      ? AppColor.stateInfoColor
                      : null,
                  textColor: controller.isBlueNotification.value
                      ? AppColor.stateInfoColor
                      : null,
                ),
              )
            : Container()),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackPageWidget(
              backText: 'crm.come.back'.tr,
            ),
            Container(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.blue.shade700,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.blue.shade700,
                      ))
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'crm.exchange.title'.tr,
                style: AppTextStyle.heavy(fontSize: 20),
              ),
            ),
            TextButton(onPressed: () {}, child: Text('crm.create.new'.tr))
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
              labelText: 'crm.exchange.search'.tr,
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
              title: Text('crm.exchange.all'.tr),
              onTap: controller.onViewAllCurrenExRate),
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
