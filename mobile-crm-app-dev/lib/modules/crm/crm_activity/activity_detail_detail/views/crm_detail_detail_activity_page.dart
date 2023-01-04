import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/crm_detail_detail_activity_controllers.dart';

class CrmDetailDetailActivityPage
    extends GetView<CrmDetailDetailActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm_activity_meeting'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
        actions: [
          CrmWidgetButton(
            bgColor: const Color(0xff797979),
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: 18,
            ),
            onTap: () {
              controller.showCreateModalBottomSheet();
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _buildBodyContent(),
        ),
      ),
    );
  }

  Column _buildBodyContent() {
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 245, 244, 244),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: ListTile(
            leading: FCoreImage(
              ImageConstants.crmAccount,
              width: 45,
              height: 45,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'crm.activity'.tr,
                  style: AppTextStyle.heavy(fontSize: 15),
                ),
                Text(
                  'dfrarhhwrh',
                  style: AppTextStyle.bold(fontSize: 20),
                ),
              ],
            ),
            onTap: () {},
          ),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text('crm.activity.status'.tr)),
              Flexible(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  height: 20,
                  decoration: BoxDecoration(
                      // color: trangThaiBgColor,
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  child: Text(
                    'aaaaa',
                    // style: TextStyle(color: trangThaiTextColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildItemField(label: 'crm.activity.topic'.tr, value: 'abc'),
        _buildItemField(label: 'crm.activity.priority.level'.tr, value: 'Cao'),
        _buildItemField(
            label: 'crm.activity.belonged'.tr, value: 'cơ hội bán hàng'),
        _buildItemField(label: 'crm.activity.name'.tr, value: 'aaaaa'),
        _buildItemField(
            label: 'crm.activity.begin.day'.tr, value: '11/11/11111'),
        _buildItemField(
            label: 'crm.activity.success.day'.tr, value: '11/11/1111'),
        _buildItemField(label: 'crm.activity.type.of.work'.tr, value: 'Nội bộ'),
        _buildItemAvata(image: ImageConstants.avatar, name: 'Hồng Anh'),
        _buildItemField(label: 'crm.activity.contact'.tr, value: ''),
        _buildItemField(label: 'crm.activity.responsible'.tr, value: 'abc'),
        _buildItemField(
            label: 'crm.desc'.tr,
            value:
                'abcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc'),
        _buildFooter(
            nameCreate: 'nameCreate',
            timeCreate: '11/11//1/11',
            nameUpdate: 'nameUpdate',
            timeUpdate: '11/1/1/1/1')
      ],
    );
  }

  Column _buildFooter({
    required String nameCreate,
    required String timeCreate,
    required String nameUpdate,
    required String timeUpdate,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: Text(
            'system.information'.tr,
            style: AppTextStyle.bold(fontSize: 18),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${'crm.create.by'.tr}: '),
              Row(
                children: [
                  Text(
                    nameCreate,
                    style: AppTextStyle.regular(color: Colors.blue),
                  ),
                  const SizedBox(width: 10),
                  Text(timeCreate),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${'crm.update.by'.tr}: '),
              Row(
                children: [
                  Text(
                    nameUpdate,
                    style: AppTextStyle.regular(color: Colors.blue),
                  ),
                  const SizedBox(width: 10),
                  Text(timeUpdate),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }

  Container _buildItemAvata({
    required String image,
    required String name,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 150, child: Text('crm.activity.requester'.tr)),
          Expanded(
              child: Row(
            children: [
              FCoreImage(
                image,
                height: 15,
              ),
              const SizedBox(width: 13),
              Text(name),
            ],
          ))
        ],
      ),
    );
  }

  Container _buildItemField({
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 150, child: Text(label)),
          Expanded(child: Text(value))
        ],
      ),
    );
  }
}
