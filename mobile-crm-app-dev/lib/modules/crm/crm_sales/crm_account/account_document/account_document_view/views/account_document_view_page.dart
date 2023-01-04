import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account_document.dart';
import '../../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../../shared/widgets/crm/widget_slidable.dart';
import '../../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/account_document_view_controllers.dart';

class AccountDocumentViewPage extends GetView<AccountDocumentViewController> {
  AccountDocumentViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            controller.accountInfo.value?.accountTypeId == 1
                ? 'crm.account.edit.identification'.tr
                : 'crm.account.edit.info_company'.tr,
            style: AppTextStyle.heavy(fontSize: 20, color: Colors.white)),
        actions: [
          CrmWidgetButton(
            bgColor: const Color.fromARGB(255, 85, 176, 249),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 18,
            ),
            onTap: controller.create,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        top: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Container(
      child: Obx(
        () => Container(
          child: controller.accountDocument.value != null
              ? _buildItemAddress(items: controller.accountDocument.value!)
              : Container(),
        ),
      ),
    );
  }

  Container _buildItemAddress({required List<AccountDocument> items}) {
    return Container(
        child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i) {
        return CrmWidgetSlidable(
          endActions: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: items.length > 1 ? 0.5 : 0.3,
            children: [
              SlidableAction(
                onPressed: (context) {
                  controller.edit(items[i].id ?? 0);
                },
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
              if (items.length > 1)
                SlidableAction(
                  onPressed: (context) {
                    controller.onDeleteDocument(items[i].id ?? 0);
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
            ],
          ),
          child: _buildItem(item: items[i]),
        );
      },
    ));
  }

  Container _buildItem({required AccountDocument item}) {
    return Container(
      child: InkWell(
        onTap: () {
          controller.edit(item.id ?? 0);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Row(
                children: [
                  FCoreImage(ImageConstants.crmDocument, height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      '${item.documentTypeName ?? ''}: ${item.documentNumber ?? ''}',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                item.getFullDocument(),
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              height: 5,
              color: Colors.grey.shade200,
              thickness: 5,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildItemField({
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: 150, child: Text(label)),
          Expanded(child: Text(value))
        ],
      ),
    );
  }
}
