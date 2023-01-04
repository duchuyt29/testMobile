import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account_contact.dart';

import '../../../../../../../data/app_data_global.dart';
import '../../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../../shared/widgets/crm/widget_content_cell.dart';
import '../../../../../../../shared/widgets/crm/widget_slidable.dart';
import '../../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/crm_accountcontact_controllers.dart';

class CrmAccountContactPage extends GetView<CrmAccountContactControllers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.account.related.realtionship'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
        actions: [
          Visibility(
            visible: AppDataGlobal.userConfig?.menuActions
                    ?.crmServiceCustomerManagementRelatedContact?.create !=
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
        bottom: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 245, 244, 244),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  'crm.account'.tr,
                  style: AppTextStyle.heavy(fontSize: 15),
                ),
                Text(
                  controller.account?.accountName ?? '',
                  style: AppTextStyle.bold(fontSize: 20),
                ),
              ],
            ),
            onTap: () {},
          ),
        ),
        Container(
          height: 5,
          color: Colors.grey.shade100,
        ),
        Expanded(
          child: Obx(() => ListView.separated(
                controller: controller.scrollController,
                itemCount: controller.listAccountContact.length,
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
                                  ?.crmServiceCustomerManagementRelatedContact
                                  ?.update !=
                              null,
                          child: SlidableAction(
                            onPressed: (context) {
                              controller.onViewUpdate(
                                  controller.listAccountContact[index]);
                            },
                            backgroundColor: Colors.orangeAccent,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                          ),
                        ),
                        Visibility(
                          visible: AppDataGlobal
                                  .userConfig
                                  ?.menuActions
                                  ?.crmServiceCustomerManagementRelatedContact
                                  ?.delete !=
                              null,
                          child: SlidableAction(
                            onPressed: (context) {
                              controller.showDeleteModalBottomSheet(
                                  controller.listAccountContact[index].id ?? 0);
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                          ),
                        ),
                      ],
                    ),
                    child: _buildListItems(
                        item: controller.listAccountContact[index]),
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
    required AccountContact item,
  }) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: InkWell(
        onTap: () {
          if (AppDataGlobal.userConfig?.menuActions
                  ?.crmServiceCustomerManagementRelatedContact?.update !=
              null) {
            controller.onViewUpdate(item);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(ImageConstants.crmShapePolygon),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    item.contactName ?? '',
                    style: AppTextStyle.bold(fontSize: 18),
                  )
                ],
              ),
            ),
            WidgetContentCell('crm.account.contact_related'.tr,
                item.accountRelationTypeName ?? ''),
          ],
        ),
      ),
    );
  }
}
