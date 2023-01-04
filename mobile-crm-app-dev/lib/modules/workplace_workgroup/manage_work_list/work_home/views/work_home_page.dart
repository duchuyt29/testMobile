import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../routes/workgroup_pages.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/work_home_controller.dart';

class WorkHomePage extends GetView<WorkHomeController> {
  WorkHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          'workplace.workgroup.work'.tr,
          style: AppTextStyle.heavy(fontSize: 22),
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
          GestureDetector(
            onTap: () {
              Get.toNamed(WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_FORM_CREATE);
            },
            child: Container(
              padding: const EdgeInsets.only(right: 5),
              child: const Icon(
                Icons.add,
                color: Color(0xff493083),
                size: 25,
              ),
            ),
          ),
          const SizedBox(width: 10),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Công việc (2)'.tr,
                        style: AppTextStyle.regular(fontSize: 20),
                      )),
                  Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FormBuilderDropdown(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(13)),
                            name: 'name',
                            items: const [
                              DropdownMenuItem(
                                value: '1',
                                child: Text('Tất cả'),
                              ),
                              DropdownMenuItem(
                                value: '2',
                                child: Text('Đến hạn hôm nay'),
                              ),
                              DropdownMenuItem(
                                value: '3',
                                child: Text('Quá hạn'),
                              ),
                            ],
                            decoration: const InputDecoration(
                              errorStyle: TextStyle(height: 0),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          )
                        ],
                      ))
                ]),
          ),
          _buildItem(
            title: 'Tham gia đào tạo nội bộ',
            color: Colors.orangeAccent,
            status: 'Đang thực hiện',
            subTile: 'Nhóm làm việc' + ': ',
            subTileText: 'NDU3',
            petitioner: 'Ahahhahaha',
            timeSucces: '11/11/111',
          ),
          _buildItem(
            title: 'Họp nội bộ',
            color: Colors.orangeAccent,
            status: 'Đang thực hiện',
            subTile: 'Nhóm làm việc' + ': ',
            subTileText: 'NDU3',
            petitioner: 'Ahahhahaha',
            timeSucces: '11/11/111',
          ),
          _buildItem(
            title: 'Họp nội bộ',
            color: Colors.orangeAccent,
            status: 'Đang thực hiện',
            subTile: 'Nhóm làm việc' + ': ',
            subTileText: 'NDU3',
            petitioner: 'Ahahhahaha',
            timeSucces: '11/11/111',
          ),
        ],
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
  }) {
    return InkWell(
      // onTap: onTap,
      onTap: () {
        Get.toNamed(WorkGroupRoutes.WORKPLACE_WORKGROUP_DETAIL_WORK);
      },
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
