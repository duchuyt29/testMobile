import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/constants/common.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../shared/widgets/crm/widget_content_cell_border.dart';
import '../../../../../../shared/widgets/crm/widget_header_name.dart';
import '../../../../../../shared/widgets/crm/widget_phone_action.dart';
import '../../../../../../shared/widgets/crm/widget_title_component.dart';
import '../controllers/crm_detail_detail_contact_controllers.dart';

class CrmDetailDetailContactPage
    extends GetView<CrmDetailDetailContactController> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'crm.account.details'.tr,
            style: AppTextStyle.heavy(color: Colors.white, fontSize: 20),
          ),
          actions: [
            CrmWidgetButton(
              bgColor: const Color(0xff797979),
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 18,
              ),
              onTap: controller.showCreateModalBottomSheet,
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: _buildBodyContent());
  }

  Widget _buildBodyContent() {
    return Obx(
      () => Column(
        children: [
          WidgetHeaderName(
              title: 'crm.contact'.tr,
              icon: ImageConstants.crmContact,
              name:
                  '${controller.contact.value?.contactName ?? ''}_${controller.contact.value?.contactNumber ?? ''}'),
          Expanded(
            child: SingleChildScrollView(
              child: _buildInfor(),
            ),
          )
        ],
      ),
    );
  }

  Column _buildInfor() {
    return Column(
      children: [
        Container(
          height: 5,
          color: Colors.white,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.grey.shade200))),
          child: CrmWidgetTitleComponent(
            title: 'crm.contact.infor'.tr,
            titleAction: 'crm.account.edit'.tr,
            onTap: () {
              controller.onViewFormInformation();
            },
          ),
        ),
        WidgetContentCellBorder(
            'fullname'.tr, controller.contact.value?.contactName ?? ''),
        WidgetContentCellBorder('crm.contact.title_name'.tr,
            controller.contact.value?.contactSalutationName ?? ''),
        CrmWidgetPhoneAction(
          title: controller.contact.value?.contactPhone ?? '',
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          onTap: () {
            controller.onPhoneAction();
          },
        ),
        WidgetContentCellBorder('crm.contact.email'.tr,
            controller.contact.value?.contactEmail ?? ''),
        WidgetContentCellBorder('crm.contact.gender'.tr,
            controller.contact.value?.genderName ?? ''),
        WidgetContentCellBorder('crm.contact.position'.tr,
            controller.contact.value?.contactTitle ?? ''),
        WidgetContentCellBorder('crm.contact.owner_employee'.tr,
            controller.contact.value?.getOwnerEmployeeName() ?? ''),
        WidgetContentCellBorder('crm.contact.description'.tr,
            controller.contact.value?.contactDescription ?? ''),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          child: CrmWidgetTitleComponent(
            title: 'crm.contact.permanent.address'.tr,
            titleAction: 'crm.account.edit'.tr,
            onTap: () {
              controller
                  .onViewFormAddressContact(CommonConstants.contactBilling);
            },
          ),
        ),
        _buildItem(
            title: 'crm.contact.permanent.address'.tr,
            address: controller.contact.value?.getBillingAddress() ?? ''),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          child: CrmWidgetTitleComponent(
            title: 'crm.contact.permanent.contact'.tr,
            titleAction: 'crm.account.edit'.tr,
            onTap: () {
              controller
                  .onViewFormAddressContact(CommonConstants.contactShipping);
            },
          ),
        ),
        _buildItem(
            title: 'crm.contact.permanent.contact'.tr,
            address: controller.contact.value?.getShippingAddress() ?? ''),
        Container(
          height: 15,
          color: Colors.grey.shade100,
        ),
        Column(
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
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${'crm.create.by'.tr}: '),
                  Text(controller.contact.value?.getCreateAtContent() ?? ''),
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
                  Text(controller.contact.value?.getUpdateAtContent() ?? ''),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ],
    );
  }

  Container _buildItem({required String title, required String address}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey.shade300))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.orangeAccent,
                size: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  title,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              address,
            ),
          ),
        ],
      ),
    );
  }
}
