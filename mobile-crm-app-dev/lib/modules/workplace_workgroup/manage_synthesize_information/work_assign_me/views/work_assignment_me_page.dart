import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../routes/workgroup_pages.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/work_assignment_me_controller.dart';
import 'widgets/assignment_me_filter.dart';

class TheAssignmentOfMePage extends GetView<TheAssignmentOfMeController> {
  TheAssignmentOfMePage({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: const AssignmentMeFilterPage(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          // automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
              size: 18,
            ),
          ),
          title: Text(
            'workplace.workgroup.assignment.me'.tr,
            style: AppTextStyle.heavy(fontSize: 24),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: FCoreImage(ImageConstants.workplaceWorkgroupcSearch),
            ),
            IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openEndDrawer();
              },
              icon: const Icon(
                Icons.filter_alt_outlined,
                color: Color(0xff4C3285),
                size: 25,
              ),
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            automaticIndicatorColorAdjustment: true,
            indicatorColor: Colors.purple,
            indicatorWeight: 5,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            labelColor: const Color(0xff493083),
            tabs: [
              Tab(
                text: 'Tổng công việc cần hoàn thành (5)'.tr,
              ),
              Tab(
                text: 'Việc có hạn trong hôm nay (2)'.tr,
              ),
              Tab(
                text: 'Việc quá hạn (1)'.tr,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  _buildItem(
                      title:
                          'Công ty TNHH 1 đàn vịt xòe ra rất nhiều cái cánh vịt nướng',
                      color: Colors.orangeAccent,
                      status: 'Đang thực hiện',
                      subTile: 'Dự án phát triển CRM',
                      subTileText: '',
                      petitioner: 'Ahahhahaha',
                      timeSucces: '11/11/111',
                      onTap: () {
                        Get.toNamed(
                            WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_PROJECT);
                      }),
                  _buildItem(
                      title: 'Tham gia đào tạo nội bộ',
                      color: Colors.orangeAccent,
                      status: 'Đang thực hiện',
                      subTile: 'Nhóm làm việc' + ': ',
                      subTileText: 'NDU3',
                      petitioner: 'Ahahhahaha',
                      timeSucces: '11/11/111',
                      onTap: () {
                        Get.toNamed(
                            WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_WORKGROUP);
                      }),
                  _buildItem(
                      title: 'Họp nội bộ',
                      color: Colors.orangeAccent,
                      status: 'Đang thực hiện',
                      subTile: 'Nhóm làm việc' + ': ',
                      subTileText: 'NDU3',
                      petitioner: 'Ahahhahaha',
                      timeSucces: '11/11/111',
                      onTap: () {
                        Get.toNamed(
                            WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_WORKGROUP);
                      }),
                  _buildItem(
                      title: 'Họp nội bộ',
                      color: Colors.blueGrey,
                      status: 'Chờ thực hiện',
                      subTile: 'Mã' + ': ',
                      subTileText: 'Ticketttt',
                      petitioner: 'Ahahhahaha',
                      timeSucces: '11/11/111',
                      onTap: () {
                        Get.toNamed(
                            WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_TICKET);
                      }),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  _buildItem(
                      title: 'Viết nnnnn',
                      color: Colors.orangeAccent,
                      status: 'Đang thực hiện',
                      subTile: 'Dự án phát triển CRM',
                      subTileText: '',
                      petitioner: 'Ahahhahaha',
                      timeSucces: '11/11/111',
                      onTap: () {
                        Get.toNamed(
                            WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_PROJECT);
                      }),
                  _buildItem(
                      title: 'Tham gia đào tạo nội bộ',
                      color: Colors.orangeAccent,
                      status: 'Đang thực hiện',
                      subTile: 'Nhóm làm việc' + ': ',
                      subTileText: 'NDU3',
                      petitioner: 'Ahahhahaha',
                      timeSucces: '11/11/111',
                      onTap: () {
                        Get.toNamed(
                            WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_WORKGROUP);
                      }),
                  _buildItem(
                      title: 'Họp nội bộ',
                      color: Colors.orangeAccent,
                      status: 'Đang thực hiện',
                      subTile: 'Nhóm làm việc' + ': ',
                      subTileText: 'NDU3',
                      petitioner: 'Ahahhahaha',
                      timeSucces: '11/11/111',
                      onTap: () {
                        Get.toNamed(
                            WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_WORKGROUP);
                      }),
                  _buildItem(
                      title: 'Họp nội bộ',
                      color: Colors.blueGrey,
                      status: 'Chờ thực hiện',
                      subTile: 'Mã' + ': ',
                      subTileText: 'Ticketttt',
                      petitioner: 'Ahahhahaha',
                      timeSucces: '11/11/111',
                      onTap: () {
                        Get.toNamed(
                            WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_TICKET);
                      }),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  _buildItem(
                      title: 'Viết aaaaaa',
                      color: Colors.orangeAccent,
                      status: 'Đang thực hiện',
                      subTile: 'Dự án phát triển CRM',
                      subTileText: '',
                      petitioner: 'Ahahhahaha',
                      timeSucces: '11/11/111',
                      onTap: () {
                        Get.toNamed(
                            WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_PROJECT);
                      }),
                  _buildItem(
                      title: 'Tham gia đào tạo nội bộ',
                      color: Colors.orangeAccent,
                      status: 'Đang thực hiện',
                      subTile: 'Nhóm làm việc' + ': ',
                      subTileText: 'NDU3',
                      petitioner: 'Ahahhahaha',
                      timeSucces: '11/11/111',
                      onTap: () {
                        Get.toNamed(
                            WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_WORKGROUP);
                      }),
                  _buildItem(
                      title: 'Họp nội bộ',
                      color: Colors.orangeAccent,
                      status: 'Đang thực hiện',
                      subTile: 'Nhóm làm việc' + ': ',
                      subTileText: 'NDU3',
                      petitioner: 'Ahahhahaha',
                      timeSucces: '11/11/111',
                      onTap: () {
                        Get.toNamed(
                            WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_WORKGROUP);
                      }),
                  _buildItem(
                      title: 'Họp nội bộ',
                      color: Colors.blueGrey,
                      status: 'Chờ thực hiện',
                      subTile: 'Mã' + ': ',
                      subTileText: 'Ticketttt',
                      petitioner: 'Ahahhahaha',
                      timeSucces: '11/11/111',
                      onTap: () {
                        Get.toNamed(
                            WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_TICKET);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required String title,
    required Color color,
    required String status,
    required String subTile,
    required String subTileText,
    required String petitioner,
    required String timeSucces,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      color: color,
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          FCoreImage(
                                            ImageConstants
                                                .workplaceWorkgroupCheck,
                                            height: 20,
                                            width: 20,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(width: 3),
                                          Text(
                                            status,
                                            style: AppTextStyle.bold(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: Get.width * 0.85,
                                child: Text(
                                  title,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 2, bottom: 2),
                                child: Row(
                                  children: [
                                    Text(
                                      subTile,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      subTileText,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Row(
                                  children: [
                                    Text(
                                      'workplace.workgroup.petitioner'.tr +
                                          ': ',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      petitioner,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Row(
                                  children: [
                                    Text(
                                      'workplace.workgroup.times.success'.tr +
                                          ': ',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      timeSucces,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 2,
              thickness: 3,
            )
          ],
        ),
      ),
    );
  }
}
