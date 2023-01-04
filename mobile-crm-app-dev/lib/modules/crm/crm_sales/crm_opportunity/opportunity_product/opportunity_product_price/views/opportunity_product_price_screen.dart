import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../controllers/opportunity_product_price_controller.dart';

class OpportunityProductPriceScreen
    extends GetView<OpportunityProductPriceController> {
  const OpportunityProductPriceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.product.select'.tr,
          style: AppTextStyle.heavy(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(top: false, child: _buildBodyContent()),
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

  Widget _buildBodyContent() {
    return Column(
      children: [
        _buildSearchBar(),
        Expanded(
            child: Obx(
          () => ListView.builder(
            itemCount: controller.filterProduct.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  Get.back(result: controller.filterProduct[i]);
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                  child: Text(
                    '${controller.filterProduct[i].productName ?? ''} - ${controller.filterProduct[i].productCode ?? ''}',
                    style: AppTextStyle.regular(),
                  ),
                ),
              );
            },
          ),
        )),
      ],
    );
  }
}
