import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../routes/workgroup_pages.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/detail_work_controller.dart';

class DetailWorkPage extends GetView<DetailWorkController> {
  DetailWorkPage({Key? key}) : super(key: key);

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
                  Get.toNamed(WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_FORM);
                  break;
                case 2:
                  controller.showChangeStatusModalBottomSheet();
                  break;
                case 3:
                  Get.toNamed(WorkGroupRoutes.WORKPLACE_WORKGROUP_MANAGE_TIME);
                  break;
                case 4:
                  Get.toNamed(
                      WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_ATTACHMENTS);
                  break;
                case 5:
                  Get.toNamed(
                      WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_VIEW_HISTORY);
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'workplace.workgroup.state'.tr,
                  style: AppTextStyle.regular(color: Colors.black45),
                ),
                Text(
                  'workplace.workgroup.processing'.tr,
                  style: AppTextStyle.regular(
                      fontSize: 16, color: Colors.orangeAccent),
                ),
              ],
            ),
          ),
          _buildItemRow(
              title: 'workplace.workgroup.name'.tr, name: 'Testtttttt'),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'workplace.workgroup.content'.tr,
                  style: AppTextStyle.regular(color: const Color(0xff999999)),
                ),
                Text(
                  'datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata',
                  style: AppTextStyle.regular(),
                )
              ],
            ),
          ),
          // _buildItemRow1(
          //     title: 'workplace.workgroup.petitioner'.tr, name: 'Quỳnh Anh'),
          _buildItemRow(
              title: 'workplace.workgroup.belonging'.tr, name: 'Dự án A'),
          _buildItemRow(title: 'Loại việc'.tr, name: 'VC xịn'),
          _buildItemRow1(
              title: 'workplace.workgroup.person.responsible'.tr,
              name: 'Quỳnh Anh'),
          // _buildItemRow1(
          //     title: 'workplace.workgroup.handler'.tr, name: 'Quỳnh Anh'),
          _buildItemRow(
              title: 'workplace.workgroup.day.start'.tr,
              name: '11/11/2011 10:33'),
          _buildItemRow(
              title: 'workplace.workgroup.times.success'.tr,
              name: '18/05/2022 15:00'),
          _buildItemRow(title: 'workplace.workgroup.Estimated'.tr, name: '6.5'),
          // _buildItemRow(
          //     title: 'workplace.workgroup.complete.percentage'.tr, name: '90%'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: const Divider(
              height: 2,
              thickness: 1,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      Get.toNamed(
                          WorkGroupRoutes.WORKPLACE_WORKGROUP_MANAGE_TIME);
                    },
                    child: const Text('Thời gian làm việc thực tế: 16 ')),
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

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5, top: 10),
                  child: Text(
                    'workplace.workgroup.comment'.tr,
                    style: AppTextStyle.bold(color: const Color(0xff999999)),
                  )),
            ],
          ),
          ListTile(
            leading: FCoreImage(ImageConstants.avatar),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'AHAHAH',
                      style: AppTextStyle.regular(),
                    ),
                    const SizedBox(width: 15),
                    Text('30 phút trước', style: AppTextStyle.regular()),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'hahahahahahahahahahahahhahahahahahhahhhhhhhhhhhahaahahah',
                        style: AppTextStyle.regular(),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'workplace.workgroup.love'.tr,
                          style: AppTextStyle.regular(
                              color: const Color(0xff8a2be2)),
                        ),
                        const SizedBox(width: 15),
                        Text('Trả lời', style: AppTextStyle.regular()),
                      ],
                    ),
                    const Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                  ],
                ),
              ],
            ),
            onTap: null,
          ),
          //Stac
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

  Widget _buildItemRow1({
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
          Row(
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
        ],
      ),
    );
  }
}
