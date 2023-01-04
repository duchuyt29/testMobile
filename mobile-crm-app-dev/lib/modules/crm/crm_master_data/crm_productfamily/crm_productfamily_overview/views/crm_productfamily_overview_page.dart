import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../../resource/assets_constant/images_constants.dart';

import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/flutter_back_widget.dart';

import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../../shared/widgets/widget_notification.dart';
import '../controllers/crm_productfamily_overview_controllers.dart';

class CrmProductFamilyOverviewPage
    extends GetView<CrmProductFamilyOverviewController> {
  const CrmProductFamilyOverviewPage({Key? key}) : super(key: key);

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
        const Divider(
          height: 25,
          color: Color.fromARGB(255, 86, 174, 247),
          thickness: 4,
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ListTile(
              leading: FCoreImage(
                ImageConstants.crmProductFamily,
                width: 60,
                height: 60,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              title: Text('crm.product.family.all'.tr),
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        _buildRowItemDetail(
          'License',
          'Mã:',
          'L',
        ),
        _buildRowItemDetail(
          'Hardware',
          'Mã:',
          'HW',
        ),
        _buildRowItemDetail(
          'Consulting',
          'Mã:',
          'CON',
        ),
        _buildRowItemDetail(
          'Implementation',
          'Mã:',
          'IMP',
        ),
        _buildRowItemDetail(
          'Cloud Service',
          'Mã:',
          'CLO',
        ),
      ],
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
            const BackPageWidget(),
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.backup_rounded,
                      size: 30,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star,
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
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
                size: 26,
              ),
              // helperText: "Search your topic",
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: 'crm.productfamily.search'.tr,
              labelStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              isDense: true,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              IconButton(
                onPressed: controller.addProductFamily,
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.blue,
                  size: 38,
                ),
              ),
              Text('crm.create.new'.tr),
            ],
          ),
        ),
      ],
    );
  }
}

Container _buildRowItemDetail(
  String name,
  String ma,
  String tenma,
) {
  return Container(
    padding: const EdgeInsets.only(left: 15, right: 10, top: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppTextStyle.bold(fontSize: 20),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(CRMRoutes.CRM_PRODUCT_FAMILY_DETAIL);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(ma)),
                Expanded(flex: 2, child: Text(tenma))
              ],
            ),
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 209, 209, 209),
          thickness: 1,
        ),
      ],
    ),
  );
}
