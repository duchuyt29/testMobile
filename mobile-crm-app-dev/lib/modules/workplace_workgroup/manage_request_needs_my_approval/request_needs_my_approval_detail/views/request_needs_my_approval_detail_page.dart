import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../routes/workgroup_pages.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/request_needs_my_approval_detail_controller.dart';

class RequestNeedMyApprovalDetailPage
    extends GetView<RequestNeedMyApprovalDetailController> {
  RequestNeedMyApprovalDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff493083),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'workplace.workgroup.my.requests.detail'.tr,
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
          PopupMenuButton<int>(
            icon: Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: FCoreImage(
                ImageConstants.workplaceWorkgroupDots,
                color: const Color(0xff493083),
              ),
            ),
            onSelected: (value) {
              switch (value) {
                case 1:
                  controller.showChangeStatusModalBottomSheet();
                  break;
                case 2:
                  break;
                case 3:
                  Get.toNamed(WorkGroupRoutes
                      .WORKPLACE_WORKGROUP_REQUEST_NEEDS_MY_VIEW_PROCESS_PROGRESS);
                  break;
                case 4:
                  Get.toNamed(WorkGroupRoutes
                      .WORKPLACE_WORKGROUP_REQUEST_NEEDS_MY_APPROVAL_HISTORY);
                  break;
                default:
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    FCoreImage(ImageConstants.workplaceWorkgroupcChange),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('workplace.workgroup.state.change'.tr)
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    FCoreImage(
                      ImageConstants.workplaceWorkgroupUpdate,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('workplace.workgroup.update.request'.tr)
                  ],
                ),
              ),
              PopupMenuItem(
                value: 3,
                child: Row(
                  children: [
                    FCoreImage(ImageConstants.workplaceWorkgroupSeeProcess),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('workplace.workgroup.see.process'.tr)
                  ],
                ),
              ),
              PopupMenuItem(
                value: 4,
                child: Row(
                  children: [
                    FCoreImage(
                      ImageConstants.workplaceWorkgroupcHistory,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('workplace.workgroup.view.history'.tr)
                  ],
                ),
              ),
            ],
            offset: const Offset(0, 50),
          ),
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
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Row(
              children: [
                FCoreImage(
                    ImageConstants.workplaceWorkgrouprelevantCalendarCheck),
                const SizedBox(width: 10),
                Text('workplace.workgroup.request.infomation'.tr,
                    style: const TextStyle(fontSize: 20))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'workplace.workgroup.state'.tr,
                    style: AppTextStyle.regular(color: const Color(0xff999999)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'workplace.workgroup.processing'.tr,
                    style: AppTextStyle.regular(color: Colors.orangeAccent),
                  ),
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
          _buildItemRow(
              title: 'workplace.workgroup.petitioner'.tr, name: 'ABC'),
          _buildItemRow(
              title: 'workplace.workgroup.day.create'.tr,
              name: '11/11/2011 10:33'),
          _buildItemRow(
              title: 'workplace.workgroup.day.start'.tr,
              name: '18/05/2022 15:00'),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: const Divider(
              height: 2,
              thickness: 1,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Row(
              children: [
                FCoreImage(
                    ImageConstants.workplaceWorkgrouprelevantCalendarCheck),
                const SizedBox(width: 10),
                Text('workplace.workgroup.information.work'.tr,
                    style: const TextStyle(fontSize: 20))
              ],
            ),
          ),
          _buildItemRow(
              title: 'workplace.workgroup.status.approve'.tr, name: ''),
          _buildItemRow(title: 'workplace.workgroup.name.job'.tr, name: ''),
          _buildItemRow(title: 'workplace.workgroup.note'.tr, name: ''),
          _buildItemRow(title: 'workplace.workgroup.start'.tr, name: ''),
          _buildItemRow(
              title: 'workplace.workgroup.duration.success'.tr, name: ''),
          _buildItemRow(title: 'workplace.workgroup.supervisor'.tr, name: ''),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'workplace.workgroup.approve'.tr,
                  style: AppTextStyle.bold(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          )
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
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: AppTextStyle.regular(color: const Color(0xff999999)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: AppTextStyle.regular(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
