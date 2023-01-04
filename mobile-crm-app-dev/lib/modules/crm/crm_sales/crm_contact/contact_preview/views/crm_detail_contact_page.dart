import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../../data/app_data_global.dart';
import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../shared/widgets/crm/widget_content_cell.dart';
import '../../../../../../shared/widgets/crm/widget_phone_action.dart';
import '../controllers/crm_detail_contact_controllers.dart';

class CrmDetailContactPage extends GetView<CrmDetailContactController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.contact.detail'.tr,
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
            onTap: controller.showCreateModalBottomSheet,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                Container(
                  color: const Color.fromARGB(255, 245, 244, 244),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: ListTile(
                    leading: Container(
                      // ignore: prefer_const_constructors
                      child: SvgPicture.asset(
                        ImageConstants.crmContact,
                        width: 45,
                        height: 45,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'crm.contact'.tr,
                          style: AppTextStyle.heavy(fontSize: 15),
                        ),
                        Text(
                          '${controller.contact.value.contactNameInList ?? (controller.contact.value.contactName ?? '')}_${controller.contact.value.contactNumber}',
                          style: AppTextStyle.bold(fontSize: 20),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                WidgetContentCell('crm.code'.tr,
                    controller.contact.value.contactNumber ?? ''),
                WidgetContentCell(
                    'Chức vụ'.tr, controller.contact.value.contactTitle ?? ''),
                CrmWidgetPhoneAction(
                  title: controller.contact.value.contactPhone ?? '',
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  onTap: () {
                    controller.onPhoneAction();
                  },
                ),
                WidgetContentCell(
                    'Email'.tr, controller.contact.value.contactEmail ?? ''),
                Container(
                  height: 20,
                  color: Colors.grey.shade100,
                ),
                _buildListView(
                    title: 'crm.account.details'.tr,
                    ontap: controller.onViewContactDetail),
                Visibility(
                  visible: AppDataGlobal.userConfig?.menuActions
                          ?.crmServiceCustomerManagementPartyInvolved?.view !=
                      null,
                  child: _buildListView(
                      title: 'crm.account.relevant.personal'.tr,
                      ontap: controller.onViewPersonalReleventContact),
                ),
                Visibility(
                  visible: AppDataGlobal.userConfig?.menuActions
                          ?.crmServiceCustomerManagementRelatedContact?.view !=
                      null,
                  child: _buildListView(
                      title: 'crm.account.related.realtionship'.tr,
                      ontap: controller.onViewRelatedRelationshipContact),
                ),
                _buildListView(title: 'crm.lead.document'.tr, ontap: () {}
                    // ontap: controller.onViewDocumentContact
                    ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _buildListView({
    required String title,
    required VoidCallback ontap,
  }) {
    return Container(
      // height: 30,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -4),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        title: Text(
          title,
          style: AppTextStyle.heavy(fontSize: 16),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
        onTap: ontap,
      ),
    );
  }

  Container _buildListIems({
    required String contactNumber,
    required String contactNumberText,
    required String contactTitle,
    required String contactTitleText,
    required String contactPhone,
    required String contactPhoneText,
    required String contactEmail,
    required String contactEmailText,
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(contactNumber)),
                Expanded(flex: 2, child: Text(contactNumberText))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(contactTitle)),
                Expanded(flex: 2, child: Text(contactTitleText))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(contactPhone)),
                Expanded(
                    flex: 2,
                    child: Text(
                      contactPhoneText,
                      style: const TextStyle(color: Colors.blueAccent),
                    ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(contactEmail)),
                Expanded(flex: 2, child: Text(contactEmailText))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
