import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';

class AddDocumentModalBottomSheet extends StatelessWidget {
  const AddDocumentModalBottomSheet({
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
      Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child:
                    Text('Tùy chọn'.tr, style: AppTextStyle.bold(fontSize: 20)),
              ),
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
          _buildListTile(
              title: 'Ký số', icon: const Icon(Icons.abc), onTap: () {}),
          _buildListTile(
              title: 'Tải tài liệu',
              icon: const Icon(Icons.download_rounded),
              onTap: () {}),
          _buildListTile(
              title: 'Mở tài liệu',
              icon: const Icon(Icons.create_new_folder_outlined),
              onTap: () {}),
          _buildListTile(
              title: 'Xóa tài liệu',
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onTap: () {}),
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
    required Widget icon,
    required Function() onTap,
  }) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: AppTextStyle.regular(),
      ),
      onTap: onTap,
    );
  }
}
