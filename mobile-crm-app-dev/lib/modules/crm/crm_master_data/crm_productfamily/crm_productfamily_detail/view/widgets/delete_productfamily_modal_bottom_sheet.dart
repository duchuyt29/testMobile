import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';

class CreateDeleteProductFamilyModalBottomSheet extends StatelessWidget {
  const CreateDeleteProductFamilyModalBottomSheet({Key? key}) : super(key: key);

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
          Column(
            children: [
              Container(
                child: Text('crm.price.delete'.tr,
                    style: AppTextStyle.bold(fontSize: 20)),
              ),
              Container(
                child: Text('crm.product.family.delete.anouncement',
                    style: AppTextStyle.regular(fontSize: 16)),
              ),
              Container(
                child: Text('crm.product.family.delete.anouncement2',
                    style: AppTextStyle.regular(fontSize: 16)),
              )
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
          _buildListTile(title: 'crm.activity.delete'.tr, onTap: () {}),
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
