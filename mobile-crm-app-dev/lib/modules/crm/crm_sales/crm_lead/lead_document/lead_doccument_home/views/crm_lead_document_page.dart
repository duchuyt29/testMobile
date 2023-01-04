import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/button/widget_icon_button.dart';
import '../../../../../../../shared/widgets/crm/widget_button_action.dart';
import '../../../../../../../shared/widgets/crm/widget_crm_drawer.dart';
import '../../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/crm_lead_document_controllers.dart';

class CrmLeadDocumentPage extends GetView<CrmLeadDocumentController> {
  CrmLeadDocumentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'crm.lead.document'.tr,
          style: AppTextStyle.heavy(fontSize: 20),
        ),
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
            size: 18,
          ),
        ),
        actions: [
          WidgetIconButton(
            onPressed: controller.onViewFormDocument,
            icon: Icons.add,
            backgroundColor: const Color.fromARGB(255, 16, 173, 181),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      drawer: CrmDrawer(),
      body: SafeArea(
        top: false,
        child: _buildBodyContent(context),
      ),
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    return Column(
      children: [
        // _buildHeaderContent(context),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.blue.shade400,
                width: 3,
              ),
            ),
          ),
        ),

        _buildMainContent()
      ],
    );
  }

  Widget _buildMainContent() {
    return Expanded(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: ListTile(
            leading: FCoreImage(
              ImageConstants.crmCrmLead,
              width: 45,
              height: 45,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'crm.account'.tr,
                  style: AppTextStyle.heavy(fontSize: 15),
                ),
                Text(
                  'Công ty TNHH 1 thành viên',
                  style: AppTextStyle.bold(fontSize: 20),
                ),
              ],
            ),
            onTap: () {},
          ),
        ),
        Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                onPressed: (context) => controller.onViewFormDocument(),
                backgroundColor: const Color.fromARGB(255, 74, 187, 170),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'edit'.tr,
              ),
              SlidableAction(
                onPressed: (context) =>
                    controller.showDeleteDocumentModalBottomSheet(),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'delete'.tr,
              ),
              SlidableAction(
                onPressed: null, //(context) =>
                //{controller.showDeleteSalePartyInvoledModalBottomSheet()},
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                icon: Icons.cloud_download,
                label: 'download'.tr,
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                child: ListTile(
                    leading: const Icon(Icons.file_copy),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    title: Text('Tài liệu kiểm thử'.tr),
                    onTap: () {}),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: _buildListIems(
                    version: 'Phiên bản',
                    versionText: '1351ajfauja',
                    document: 'Tên tài liệu',
                    documentText: 'Word',
                    person: 'Người tạo/sửa',
                    personText: 'QUỳnh Anh',
                    des: 'Mô tả tài liệu',
                    desText: ''),
              )
            ],
          ),
        ),
        Divider(
          height: 0,
          color: Colors.grey.shade100,
          thickness: 2,
        ),
        Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => controller.onViewFormDocument(),
                backgroundColor: const Color.fromARGB(255, 74, 187, 170),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'edit'.tr,
              ),
              SlidableAction(
                onPressed: (context) =>
                    controller.showDeleteDocumentModalBottomSheet(),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'delete'.tr,
              ),
              SlidableAction(
                onPressed: null, //(context) =>
                //{controller.showDeleteSalePartyInvoledModalBottomSheet()},
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                icon: Icons.cloud_download,
                label: 'download'.tr,
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                child: ListTile(
                    leading: const Icon(Icons.image),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    title: Text('Tài liệu hình ảnh'.tr),
                    onTap: () {}),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: _buildListIems(
                    version: 'Phiên bản',
                    versionText: '1351ajfauja',
                    document: 'Tên tài liệu',
                    documentText: 'Word',
                    person: 'Người tạo/sửa',
                    personText: 'QUỳnh Anh',
                    des: 'Mô tả tài liệu',
                    desText: ''),
              )
            ],
          ),
        ),
      ]),
    );
  }

  Container _buildListIems({
    required String version,
    required String versionText,
    required String document,
    required String documentText,
    required String person,
    required String personText,
    required String des,
    required String desText,
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
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
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(document)),
                Expanded(flex: 2, child: Text(documentText))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(person)),
                Expanded(flex: 2, child: Text(personText))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(des)),
                Expanded(flex: 2, child: Text(desText))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
