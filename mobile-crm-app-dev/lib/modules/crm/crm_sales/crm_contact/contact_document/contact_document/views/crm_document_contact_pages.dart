import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/crm/widget_button_action.dart';
import '../../../../../../../shared/widgets/crm/widget_crm_drawer.dart';
import '../../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/crm_document_contact_controllers.dart';

class CrmDocumentContactPage extends GetView<CrmDocumentContactController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
            size: 18,
          ),
          onPressed: Get.back,
        ),
        title: Text(
          'crm.quote.document'.tr,
          style: AppTextStyle.regular(color: Colors.black, fontSize: 20),
        ),
      ),
      drawer: CrmDrawer(),
      body: SafeArea(
        top: false,
        bottom: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        const Divider(
          height: 5,
          color: Color.fromARGB(255, 86, 174, 247),
          thickness: 4,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CrmWidgetButtonAction(
                  title: 'crm.create.new'.tr,
                  bgColor: Colors.blue,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                  onTap: controller.onViewFormDocument),
            ],
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 245, 244, 244),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: ListTile(
            leading: FCoreImage(
              ImageConstants.crmContact,
              width: 45,
              height: 45,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Người liên hệ',
                  style: AppTextStyle.regular(fontSize: 16),
                ),
                Text(
                  'Tổng công ty to đùng',
                  style: AppTextStyle.heavy(fontSize: 18),
                ),
              ],
            ),
            onTap: () {},
          ),
        ),
        Slidable(
          endActionPane: ActionPane(
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  controller.onViewFormDocument();
                },
                backgroundColor: const Color(0xff59CCBF),
                icon: Icons.edit,
                foregroundColor: Colors.white,
              ),
              SlidableAction(
                onPressed: (context) {
                  controller.showDeleteModalBottomSheet();
                },
                backgroundColor: const Color(0xffE2737A),
                icon: Icons.delete,
              ),
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: Colors.blueAccent,
                icon: Icons.cloud_download_outlined,
              ),
            ],
          ),
          child: GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(left: 2, top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 30, right: 5, top: 5, bottom: 2),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.text_snippet,
                          size: 40,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Hình ảnh tài liệu ',
                          style: AppTextStyle.bold(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  _buildListItems(
                      version: 'Phiên bản',
                      versionText: 'best new',
                      documentName: 'Tên tài liệu',
                      documentNameText: 'word',
                      creatorName: 'Người tạo/ sửa',
                      creatorNameText: 'Hồng Anh',
                      description: 'Mô tả tài liệu ',
                      descriptionText: '')
                ],
              ),
            ),
            onTap: () {},
          ),
        ),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.only(left: 2, top: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 30, right: 5, top: 5, bottom: 2),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.photo_library_outlined,
                        size: 40,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Hình ảnh tài liệu ',
                        style: AppTextStyle.bold(fontSize: 16),
                      )
                    ],
                  ),
                ),
                _buildListItems(
                    version: 'Phiên bản',
                    versionText: 'best new',
                    documentName: 'Tên tài liệu',
                    documentNameText: 'word',
                    creatorName: 'Người tạo/ sửa',
                    creatorNameText: 'Hồng Anh',
                    description: 'Mô tả tài liệu ',
                    descriptionText: '')
              ],
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }

  Container _buildListItems({
    required String version,
    required String versionText,
    required String documentName,
    required String documentNameText,
    required String creatorName,
    required String creatorNameText,
    required String description,
    required String descriptionText,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 35, right: 15, top: 0, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(version)),
                Expanded(flex: 2, child: Text(versionText))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(documentName)),
                Expanded(flex: 2, child: Text(documentNameText))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(creatorName)),
                Expanded(flex: 2, child: Text(creatorNameText))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(description)),
                Expanded(flex: 2, child: Text(descriptionText))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
