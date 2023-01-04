import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import 'change_status_acitivity_modal_sheet.dart';

class ActivityModalBottomSheets extends StatelessWidget {
  ActivityModalBottomSheets({
    Key? key,
    this.onTap,
  }) : super(key: key);

  Function? onTap;

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
      Container(
        height: Get.height * 0.8,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text('crm.activity.action'.tr,
                  style: AppTextStyle.bold(fontSize: 20)),
            ),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            _buildListTile(
              title: 'crm.activity.change.status'.tr,
              onTap: Get.back,
              icon: FCoreImage(ImageConstants.crmChangeStatus),
            ),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            _buildListTile(
              title: 'crm.update'.tr,
              onTap: () {},
              icon: FCoreImage(ImageConstants.crmCrmUpdate),
            ),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            _buildListTile(
              title: 'crm_discard'.tr,
              onTap: () {},
              icon: FCoreImage(ImageConstants.crmDeleteBin),
            ),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    ]);
  }

  ListTile _buildListTile({
    required String title,
    required Function() onTap,
    required Widget icon,
  }) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            child: icon,
          ),
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
