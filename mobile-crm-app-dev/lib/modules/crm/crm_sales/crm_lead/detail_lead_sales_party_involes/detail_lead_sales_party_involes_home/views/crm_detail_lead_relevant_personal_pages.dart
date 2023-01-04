import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/lead/lead_party_involved.dart';
import '../../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/button/widget_icon_button.dart';
import '../../../../../../../shared/widgets/crm/widget_lead_name.dart';
import '../../../../../../../shared/widgets/crm/widget_slidable.dart';
import '../controllers/crm_detail_lead_relevant_personal_controllers.dart';

class CrmDetailLeadRelevantPersonalPage
    extends GetView<CrmDetailLeadRelevantPersonalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.quote.relevent.personal'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
        actions: [
          WidgetIconButton(
            onPressed: controller.showCreateModalBottomSheet,
            icon: Icons.add,
            backgroundColor: AppColor.addIconButtonColor,
          ),
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
        WidgetLeadName(controller.lead?.getLeadTitle() ?? ''),
        Container(
          height: 5,
          color: Colors.grey.shade100,
        ),
        Expanded(
          child: Obx(() => ListView.separated(
                controller: controller.scrollController,
                itemCount: controller.listLeadPartyInvolved.length,
                itemBuilder: (context, index) {
                  return CrmWidgetSlidable(
                    endActions: ActionPane(
                      extentRatio:
                          (controller.listLeadPartyInvolved[index].isMain != 1)
                              ? 0.5
                              : 0.3,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            controller.onViewUpdate(
                                controller.listLeadPartyInvolved[index]);
                          },
                          backgroundColor: Colors.orangeAccent,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                        ),
                        if (controller.listLeadPartyInvolved[index].isMain != 1)
                          SlidableAction(
                            onPressed: (context) {
                              controller.onDeleteAccount(
                                  controller.listLeadPartyInvolved[index].id ??
                                      0);
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                          ),
                      ],
                    ),
                    child: _buildListItems(
                        item: controller.listLeadPartyInvolved[index]),
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

  Container _buildListItems({required LeadPartyInvolved item}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {
          controller.onViewUpdate(item);
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
                    item.getEmplpoyee()?.getFullname() ?? '',
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
                      child: Text(item
                              .getPartyInvolvedPartnerFunction()
                              ?.partyInvolvedPartnerFunctionName ??
                          ''))
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
                  Expanded(
                      child: Text(item.getEmplpoyee()?.employeeTitleName ?? ''))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildButtonAdd({
  //   required final Function() onTap,
  // }) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       GestureDetector(
  //         onTap: onTap,
  //         child: Container(
  //           height: 30,
  //           width: 30,
  //           decoration: const BoxDecoration(
  //             color: Color.fromARGB(255, 16, 173, 181),
  //             borderRadius: BorderRadius.all(Radius.circular(25)),
  //           ),
  //           child: const Icon(
  //             Icons.add,
  //             size: 20,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
