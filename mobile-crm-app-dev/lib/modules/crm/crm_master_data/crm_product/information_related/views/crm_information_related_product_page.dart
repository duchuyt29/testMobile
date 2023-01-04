import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/flutter_back_widget.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../../shared/widgets/widget_notification.dart';
import '../controllers/crm_information_related_product_controller.dart';

class CrmInformationRelatedProductPage
    extends GetView<CrmInformationRelatedProductController> {
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
          height: 5,
          color: Color.fromARGB(255, 86, 174, 247),
          thickness: 4,
        ),
        Container(
          // height: 100,
          // color: const Color.fromARGB(255, 245, 244, 244),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: controller.onViewAddPrice,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: FCoreImage(
                        ImageConstants.crmCrmCole,
                        width: 15,
                        height: 15,
                      ),
                    ),
                  ),
                  const Text('Thêm vào bảng giá'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: controller.onViewAddPriceStandard,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: FCoreImage(
                        ImageConstants.crmCrmCole,
                        width: 15,
                        height: 15,
                      ),
                    ),
                  ),
                  const Text('Thêm giá tiêu chuẩn'),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 245, 244, 244),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: ListTile(
            leading: FCoreImage(
              ImageConstants.crmPriceList,
              width: 45,
              height: 45,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'crm.product.pricelist'.tr,
                  style: AppTextStyle.heavy(fontSize: 15),
                ),
                Text(
                  '',
                  style: AppTextStyle.bold(fontSize: 20),
                ),
              ],
            ),
            onTap: () {},
          ),
        ),
        _buildDetailItem(
          title: 'crm.product.title'.tr,
          price: 'Giá',
          priceGtri: '10000',
          maTienTe: 'Mã tiền tệ',
          tienTe: 'VNĐ',
          suDungGiaTieuChuan: 'Sử dụng giá ....',
          widget: Checkbox(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              checkColor: Colors.blue,
              value: isChecked == true,
              onChanged: null),
        ),
        _buildDetailItem(
          title: 'crm.product.title'.tr,
          price: 'Giá',
          priceGtri: '10000',
          maTienTe: 'Mã tiền tệ',
          tienTe: 'VNĐ',
          suDungGiaTieuChuan: 'Sử dụng giá ....',
          widget: Checkbox(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              checkColor: Colors.blue,
              value: isChecked == true,
              onChanged: null),
        )
      ],
    );
  }

  Container _buildDetailItem({
    required String title,
    required String price,
    required String priceGtri,
    required String maTienTe,
    required String tienTe,
    required String suDungGiaTieuChuan,
    required Widget widget,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyle.heavy(fontSize: 16),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 3, bottom: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text(price)),
              Expanded(flex: 2, child: Text(priceGtri)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 3, bottom: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text(maTienTe)),
              Expanded(flex: 2, child: Text(tienTe)),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text(suDungGiaTieuChuan)),
              Flexible(flex: 2, child: widget),
            ],
          ),
        ),
      ]),
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
              backText: ''.tr,
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
      ],
    );
  }
}
