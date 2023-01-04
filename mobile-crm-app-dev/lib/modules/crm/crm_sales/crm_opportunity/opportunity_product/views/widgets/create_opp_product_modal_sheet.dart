import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../controllers/opportunity_product_controller.dart';

class CreateOppProductModalBottomSheet extends StatelessWidget {
  CreateOppProductModalBottomSheet({
    Key? key,
  }) : super(key: key);

  final OpportunityProductController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          width: 50,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      const SizedBox(height: 20),
      Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text('crm.select.price.book'.tr,
                style: AppTextStyle.regular(fontSize: 16)),
          ),
          const SizedBox(height: 10),
          _buildListTile(title: 'crm.product.pricelist'.tr, onTap: () {}),
          InkWell(
            onTap: Get.back,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              margin:
                  const EdgeInsets.only(left: 2, right: 2, top: 5, bottom: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text('crm_discard'.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.heavy(color: Colors.blue.shade700)),
            ),
          ),
        ],
      ),
    ]);
  }

  ListTile _buildListTile({
    required String title,
    required Function() onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyle.heavy(color: Colors.blue.shade700),
      ),
      onTap: onTap,
    );
  }
}
