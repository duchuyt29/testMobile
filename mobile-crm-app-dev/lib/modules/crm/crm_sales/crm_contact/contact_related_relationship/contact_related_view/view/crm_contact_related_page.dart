import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/contact/contact_account.dart';

import '../../../../../../../data/app_data_global.dart';
import '../../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/crm/widget_content_cell.dart';
import '../../../../../../../shared/widgets/crm/widget_header_name.dart';
import '../../../../../../../shared/widgets/crm/widget_slidable.dart';
import '../controllers/crm_contact_related_controllers.dart';

class CrmContactRelatedPage extends GetView<CrmContactRelatedControllers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.account.related.realtionship'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
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
                itemCount: controller.listContactAccount.length,
                itemBuilder: (context, index) {
                  return CrmWidgetSlidable(
                    endActions: ActionPane(
                      extentRatio: 0.3,
                      motion: const ScrollMotion(),
                      children: [
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
                                  controller.listContactAccount[index].id ?? 0);
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                          ),
                        ),
                      ],
                    ),
                    child: _buildListItems(
                        item: controller.listContactAccount[index]),
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
    required ContactAccount item,
  }) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: InkWell(
        onTap: () {},
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
                    item.accountName ?? '',
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
