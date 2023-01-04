import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/flutter_back_widget.dart';

import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../../shared/widgets/widget_notification.dart';

import '../controllers/crm_productfamily_detail_controller.dart';

class CrmProductFamilyDetailPage extends StatelessWidget {
  CrmProductFamilyDetailPage({Key? key}) : super(key: key);

  final CrmProductFamilyDetailController controller =
      Get.put(CrmProductFamilyDetailController());

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: _buildBodyContent(),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        _buildHeaderContent(),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'License',
              style: AppTextStyle.bold(fontSize: 25),
            ),
          ),
        ),
        const Divider(
          height: 25,
          color: Color.fromARGB(255, 86, 174, 247),
          thickness: 4,
        ),
        Container(
          // height: 100,
          // color: const Color.fromARGB(255, 245, 244, 244),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: controller.editProductFamily,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: FCoreImage(
                        ImageConstants.crmCrmUpdate,
                        width: 15,
                        height: 15,
                      ),
                    ),
                  ),
                  Text('crm.update'.tr),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: controller.showCreateModalBottomSheet,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  Text('crm.delete'.tr),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 245, 244, 244),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: ListTile(
            leading: FCoreImage(
              ImageConstants.crmProductFamily,
              width: 45,
              height: 45,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'crm.product.family'.tr,
                  style: AppTextStyle.heavy(fontSize: 15),
                ),
                Text(
                  'License',
                  style: AppTextStyle.bold(fontSize: 20),
                ),
              ],
            ),
            onTap: () {},
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _buildDetailItem(
          label: 'Mã',
          widget: const Text('L'),
        ),
        _buildDetailItem(
          label: 'Mô tả',
          widget: const Text(''),
        ),
        Container(
          height: 200,
          color: Colors.grey.shade100,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade100,
              ),
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            title: Text('crm.infor.system'.tr),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Container _buildDetailItem({required String label, required Widget widget}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(flex: 1, child: Text(label)),
                Flexible(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: widget,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildHeaderContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => controller.isNotification.value
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: WidgetNotification(
                  content: controller.notificationMessage.value,
                  marginBottom: 0.0,
                  backgroundColor: controller.isBlueNotification.value
                      ? AppColor.pollBackgroundColor
                      : null,
                  iconColor: controller.isBlueNotification.value
                      ? AppColor.stateInfoColor
                      : null,
                  textColor: controller.isBlueNotification.value
                      ? AppColor.stateInfoColor
                      : null,
                ),
              )
            : Container()),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackPageWidget(
              backText: ''.tr,
            ),
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.file_upload_outlined,
                      size: 30,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star_border_outlined,
                      size: 30,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
