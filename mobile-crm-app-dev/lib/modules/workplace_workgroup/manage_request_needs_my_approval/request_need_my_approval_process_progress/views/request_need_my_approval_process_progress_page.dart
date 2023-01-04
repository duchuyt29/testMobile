import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/request_need_my_approval_process_progress_controller.dart';

class RequestNeedMyApprovalProcessProgressPage
    extends GetView<RequestNeedMyApprovalProcessProgressController> {
  RequestNeedMyApprovalProcessProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff493083),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'workplace.workgroup.see.process'.tr,
          style: AppTextStyle.heavy(fontSize: 22, color: Colors.white),
        ),
        leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 18,
            )),
      ),
      body: SafeArea(
        bottom: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xffFD9E0F),
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
                              height: 15,
                              width: 15,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'workplace.workgroup.processing'.tr,
                              style: AppTextStyle.bold(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tạo yêu cầu ',
                            style: AppTextStyle.heavy(
                                fontSize: 20, color: const Color(0xff172B4D)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _buildItemField(
                              title: 'workplace.workgroup.human.create'.tr,
                              value: 'aaaaaa'),
                          _buildItemField(
                              title:
                                  'workplace.workgroup.request.responsile'.tr,
                              value: 'aaaaaa'),
                          _buildItemField(
                              title: 'crm.close.date'.tr, value: 'aaaaaa'),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 2,
                      thickness: 3,
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                color: const Color(0xffFD9E0F),
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
                                      height: 15,
                                      width: 15,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Đã phê duyệt'.tr,
                                      style: AppTextStyle.bold(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phê duyệt cấp 1',
                                style: AppTextStyle.heavy(
                                    fontSize: 20,
                                    color: const Color(0xff172B4D)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              _buildItemField(
                                  title: 'workplace.workgroup.human.create'.tr,
                                  value: 'aaaaaa'),
                              _buildItemField(
                                  title:
                                      'workplace.workgroup.request.responsile'
                                          .tr,
                                  value: 'aaaaaa'),
                              _buildItemField(
                                  title: 'crm.close.date'.tr, value: 'aaaaaa'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 2,
                      thickness: 3,
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                color: const Color(0xffFD9E0F),
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
                                      height: 15,
                                      width: 15,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Hoàn thành'.tr,
                                      style: AppTextStyle.bold(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phê duyệt cấp 2',
                                style: AppTextStyle.heavy(
                                    fontSize: 20,
                                    color: const Color(0xff172B4D)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              _buildItemField(
                                  title: 'workplace.workgroup.human.create'.tr,
                                  value: 'aaaaaa'),
                              _buildItemField(
                                  title:
                                      'workplace.workgroup.request.responsile'
                                          .tr,
                                  value: 'aaaaaa'),
                              _buildItemField(
                                  title: 'crm.close.date'.tr, value: 'aaaaaa'),
                              Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    'Đã phê duyệt',
                                    style:
                                        AppTextStyle.bold(color: Colors.blue),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 2,
                      thickness: 3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemField({
    required String title,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        children: [
          Text(
            title + ': ',
            style: AppTextStyle.regular(),
          ),
          Text(value, style: AppTextStyle.regular()),
        ],
      ),
    );
  }
}
