import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:ui_api/crm_api/models/account/account.dart';

import '../../../../../../data/app_data_global.dart';
import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/utils/app_util.dart';
import '../../../../../../shared/utils/date_util.dart';
import '../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../shared/widgets/crm/widget_content_cell.dart';
import '../../../../../../shared/widgets/crm/widget_phone_action.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/crm_detail_account_controllers.dart';

class CrmDetailAccountPage extends GetView<CrmDetailAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.account.custommer.details'.tr,
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
    return Stack(children: [
      Obx(() => Column(
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
                        'crm.customer'.tr,
                        style: AppTextStyle.heavy(fontSize: 15),
                      ),
                      Text(
                        '${controller.accountInfo.value?.accountName ?? ''}_${controller.accountInfo.value?.accountCode ?? ''}',
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
              _buildListItems(
                item: controller.accountInfo.value,
              ),
              Container(
                height: 20,
                color: Colors.grey.shade100,
              ),
              _buildListView(
                  title: 'crm.account.details'.tr,
                  ontap: controller.onViewAccountDetailDetail),

              Visibility(
                visible: AppDataGlobal.userConfig?.menuActions
                        ?.crmServiceCustomerManagementPartyInvolved?.view !=
                    null,
                child: _buildListView(
                  title: 'crm.account.relevant.personal'.tr,
                  ontap: () {
                    Get.toNamed(CRMRoutes.CRM_ACCOUNT_RELEVANT_PERSONAL,
                        arguments: controller.account.value);
                  },
                ),
              ),
              Visibility(
                visible: AppDataGlobal.userConfig?.menuActions
                        ?.crmServiceCustomerManagementRelatedContact?.view !=
                    null,
                child: _buildListView(
                  title: 'Mối quan hệ liên quan',
                  ontap: () {
                    Get.toNamed(CRMRoutes.CRM_ACCOUNT_CONTACT,
                        arguments: controller.account.value);
                  },
                ),
              ),
              // _buildListView(title: 'Người dùng', ontap: () {}),
            ],
          )),
      SlidingUpPanel(
        maxHeight: Get.height * 0.9,
        minHeight: Get.height * 0.11,
        panel: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
              ),
              Container(
                width: 45,
                height: 8,
                decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(12.0))),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'crm.account.recent.activity'.tr,
                  style: AppTextStyle.heavy(fontSize: 20),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Expanded(
                child: Obx(
                  () => ListView.separated(
                    // ignore: unnecessary_parenthesis
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(CRMRoutes.CRM_ACTIVITY_DETAIL,
                                  arguments:
                                      controller.listActivity[index].task?.id)!
                              .then((value) {
                            if (value != null && value) {
                              controller.getActivities(0, controller.request);
                            }
                          });
                        },
                        child: _buildActivityItem(
                            color: Colors.green,
                            icon: AppUtil.getIconActivity(controller
                                    .listActivity[index].task?.activityTypeId ??
                                0),
                            title:
                                controller.listActivity[index].task?.name ?? '',
                            day: controller.listActivity[index].task?.deadline ??
                                DateTime.now(),
                            dapriorityLevely: AppUtil.getTextPriority(
                                controller.listActivity[index].task?.priorityId ??
                                    -1),
                            responsiblePerson: AppUtil.getNameReponsiableEmployee(
                                controller.listActivity[index]),
                            desc: controller.listActivity[index].task?.description ??
                                ''),
                      );
                    }),
                    itemCount: controller.listActivity.length,
                    separatorBuilder: (context, index) => const Divider(),
                  ),
                ),
              ),
            ],
          ),
        ),
        collapsed: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              )),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 15),
                ),
                Container(
                  width: 45,
                  height: 8,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0))),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'crm.account.recent.activity'.tr,
                    style: AppTextStyle.heavy(fontSize: 20),
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
              ],
            ),
          ),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
    ]);
  }

  Container _buildActivityItem({
    required Color color,
    required String icon,
    required String title,
    required DateTime day,
    required String dapriorityLevely,
    required String responsiblePerson,
    required String desc,
  }) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FCoreImage(icon, width: 35, height: 35),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.regular(fontSize: 20, color: Colors.blue),
                ),
                Text(
                  DateUtil.formatDatetimeToString(day,
                      type: DateUtil.DATE_TYPE),
                  style: AppTextStyle.regular(),
                ),
                Container(
                  child: Text(
                    '${'crm.activity.priority.level'.tr}: $dapriorityLevely',
                    style: AppTextStyle.regular(),
                  ),
                ),
                Container(
                  child: Text(
                    '${'crm.activity.responsible'.tr}: $responsiblePerson',
                    style: AppTextStyle.regular(),
                  ),
                ),
                Container(
                  child: Text(
                    '${'crm.desc'.tr}: $desc',
                    style: AppTextStyle.regular(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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

  Container _buildListItems({
    required AccountInfo? item,
  }) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetContentCell('Mã', item?.accountCode ?? ''),
          CrmWidgetPhoneAction(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            title: item?.accountPhone ?? '',
            onTap: () {
              controller.onPhoneAction(item);
            },
          ),
          WidgetContentCell('Địa chỉ', item?.getAccountBilling() ?? ''),
          WidgetContentCell(
              'Nhân sự phụ trách', item?.getOwnerEmployeeName() ?? ''),
          WidgetContentCell(
              'Loại khách hàng',
              controller.crmMasterData?.getAccountTypeName(
                      controller.accountInfo.value?.accountTypeId ?? 0) ??
                  ''),
        ],
      ),
    );
  }
}
