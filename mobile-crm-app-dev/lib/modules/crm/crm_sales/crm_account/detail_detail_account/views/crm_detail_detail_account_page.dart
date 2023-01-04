import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account_address.dart';
import 'package:ui_api/crm_api/models/account/account_document.dart';

import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../shared/widgets/crm/widget_phone_action.dart';
import '../../../../../../shared/widgets/crm/widget_title_component.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/crm_detail_detail_account_controllers.dart';

class CrmDetailDetailAccountPage
    extends GetView<CrmDetailDetailAccountController> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.account.details'.tr,
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
            onTap: controller.showModalBottomSheet,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Obx(
          () => SingleChildScrollView(
            child: _buildBodyContent(),
          ),
        ),
      ),
    );
  }

  Column _buildBodyContent() {
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 245, 244, 244),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          margin: const EdgeInsets.only(bottom: 5),
          child: ListTile(
            leading: FCoreImage(
              ImageConstants.crmLead,
              width: 45,
              height: 45,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'crm.customer'.tr,
                  style: AppTextStyle.heavy(fontSize: 15),
                ),
                Text(
                  controller.accountInfo.value?.getAccountNameAndCode() ?? '',
                  style: AppTextStyle.bold(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.grey.shade200))),
          child: CrmWidgetTitleComponent(
            title: 'crm.account.information'.tr,
            titleAction: controller.accountInfo.value?.isActive == 1
                ? 'crm.account.edit'.tr
                : '',
            onTap: controller.accountInfo.value?.isActive == 1
                ? controller.onChangeInfo
                : () {},
          ),
        ),
        _buildListIemsAccountInformation(),
        CrmWidgetTitleComponent(
          title: 'crm.account.address'.tr,
          titleAction: controller.accountInfo.value?.isActive == 1
              ? 'crm.account.edit'.tr
              : '',
          onTap: controller.accountInfo.value?.isActive == 1
              ? controller.onChangeAddress
              : () {},
        ),
        Container(
          child: controller.accountAddress.value != null
              ? _buildItemAddress(items: controller.accountAddress.value!)
              : Container(),
        ),
        CrmWidgetTitleComponent(
          title: controller.accountInfo.value?.accountTypeId == 1
              ? 'crm.account.identification'.tr
              : 'crm.account.info_company'.tr,
          titleAction: controller.accountInfo.value?.isActive == 1
              ? 'crm.account.edit'.tr
              : '',
          onTap: controller.accountInfo.value?.isActive == 1
              ? controller.onChangeDocument
              : () {},
        ),
        Container(
          child: controller.accountInfo.value != null &&
                  controller.accountInfo.value!.accountDocuments != null
              ? _buildItemsDocuments(
                  items: controller.accountInfo.value!.accountDocuments!)
              : Container(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Text(
                'Thông tin hệ thống',
                style: AppTextStyle.bold(fontSize: 18),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${'crm.create.by'.tr}'),
                  Text(
                      controller.accountInfo.value?.getCreateAtContent() ?? ''),
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
                  Text('${'crm.update.by'.tr}'),
                  Text(
                      controller.accountInfo.value?.getUpdateAtContent() ?? ''),
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

  Container _buildListIemsAccountInformation() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemField(
            label: 'crm.account.fullname'.tr,
            value: controller.accountInfo.value?.accountName ?? '',
          ),
          _buildItemField(
            label: 'crm.account.customertype'.tr,
            value: controller.crmMasterData?.getAccountTypeName(
                    controller.accountInfo.value?.accountTypeId ?? 0) ??
                '',
          ),
          CrmWidgetPhoneAction(
            title: controller.accountInfo.value?.accountPhone ?? '',
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade200,
                ),
              ),
            ),
            onTap: () {
              controller.onPhoneAction(
                  controller.accountInfo.value?.accountPhone ?? '');
            },
          ),
          _buildItemField(
            label: 'crm.account.email'.tr,
            value: controller.accountInfo.value?.accountEmail ?? '',
          ),
          Visibility(
            visible: controller.accountInfo.value?.accountTypeId == 1,
            child: _buildItemField(
                label: 'crm.account.gender'.tr,
                value: controller.crmMasterData?.getGenderName(
                        controller.accountInfo.value?.genderId ?? 0) ??
                    ''),
          ),
          Visibility(
            visible: controller.accountInfo.value?.accountTypeId == 2,
            child: CrmWidgetPhoneAction(
              label: '${'phone.number'.tr} 1',
              title: controller.accountInfo.value?.accountPhoneSecond ?? '',
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
              onTap: () {
                controller.onPhoneAction(
                    controller.accountInfo.value?.accountPhoneSecond ?? '');
              },
            ),
          ),
          _buildItemField(
            label: 'crm.account.business.areas'.tr,
            value: controller.crmMasterData?.getIndustryName(
                    controller.accountInfo.value?.industryId ?? 0) ??
                '',
          ),
          Visibility(
            visible: controller.accountInfo.value?.accountTypeId == 2,
            child: _buildItemField(
              label: 'crm.account.parent.level'.tr,
              value: controller.accountInfo.value?.parentAccountName ?? '',
            ),
          ),
          _buildItemField(
            label: 'crm.account.personal.in.charge'.tr,
            value: controller.account.value?.getOwnerEmployeeName() ?? '',
          ),
          _buildItemField(
            label: 'crm.account.des'.tr,
            value: controller.accountInfo.value?.accountDescription ?? '',
          ),
        ],
      ),
    );
  }

  Container _buildItemAddress({required List<AccountAddress> items}) {
    return Container(
      child: Column(
        children: [
          ...List.generate(
              items.length,
              (index) => Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.symmetric(
                            horizontal:
                                BorderSide(color: Colors.grey.shade200))),
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
                                items[index].isMain == 1
                                    ? 'Địa chỉ mặc định'
                                    : 'Địa chỉ bổ sung',
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            items[index].getFullAddress(),
                          ),
                        ),
                      ],
                    ),
                  ))
        ],
      ),
    );
  }

  Container _buildItemsDocuments({required List<AccountDocument> items}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey.shade200))),
      child: Column(
        children: [
          ...List.generate(
            items.length,
            (index) => Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey.shade200))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FCoreImage(ImageConstants.crmDocument, height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          '${items[index].documentTypeName ?? ''}: ${items[index].documentNumber ?? ''}',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      items[index].getFullDocument(),
                    ),
                  ),
                ],
              ),
            ),
          )
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
          Container(width: 155, child: Text(label)),
          Expanded(child: Text(value))
        ],
      ),
    );
  }
}
