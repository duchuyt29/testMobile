import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/text_style/text_style.dart';

import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../routes/workgroup_pages.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/request_needs_my_approval_home_controller.dart';
import 'widgets/request_need_myPapproval_filter.dart';

class RequestNeedsMyApprovalHomePage
    extends GetView<RequestNeedsMyApprovalHomeController> {
  RequestNeedsMyApprovalHomePage({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
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
      child: Container(
        child: Scaffold(
          key: scaffoldKey,
          endDrawer: const RequestNeedMyAppovalFilterPage(),
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: Get.back,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xff493083),
                size: 18,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_SEARCH);
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: const Icon(
                    Icons.search,
                    color: Color(0xff493083),
                    size: 25,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
                icon: const Icon(
                  Icons.filter_alt_outlined,
                  color: Color(0xff4C3285),
                  size: 25,
                ),
              ),
              // if(_tabController.index == 0){}
              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     padding: const EdgeInsets.only(right: 10),
              //     child: const Icon(
              //       Icons.check_circle_outline_outlined,
              //       color: Color(0xff493083),
              //       size: 25,
              //     ),
              //   ),
              // )
            ],
            title: Text(
              'workplace.workgroup.request.needs.my.approval'.tr,
              style: AppTextStyle.heavy(fontSize: 22),
            ),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.purple,
              indicatorWeight: 5,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              labelColor: const Color(0xff493083),
              tabs: [
                Tab(
                  text: 'workplace.workgroup.waiting.approval'.tr + '(3)',
                ),
                Tab(
                  text: 'workplace.workgroup.approvedd'.tr + '(4)',
                ),
                Tab(
                  text: 'workplace.workgroup.refuse.approval'.tr + '(5)',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      _buildItemRow(
                          onTap: () {},
                          color: Colors.grey.shade500,
                          status: 'workplace.workgroup.waiting.approval'.tr,
                          title: 'Phê duyệt đơn nghỉ phép của AAAAAAA',
                          processName: 'Quy trình nghỉ phép ABC',
                          timeCreat: '13/12/2022',
                          petitioner: 'workplace.workgroup.petitioner'.tr,
                          approvedBy: '',
                          name: 'Nguyễn Văn A'),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildItemRow(
                          onTap: () {},
                          color: Colors.grey.shade500,
                          status: 'workplace.workgroup.waiting.approval'.tr,
                          title: 'Phê duyệt đơn nghỉ phép của AAAAAAA',
                          processName: 'Quy trình nghỉ phép ABC',
                          timeCreat: '13/12/2022',
                          petitioner: 'workplace.workgroup.petitioner'.tr,
                          approvedBy: '',
                          name: 'Nguyễn Văn A'),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildItemRow(
                          onTap: () {},
                          color: Colors.grey.shade500,
                          status: 'workplace.workgroup.waiting.approval'.tr,
                          title: 'Phê duyệt đơn nghỉ phép của AAAAAAA',
                          processName: 'Quy trình nghỉ phép ABC',
                          timeCreat: '13/12/2022',
                          petitioner: 'workplace.workgroup.petitioner'.tr,
                          approvedBy: '',
                          name: 'Nguyễn Văn A'),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      _buildItemRow(
                          onTap: () {},
                          color: Colors.green,
                          status: 'workplace.workgroup.approvedd'.tr,
                          title: 'Phê duyệt đơn nghỉ phép của AAAAAAA',
                          processName: 'Quy trình nghỉ phép ABC',
                          timeCreat: '13/12/2022',
                          petitioner: 'workplace.workgroup.petitioner'.tr,
                          approvedBy: '',
                          name: 'Nguyễn Văn A'),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildItemRow(
                          onTap: () {},
                          color: Colors.green,
                          status: 'workplace.workgroup.approvedd'.tr,
                          title: 'Phê duyệt đơn nghỉ phép của AAAAAAA',
                          processName: 'Quy trình nghỉ phép ABC',
                          timeCreat: '13/12/2022',
                          petitioner: 'workplace.workgroup.petitioner'.tr,
                          approvedBy: '',
                          name: 'Nguyễn Văn A'),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildItemRow(
                          onTap: () {},
                          color: Colors.green,
                          status: 'workplace.workgroup.approvedd'.tr,
                          title: 'Phê duyệt đơn nghỉ phép của AAAAAAA',
                          processName: 'Quy trình nghỉ phép ABC',
                          timeCreat: '13/12/2022',
                          petitioner: 'workplace.workgroup.petitioner'.tr,
                          approvedBy: '',
                          name: 'Nguyễn Văn A'),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildItemRow(
                          onTap: () {},
                          color: Colors.green,
                          status: 'workplace.workgroup.approvedd'.tr,
                          title: 'Phê duyệt đơn nghỉ phép của AAAAAAA',
                          processName: 'Quy trình nghỉ phép ABC',
                          timeCreat: '13/12/2022',
                          petitioner: 'workplace.workgroup.petitioner'.tr,
                          approvedBy: '',
                          name: 'Nguyễn Văn A'),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      _buildItemRow(
                          onTap: () {},
                          color: Colors.red,
                          status: 'workplace.workgroup.refuse.approval'.tr,
                          title: 'Phê duyệt đơn nghỉ phép của AAAAAAA',
                          processName: 'Quy trình nghỉ phép ABC',
                          timeCreat: '13/12/2022',
                          petitioner: 'workplace.workgroup.petitioner'.tr,
                          approvedBy: '',
                          name: 'Nguyễn Văn A'),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildItemRow(
                          onTap: () {},
                          color: Colors.red,
                          status: 'workplace.workgroup.refuse.approval'.tr,
                          title: 'Phê duyệt đơn nghỉ phép của AAAAAAA',
                          processName: 'Quy trình nghỉ phép ABC',
                          timeCreat: '13/12/2022',
                          petitioner: 'workplace.workgroup.petitioner'.tr,
                          approvedBy: '',
                          name: 'Nguyễn Văn A'),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildItemRow(
                          onTap: () {},
                          color: Colors.red,
                          status: 'workplace.workgroup.refuse.approval'.tr,
                          title: 'Phê duyệt đơn nghỉ phép của AAAAAAA',
                          processName: 'Quy trình nghỉ phép ABC',
                          timeCreat: '13/12/2022',
                          petitioner: 'workplace.workgroup.petitioner'.tr,
                          approvedBy: '',
                          name: 'Nguyễn Văn A'),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildItemRow(
                          onTap: () {},
                          color: Colors.red,
                          status: 'workplace.workgroup.refuse.approval'.tr,
                          title: 'Phê duyệt đơn nghỉ phép của AAAAAAA',
                          processName: 'Quy trình nghỉ phép ABC',
                          timeCreat: '13/12/2022',
                          petitioner: 'workplace.workgroup.petitioner'.tr,
                          approvedBy: '',
                          name: 'Nguyễn Văn A'),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildItemRow(
                          onTap: () {},
                          color: Colors.red,
                          status: 'workplace.workgroup.refuse.approval'.tr,
                          title: 'Phê duyệt đơn nghỉ phép của AAAAAAA',
                          processName: 'Quy trình nghỉ phép ABC',
                          timeCreat: '13/12/2022',
                          petitioner: 'workplace.workgroup.petitioner'.tr,
                          approvedBy: '',
                          name: 'Nguyễn Văn A'),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemRow({
    required VoidCallback onTap,
    required Color color,
    required String status,
    required String title,
    required String processName,
    required String timeCreat,
    required String petitioner,
    required String approvedBy,
    required String name,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(WorkGroupRoutes
                .WORKPLACE_WORKGROUP_REQUEST_NEEDS_MY_APPROVAL_DETAIL);
          },
          // onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FCoreImage(
                              ImageConstants.workplaceWorkgroupCheck,
                              height: 20,
                              width: 20,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              status,
                              style: AppTextStyle.bold(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          title,
                          style: AppTextStyle.heavy(
                              fontSize: 20, color: const Color(0xff172B4D)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            children: [
                              Text(
                                'workplace.workgroup.process.name'.tr,
                                style: AppTextStyle.regular(),
                              ),
                              Text(
                                processName,
                                style: AppTextStyle.regular(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            children: [
                              Text(
                                'workplace.workgroup.day.create'.tr,
                                style: AppTextStyle.regular(),
                              ),
                              Text(
                                timeCreat,
                                style: AppTextStyle.regular(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            children: [
                              Text(
                                petitioner + ': ',
                                style: AppTextStyle.regular(),
                              ),
                              Text(
                                name,
                                style: AppTextStyle.regular(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          height: 2,
          thickness: 3,
        )
      ],
    );
  }
}
