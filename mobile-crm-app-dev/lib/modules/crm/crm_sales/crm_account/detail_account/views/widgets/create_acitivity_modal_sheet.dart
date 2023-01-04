import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';

class ActivityModalBottomSheets extends StatelessWidget {
  const ActivityModalBottomSheets({
    Key? key,
  }) : super(key: key);

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
              child:
                  Text('Hành động'.tr, style: AppTextStyle.bold(fontSize: 20)),
            ),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            _buildListTile(
                title: 'Thêm hoạt động',
                onTap: () {},
                icon: const Icon(
                  Icons.phone_in_talk,
                  color: Colors.white,
                ),
                bgColor: const Color(0xffF3983E)),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            _buildListTile(
                title: 'Xóa',
                onTap: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                bgColor: Colors.red),
            Container(
              height: 3,
              color: Colors.grey.shade300,
            ),
            _buildListTile(
                title: 'Đóng',
                onTap: () {},
                icon: const Icon(
                  Icons.lock_clock_outlined,
                  color: Colors.green,
                ),
                bgColor: Colors.white),
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
    required Color bgColor,
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
              color: bgColor,
              borderRadius: BorderRadius.all(Radius.circular(25)),
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
