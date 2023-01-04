import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';

class ChangeStatusActivityModalBottomSheets extends StatelessWidget {
  const ChangeStatusActivityModalBottomSheets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      const SizedBox(height: 20),
      Container(
        // height: Get.height * 0.3,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 15, top: 15),
              child: Text('crm.activity.change.status'.tr,
                  style: AppTextStyle.bold(fontSize: 20)),
            ),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            _buildListTile(
              title: 'Đang thực hiện'.tr,
              onTap: () {},
            ),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            _buildListTile(
              title: 'Hủy bỏ'.tr,
              onTap: () {},
            ),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            _buildListTile(
              title: 'Đang xem xét'.tr,
              onTap: () {},
            ),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            InkWell(
              onTap: Get.back,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                margin: const EdgeInsets.only(left: 2, right: 2, bottom: 2),
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
      ),
    ]);
  }

  ListTile _buildListTile({
    required String title,
    required Function() onTap,
  }) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.heavy(color: Colors.blue.shade700),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
