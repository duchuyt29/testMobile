import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/attachments_controller.dart';
import 'widget/open_file.dart';

class AttachmentsPage extends GetView<AttachmentsController> {
  AttachmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff493083),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'workplace.workgroup.add.attachments'.tr,
          style: AppTextStyle.heavy(fontSize: 22, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          ),
          onPressed: Get.back,
        ),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  _dialogBuilder(context);
                },
                child: Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: const Icon(
                      Icons.file_upload_outlined,
                      size: 25,
                      color: Color(0xff493083),
                    )),
              ),
              Container(width: 10)
            ],
          )
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
            _buildItem(),
          ],
        ),
      ),
    );
  }

  ListTile _buildItem() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HUYHUY',
            style: AppTextStyle.regular(),
          ),
          Text(
            '100 kb'.tr,
            style: AppTextStyle.regular(fontSize: 12),
          ),
        ],
      ),
      leading: FCoreImage(
        ImageConstants.workplaceWorkgroupDoc,
        height: 50,
        color: const Color(0xff2C5898),
      ),
      trailing: const Icon(
        Icons.more_horiz_outlined,
        size: 20,
      ),
      onTap: controller.showAddDocModalBottomSheet,
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TextButton(
              //     onPressed: () => OpenFile(), child: const Text('Chọn file'))
            ],
          ),
          content: const Text('A dialog is a type of modal window that\n'
              'appears in front of app content to\n'
              'provide critical information, or prompt\n'
              'for a decision to be made.'),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.red)))),
                  onPressed: Get.back,
                  child: Text(
                    'Hủy',
                    style: AppTextStyle.regular(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.red)))),
                  onPressed: Get.back,
                  child: Text(
                    'Tải lên',
                    style: AppTextStyle.regular(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
