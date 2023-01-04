import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';

class ChangeStatusModalBottomSheets extends StatelessWidget {
  const ChangeStatusModalBottomSheets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      const SizedBox(height: 20),
      Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text('workplace.workgroup.state.change'.tr,
                    style: AppTextStyle.bold(fontSize: 20)),
              ),
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
          _buildListTile(title: 'Đang thực hiện'.tr, onTap: () {}),
          const Divider(height: 2),
          _buildListTile(title: 'Hủy bỏ'.tr, onTap: () {}),
          const Divider(height: 2),
          _buildListTile(title: 'Hoàn thành'.tr, onTap: () {}),
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
              child: Text('Hủy'.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.heavy(color: Colors.red)),
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
        style: AppTextStyle.heavy(color: const Color(0xff493083)),
      ),
      onTap: onTap,
    );
  }
}
