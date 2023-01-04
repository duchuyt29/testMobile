import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';

class DeleteAccountModalBottomSheetAllAccount extends StatelessWidget {
  const DeleteAccountModalBottomSheetAllAccount({
    Key? key,
    this.onPress,
  }) : super(key: key);

  final Function()? onPress;
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
                padding: const EdgeInsets.only(bottom: 15),
                child: Text('crm.account.delete.account'.tr,
                    style: AppTextStyle.bold(fontSize: 20)),
              ),
              Container(
                child: Text('Bạn có chắc chắn muốn xóa khách hàng?',
                    style: AppTextStyle.heavy(fontSize: 16)),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text('Khách hàng sẽ bị xóa vĩnh viễn',
                    style: AppTextStyle.heavy(fontSize: 16)),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
          Container(
            height: 3,
            color: Colors.grey.shade300,
          ),
          _buildListTile(title: 'Xóa'.tr, onTap: onPress),
          InkWell(
            onTap: Get.back,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
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
    required Function()? onTap,
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

  // @override
  // Widget build(BuildContext context) {
  //   return CupertinoPageScaffold(
  //     child: CupertinoButton(
  //       onPressed: () {
  //         showCupertinoModalPopup<void>(
  //           context: context,
  //           builder: (BuildContext context) => CupertinoActionSheet(
  //               title: const Text('My Title'),
  //               message: const Text('My Message'),
  //               actions: <CupertinoActionSheetAction>[
  //                 CupertinoActionSheetAction(
  //                   child: const Text('Action One'),
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                 ),
  //                 CupertinoActionSheetAction(
  //                   child: const Text('Action Two'),
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                 )
  //               ],
  //               cancelButton: CupertinoActionSheetAction(
  //                 child: Text('Cancel'),
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //               )),
  //         );
  //       },
  //       child: const Text('Show Action Sheet'),
  //     ),
  //   );
  // }
}
