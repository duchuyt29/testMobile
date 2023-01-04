import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/product/product.dart';

import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../controllers/crm_create_lead_product_controllers.dart';

class CrmCreateLeadProductScreen
    extends GetView<CrmCreateLeadProductController> {
  const CrmCreateLeadProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.lead.product.care'.tr,
          style: AppTextStyle.regular(fontSize: 20, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: controller.onSubbmit,
            child: Text('Chọn', style: AppTextStyle.heavy(color: Colors.white)),
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
        Expanded(
          child: Obx(
            () => ListView.separated(
              itemCount: controller.filterProducts.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, i) =>
                  _buildDistrictCell(controller.filterProducts[i]),
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

  Widget _buildDistrictCell(Product product) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      horizontalTitleGap: 5,
      leading:
          controller.selectedProducts.any((element) => element.id == product.id)
              ? Icon(
                  Icons.check_box,
                  color: AppColor.primaryColor,
                )
              : Icon(
                  Icons.check_box_outline_blank,
                  color: AppColor.primaryColor,
                ),
      title: Text(product.getTitle()),
      onTap: () => controller.onSelectProduct(product),
    );
  }
}
