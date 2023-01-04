import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../routes/workgroup_pages.dart';
import '../controllers/work_manage_time_controller.dart';

class ManageTimeWorkPage extends GetView<ManageTimeWorkController> {
  ManageTimeWorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff493083),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'workplace.workgroup.manage.time'.tr,
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
                  Get.toNamed(
                      WorkGroupRoutes.WORKPLACE_WORKGROUP_MANAGE_TIME_FORM);
                },
                child: Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: const Icon(
                      Icons.add,
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
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Text(
                  'Thời gian làm việc thực tế: 16 giờ'.tr,
                  style: AppTextStyle.regular(fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: const Divider(
              height: 2,
              thickness: 1,
            ),
          ),
          Slidable(
            endActionPane: ActionPane(
              motion: const BehindMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {},
                  icon: Icons.copy,
                  foregroundColor: Colors.black,
                  // label: 'Chỉnh sửa',
                ),
                SlidableAction(
                  onPressed: (context) {},
                  icon: Icons.edit,
                  foregroundColor: Colors.black,
                  // label: 'Chỉnh sửa',
                ),
                SlidableAction(
                    onPressed: (context) {},
                    icon: Icons.delete,
                    foregroundColor: Colors.black)
              ],
            ),
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(left: 0, top: 5, bottom: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          _buildItemRow(
                              title: 'Tên công việc'.tr, name: 'Testtttttt'),
                          _buildItemRow(
                              title: 'Ngày thực hiện'.tr, name: '11/11/2011'),
                          _buildItemRow(title: 'Số giờ'.tr, name: '24'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: const Divider(
              height: 2,
              thickness: 1,
            ),
          ),
          Slidable(
            endActionPane: ActionPane(
              motion: const BehindMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {},
                  icon: Icons.copy,
                  foregroundColor: Colors.black,
                  // label: 'Chỉnh sửa',
                ),
                SlidableAction(
                  onPressed: (context) {},
                  icon: Icons.edit,
                  foregroundColor: Colors.black,
                  // label: 'Chỉnh sửa',
                ),
                SlidableAction(
                    onPressed: (context) {},
                    icon: Icons.delete,
                    foregroundColor: Colors.black)
              ],
            ),
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(left: 0, top: 5, bottom: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          _buildItemRow(
                              title: 'Tên công việc'.tr, name: 'Testtttttt'),
                          _buildItemRow(
                              title: 'Ngày thực hiện'.tr, name: '11/11/2011'),
                          _buildItemRow(title: 'Số giờ'.tr, name: '24'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: const Divider(
              height: 2,
              thickness: 1,
            ),
          ),
          Slidable(
            endActionPane: ActionPane(
              motion: const BehindMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {},
                  icon: Icons.copy,
                  foregroundColor: Colors.black,
                  // label: 'Chỉnh sửa',
                ),
                SlidableAction(
                  onPressed: (context) {},
                  icon: Icons.edit,
                  foregroundColor: Colors.black,
                  // label: 'Chỉnh sửa',
                ),
                SlidableAction(
                    onPressed: (context) {},
                    icon: Icons.delete,
                    foregroundColor: Colors.black)
              ],
            ),
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(left: 0, top: 5, bottom: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          _buildItemRow(
                              title: 'Tên công việc'.tr, name: 'Testtttttt'),
                          _buildItemRow(
                              title: 'Ngày thực hiện'.tr, name: '11/11/2011'),
                          _buildItemRow(title: 'Số giờ'.tr, name: '8.0'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: const Divider(
              height: 2,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow({
    required String title,
    required String name,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
