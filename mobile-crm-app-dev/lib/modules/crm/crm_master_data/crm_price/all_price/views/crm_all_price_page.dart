import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/flutter_back_widget.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../../shared/widgets/widget_notification.dart';
import '../controllers/crm_all_price_controller.dart';

class CrmAllPricePage extends GetView<CrmAllPriceController> {
  bool isChecked = false;
  RxBool check = false.obs;
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
        Container(
          // height: 100,

          color: const Color.fromARGB(255, 245, 244, 244),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: controller.onViewCreateNewPrice,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  Text('crm.create.new'.tr),
                ],
              ),
              const SizedBox(
                width: 130,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListTile(
          leading: FCoreImage(
            ImageConstants.crmPriceList,
            width: 45,
            height: 45,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          title: Text(
            'crm.price.all'.tr,
            style: AppTextStyle.bold(fontSize: 20),
          ),
          onTap: () {},
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 10, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: controller.onViewDetailsPrice,
                child: Text(
                  'Test',
                  style: AppTextStyle.heavy(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(flex: 1, child: Text('Mã')),
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'P0000001',
                          style: AppTextStyle.heavy(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: Text('crm.price.standard'.tr)),
                        Flexible(
                            flex: 2,
                            child: Checkbox(
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: -4),
                                checkColor: Colors.blue,
                                value: isChecked == false,
                                onChanged: null)),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: Text('crm.activity'.tr)),
                        Flexible(
                            flex: 2,
                            child: Checkbox(
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: -4),
                                checkColor: Colors.blue,
                                value: isChecked == false,
                                onChanged: null)),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 209, 209, 209),
                    thickness: 1,
                  ),
                ],
              ),
              TextButton(
                onPressed: controller.onViewDetailsPrice,
                child: Text(
                  'Test',
                  style: AppTextStyle.heavy(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(flex: 1, child: Text('Mã')),
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'P0000001',
                          style: AppTextStyle.heavy(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 1, child: Text('crm.price.standard'.tr)),
                    Flexible(
                        flex: 2,
                        child: Checkbox(
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            checkColor: Colors.blue,
                            value: isChecked == false,
                            onChanged: null)),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 1, child: Text('crm.price.standard'.tr)),
                    Flexible(
                        flex: 2,
                        child: Checkbox(
                            visualDensity:
                                const VisualDensity(horizontal: -4, vertical: -4
                                    // vertical: 4,
                                    ),
                            checkColor: Colors.blue,
                            value: isChecked == true,
                            onChanged: null)),
                  ],
                ),
              ),
            ],
          ),
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
            BackPageWidget(
              backText: 'crm.come.back'.tr,
            ),
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
              labelText: 'crm.price.search'.tr,
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
      ],
    );
  }
}
