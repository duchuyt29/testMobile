import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../routes/workgroup_pages.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/detail_work_ticket_controller.dart';

class DetailWorkTicketPage extends GetView<DetailWorkTicketController> {
  DetailWorkTicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff493083),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'workplace.workgroup.details.job'.tr,
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
                  Get.toNamed(
                      WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_FORM_TICKET);
                  break;
                case 2:
                  break;
                case 3:
                  break;
                case 4:
                  break;
                case 5:
                  break;
                default:
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    FCoreImage(ImageConstants.workplaceWorkgroupNote),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('workplace.workgroup.edit.job'.tr)
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    FCoreImage(ImageConstants.workplaceWorkgroupChange),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('workplace.workgroup.state.change'.tr)
                  ],
                ),
              ),
              PopupMenuItem(
                value: 3,
                child: Row(
                  children: [
                    FCoreImage(ImageConstants.workplaceWorkgroupClock),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('workplace.workgroup.time.management'.tr)
                  ],
                ),
              ),
              PopupMenuItem(
                value: 4,
                child: Row(
                  children: [
                    FCoreImage(ImageConstants.workplaceWorkgroupPin),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('workplace.workgroup.view.document'.tr)
                  ],
                ),
              ),
              PopupMenuItem(
                value: 5,
                child: Row(
                  children: [
                    FCoreImage(
                      ImageConstants.workplaceWorkgroupHistory,
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
                Text('workplace.workgroup.infor.together'.tr,
                    style: const TextStyle(fontSize: 20))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'workplace.workgroup.state'.tr,
                    style: AppTextStyle.regular(color: Colors.black45),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'workplace.workgroup.processing'.tr,
                    style: AppTextStyle.regular(
                        fontSize: 16, color: Colors.orangeAccent),
                  ),
                ),
              ],
            ),
          ),
          _buildItemRow(title: 'workplace.workgroup.ticket'.tr, name: 'Ticket'),
          _buildItemRow(
              title: 'workplace.workgroup.petitioner'.tr, name: 'AAA A'),
          _buildItemRow(title: 'Name'.tr, name: 'AAAAAA'),
          _buildItemRow(
              title: 'workplace.workgroup.belonging'.tr, name: 'AAAAAA'),
          _buildItemRow(
              title: 'workplace.workgroup.note'.tr,
              name:
                  'Clip the overflowing text to fix its container.Clip the overflowing text to fix its container.'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Divider(
              height: 2,
              thickness: 1,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
            child: Row(
              children: [
                FCoreImage(ImageConstants.workplaceWorkgroupCard),
                const SizedBox(width: 10),
                Text('workplace.workgroup.power'.tr,
                    style: const TextStyle(fontSize: 20))
              ],
            ),
          ),
          _buildItemRow1(
              title: 'workplace.workgroup.supervisor'.tr, name: 'Quỳnh Anh'),
          _buildItemRow(
              title: 'workplace.workgroup.processing.group'.tr, name: 'AAAAAA'),
          _buildItemRow1(
              title: 'workplace.workgroup.person.responsible'.tr,
              name: 'Quỳnh Anh'),
          Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
            child: const Divider(
              height: 2,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                FCoreImage(ImageConstants.workplaceWorkgrouprelevantTime),
                const SizedBox(width: 10),
                Text('workplace.workgroup.times'.tr,
                    style: const TextStyle(fontSize: 20))
              ],
            ),
          ),
          _buildItemRow(
              title: 'crm.activity.begin.day'.tr, name: '11/11/2022 11:11'),
          _buildItemRow(
              title: 'workplace.workgroup.processing.time'.tr,
              name: '11/11/2022 11:11'),
          _buildItemRow(
              title: 'workplace.workgroup.Estimated'.tr, name: '10.0'),
          _buildItemRow(
              title: 'workplace.workgroup.start.reality'.tr, name: ''),
          _buildItemRow(title: 'workplace.workgroup.end.reality'.tr, name: ''),
          _buildItemRow(
              title: 'workplace.workgroup.complete.percentage'.tr, name: '10%'),
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
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
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

  Widget _buildItemRow1({
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
            child: Row(
              children: [
                FCoreImage(ImageConstants.workplaceWorkgroupcAvata),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  name,
                  style: AppTextStyle.regular(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
