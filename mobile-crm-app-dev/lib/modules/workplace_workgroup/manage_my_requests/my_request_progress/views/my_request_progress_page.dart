import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/my_request_progress_controller.dart';

class MyRequestProgressPage extends GetView<MyRequestProgressController> {
  MyRequestProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff493083),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'workplace.workgroup.request.progress'.tr,
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
          IconButton(
              onPressed: () {},
              icon: FCoreImage(
                ImageConstants.workplaceWorkgroupAgain,
                color: Colors.white,
              ))
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
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Row(
              children: [
                Text(
                  'workplace.workgroup.request.infomation'.tr,
                  style:
                      AppTextStyle.regular(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'workplace.workgroup.state'.tr,
                  style: AppTextStyle.regular(color: const Color(0xff999999)),
                ),
                Text(
                  'workplace.workgroup.processing'.tr,
                  style: AppTextStyle.regular(color: Colors.orangeAccent),
                ),
              ],
            ),
          ),
          _buildItemRow(
              title: 'workplace.workgroup.process'.tr,
              name: 'Quy trình nghỉ phép '),
          _buildItemRow(
              title: 'workplace.workgroup.name.request'.tr,
              name: 'Quy trình nghỉ phép '),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'workplace.workgroup.des'.tr,
                  style: AppTextStyle.regular(color: const Color(0xff999999)),
                ),
                Text(
                  'datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata',
                  style: AppTextStyle.regular(),
                )
              ],
            ),
          ),
          _buildItemRow(
              title: 'workplace.workgroup.day.create'.tr,
              name: '11/11/2011 10:33'),
          _buildItemRow(
              title: 'workplace.workgroup.day.success'.tr,
              name: '18/05/2022 15:00'),
        ],
      ),
    );
  }

  Widget _buildItemRow({
    required String title,
    required String name,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.regular(color: const Color(0xff999999)),
          ),
          Text(
            name,
            style: AppTextStyle.regular(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
