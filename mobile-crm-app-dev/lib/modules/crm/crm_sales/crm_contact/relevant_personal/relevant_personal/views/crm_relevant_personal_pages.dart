import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/contact/contact_party_involved.dart';

import '../../../../../../../data/app_data_global.dart';
import '../../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../../shared/widgets/crm/widget_header_name.dart';
import '../../../../../../../shared/widgets/crm/widget_slidable.dart';
import '../controllers/crm_relevant_personal_contact_controllers.dart';

class CrmRelevantPersonalContactPage
    extends GetView<CrmRelevantPersonalContactController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.account.relevent.personal'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
        actions: [
          Visibility(
            visible: AppDataGlobal.userConfig?.menuActions
                    ?.crmServiceCustomerManagementPartyInvolved?.create !=
                null,
            child: CrmWidgetButton(
              bgColor: const Color.fromARGB(255, 85, 176, 249),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
              onTap: () {
                controller.showCreateModalBottomSheet();
              },
            ),
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
    return Column(
      children: [
        WidgetHeaderName(
          title: 'crm.contact'.tr,
          icon: ImageConstants.crmContact,
          name: controller.contact?.contactNameInList ??
              (controller.contact?.contactName ?? ''),
        ),
        Container(
          height: 5,
          color: Colors.grey.shade100,
        ),
        Expanded(
          child: Obx(() => ListView.separated(
                controller: controller.scrollController,
                itemCount: controller.listContactPartyInvolved.length,
                itemBuilder: (context, index) {
                  return CrmWidgetSlidable(
                    endActions: ActionPane(
                      extentRatio: 0.5,
                      motion: const ScrollMotion(),
                      children: [
                        Visibility(
                          visible: AppDataGlobal
                                  .userConfig
                                  ?.menuActions
                                  ?.crmServiceCustomerManagementPartyInvolved
                                  ?.update !=
                              null,
                          child: SlidableAction(
                            onPressed: (context) {
                              controller.onViewUpdate(
                                  controller.listContactPartyInvolved[index]);
                            },
                            backgroundColor: Colors.orangeAccent,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                          ),
                        ),
                        if (controller.listContactPartyInvolved[index].isMain !=
                            1)
                          Visibility(
                            visible: AppDataGlobal
                                    .userConfig
                                    ?.menuActions
                                    ?.crmServiceCustomerManagementPartyInvolved
                                    ?.delete !=
                                null,
                            child: SlidableAction(
                              onPressed: (context) {
                                controller.onDeleteAccount(controller
                                        .listContactPartyInvolved[index].id ??
                                    0);
                              },
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                            ),
                          ),
                      ],
                    ),
                    child: _buildListItems(
                        item: controller.listContactPartyInvolved[index]),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColor.dividerColor,
                ),
              )),
        ),
      ],
    );
  }

  Container _buildListItems({
    required ContactPartyInvolved item,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {
          if (AppDataGlobal.userConfig?.menuActions
                  ?.crmServiceCustomerManagementPartyInvolved?.update !=
              null) {
            controller.onViewUpdate(item);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(item.isMain == 1
                        ? ImageConstants.crmOwner
                        : ImageConstants.crmPartiesInvoled),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    item.getEmployeeFullName(),
                    style: AppTextStyle.bold(fontSize: 18),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 120,
                      child: Text('crm.account.involve.function'.tr)),
                  Expanded(
                      child: Text(item.partyInvolvedPartnerFunctionName ?? ''))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 120,
                      child: Text('crm.account.involve.position'.tr)),
                  Expanded(child: Text(item.employeeTitleName ?? ''))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
