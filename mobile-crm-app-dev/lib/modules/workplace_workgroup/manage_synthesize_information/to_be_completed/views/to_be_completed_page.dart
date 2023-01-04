import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_crm_drawer.dart';
import '../../../../../routes/workgroup_pages.dart';
import '../controllers/to_be_completed_controller.dart';

class ToBeCompletedPage extends GetView<ToBeCompletedController> {
  ToBeCompletedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'workplace.workgroup.work'.tr,
          style: AppTextStyle.heavy(fontSize: 24),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
            size: 18,
          ),
          onPressed: Get.back,
        ),
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
          _buildItem(
              onTap: () {
                Get.toNamed(WorkGroupRoutes.WORKPLACE_WORKGROUP_DETAIL_WORK);
              },
              color: Colors.amber,
              tenCV: 'Tên công việc 1',
              duAn: 'Dự án 1',
              han: 'Hạn hoàn thành: 18/11/2022 10:00'),
          _buildItem(
              onTap: () {},
              color: const Color(0xff00ffff),
              tenCV: 'Tên công việc 2',
              duAn: 'Dự án 2',
              han: 'Hạn hoàn thành: 18/11/2022 10:00'),
          _buildItem(
              onTap: () {},
              color: const Color(0xff8a2be2),
              tenCV: 'Tên công việc 3',
              duAn: 'Dự án 3',
              han: 'Hạn hoàn thành: 18/11/2022 10:00'),
          _buildItem(
              onTap: () {},
              color: const Color(0xff7fff00),
              tenCV: 'Tên công việc 4',
              duAn: 'Dự án 4',
              han: 'Hạn hoàn thành: 18/11/2022 10:00'),
          _buildItem(
              onTap: () {},
              color: const Color(0xffff7f50),
              tenCV: 'Tên công việc 5',
              duAn: 'Dự án 5',
              han: 'Hạn hoàn thành: 18/11/2022 10:00'),
          _buildItem(
              onTap: () {},
              color: const Color(0xff008b8b),
              tenCV: 'Tên công việc 6',
              duAn: 'Dự án 6',
              han: 'Hạn hoàn thành: 18/11/2022 10:00'),
          _buildItem(
              onTap: () {},
              color: const Color(0xffa9a9a9),
              tenCV: 'Tên công việc 7',
              duAn: 'Dự án 7',
              han: 'Hạn hoàn thành: 18/11/2022 10:00'),
          _buildItem(
              onTap: () {},
              color: const Color(0xffffb6c1),
              tenCV: 'Tên công việc 8',
              duAn: 'Dự án 8',
              han: 'Hạn hoàn thành: 18/11/2022 10:00'),
        ],
      ),
    );
  }

  Widget _buildItem({
    required VoidCallback onTap,
    required Color color,
    required String tenCV,
    required String duAn,
    required String han,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 30),
      height: 100,
      width: Get.width * 0.95,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    tenCV,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff493083)),
                  ),
                ],
              ),
              Text(
                duAn,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                    color: Color(0xff493083)),
              ),
              Text(
                han,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                    color: Color(0xff493083)),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            width: 80,
            // height: 70,
            child: IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
