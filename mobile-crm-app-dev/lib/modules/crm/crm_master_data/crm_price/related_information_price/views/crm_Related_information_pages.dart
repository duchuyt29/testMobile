import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/flutter_back_widget.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../../shared/widgets/widget_notification.dart';
import '../controllers/crm_Related_information.controller.dart';

class CrmRelatedInformationPage
    extends GetView<CrmRelatedInformationController> {
  bool isChecked = false;
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
      children: [
        _buildHeaderContent(),
        const Divider(
          height: 0,
          color: Color.fromARGB(255, 86, 174, 247),
          thickness: 4,
        ),
        Container(
          // height: 100,
          color: const Color.fromARGB(255, 245, 244, 244),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: controller.onViewFromCreateProductInPrice,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  Text('crm.products.create'.tr),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'crm.infor.related'.tr,
          style: AppTextStyle.bold(fontSize: 20),
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          color: Color.fromARGB(255, 209, 209, 209),
          thickness: 1,
        ),
        _buildRowItemDetail(
          title: 'License',
          productCode: 'crm.product.product.code'.tr,
          proCode: 'P0000001',
          currencyCode: 'crm.price.currency.code'.tr,
          curCode: 'USD',
          price: 'Giá',
          priceNum: '2000',
          usePriceStand: 'Sử dụng giá \ntiêu chuẩn'.tr,
          widget: Checkbox(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.all(Colors.orange.shade200),
              value: isChecked == false,
              onChanged: null),
        ),
        const Divider(
          color: Color.fromARGB(255, 209, 209, 209),
          thickness: 1,
        ),
        _buildRowItemDetail(
          title: 'ConSultant',
          productCode: 'crm.product.product.code'.tr,
          proCode: 'P0000001',
          currencyCode: 'crm.price.currency.code'.tr,
          curCode: 'USD',
          price: 'Giá',
          priceNum: '2000',
          usePriceStand: 'Sử dụng giá \ntiêu chuẩn'.tr,
          widget: Checkbox(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.all(Colors.black12),
              value: isChecked == true,
              onChanged: null),
        ),
        const Divider(
          color: Color.fromARGB(255, 209, 209, 209),
          thickness: 1,
        ),
      ],
    );
  }

  Column _buildHeaderContent() {
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
              backText: 'crm.list.price.standard'.tr,
            ),
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.backup_rounded,
                      size: 30,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star,
                      size: 30,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ],
              ),
            ),
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
              labelText: 'crm.products.search'.tr,
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
        Container(
          height: 15,
        ),
      ],
    );
  }

  Container _buildRowItemDetail({
    required String title,
    required String productCode,
    required String proCode,
    required String currencyCode,
    required String curCode,
    required String price,
    required String priceNum,
    required String usePriceStand,
    required Widget widget,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 10, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: AppTextStyle.bold(fontSize: 18),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            child: Row(
              children: [
                Expanded(flex: 1, child: Text('$productCode:')),
                Expanded(flex: 2, child: Text(proCode))
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(flex: 1, child: Text('$currencyCode:')),
                Expanded(flex: 2, child: Text(curCode))
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(flex: 1, child: Text('$price:')),
                Expanded(flex: 2, child: Text(priceNum))
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(flex: 1, child: Text('$usePriceStand:')),
                Flexible(flex: 2, child: widget)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
