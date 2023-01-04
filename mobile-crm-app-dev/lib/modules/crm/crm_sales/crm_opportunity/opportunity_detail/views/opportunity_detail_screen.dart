import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:status_change/status_change.dart';

import '../../../../../../data/app_data_global.dart';
import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/utils/app_util.dart';
import '../../../../../../shared/utils/date_util.dart';
import '../../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/opportunity_detail_controller.dart';

class CrmDetailOpportunityScreen
    extends GetView<CrmOpportunityDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.quote.detail'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
        actions: [
          Visibility(
            visible: AppDataGlobal.userConfig?.menuActions
                    ?.crmServiceSaleManagementSaleActivity?.createTask !=
                null,
            child: CrmWidgetButton(
              bgColor: Colors.orangeAccent,
              icon: const Icon(
                Icons.phone_callback_rounded,
                color: Colors.white,
                size: 18,
              ),
              onTap: controller.showCreateActivityModalBottomSheet,
            ),
          ),
          const SizedBox(width: 10),
          Obx(
            () =>
                controller.opportunityInfo.value?.isOpportunityClose() ?? false
                    ? const SizedBox.shrink()
                    : Visibility(
                        visible: AppDataGlobal
                                .userConfig
                                ?.menuActions
                                ?.crmServiceSaleManagementSaleOpporturnityInfo
                                ?.delete !=
                            null,
                        child: CrmWidgetButton(
                          bgColor: Colors.red,
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 18,
                          ),
                          onTap: () => controller.showDeleteModalBottomSheet(
                              controller.opportunityInfo.value!.id ?? 0),
                        ),
                      ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Obx(_buildBodyContent),
    );
  }

  Widget _buildBodyContent() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 245, 244, 244),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ListTile(
                  leading: FCoreImage(
                    ImageConstants.crmOpp,
                    width: 45,
                    height: 45,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'crm.opportunity.title'.tr,
                        style: AppTextStyle.heavy(fontSize: 15),
                      ),
                      Text(
                        '${controller.opportunityInfo.value?.opportunityName ?? ''} - ${controller.opportunityInfo.value?.opportunityCode ?? ''}',
                        style: AppTextStyle.bold(fontSize: 20),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              _buildListItem(),
              Container(
                height: 5,
                color: Colors.grey.shade100,
              ),
              _buildLeadStages(),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 7,
                color: Colors.grey.shade100,
              ),
              _buildListView(
                  title: 'crm.account.details'.tr,
                  onTap: controller.onViewDetail),
              _buildListView(
                title: 'crm.account.relevant.personal'.tr,
                onTap: controller.onViewSalePartyInvolved,
              ),
              // _buildListView(title: 'crm.lead.document'.tr, onTap: () {}),
              _buildListView(
                  title: 'crm.product.title'.tr,
                  onTap: controller.onViewProduct),
              // _buildListView(title: 'crm.quote.title'.tr, onTap: () {}),
            ],
          ),
        ),
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
                                    arguments: controller
                                        .listActivity[index].task?.id)!
                                .then((value) {
                              if (value != null && value) {
                                controller.getActivities(0, controller.request);
                              }
                            });
                          },
                          child: _buildActivityItem(
                              color: Colors.green,
                              icon: AppUtil.getIconActivity(controller
                                      .listActivity[index]
                                      .task
                                      ?.activityTypeId ??
                                  0),
                              title: controller.listActivity[index].task?.name ??
                                  '',
                              day: controller.listActivity[index].task?.deadline ??
                                  DateTime.now(),
                              dapriorityLevely: AppUtil.getTextPriority(controller
                                      .listActivity[index].task?.priorityId ??
                                  -1),
                              responsiblePerson: controller.listActivity[index]
                                      .task?.responsible?.fullName ??
                                  '',
                              desc: controller.listActivity[index].task?.description ?? ''),
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
                ],
              ),
            ),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
      ],
    );
  }

  Container _buildListView({
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
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
        onTap: onTap,
      ),
    );
  }

  Container _buildListItem() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text('crm.code'.tr)),
                Expanded(
                    flex: 2,
                    child: Text(
                        controller.opportunityInfo.value?.opportunityCode ??
                            '')),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text('crm.opportunity.stage'.tr)),
                Expanded(
                    flex: 2,
                    child: Text(
                        controller.opportunityInfo.value?.getStageName() ??
                            '')),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text('crm.close.date'.tr)),
                Expanded(
                    flex: 2,
                    child: Text(
                      DateUtil.formatDatetimeToString(
                          controller.opportunityInfo.value?.closeDate),
                    ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text('crm.opportunity.amount'.tr)),
                Expanded(
                    flex: 2,
                    child: Text(
                        controller.opportunityInfo.value?.getAmount() ?? ''))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadStages() {
    return Column(
      children: [
        Container(
          height: 100,
          margin: const EdgeInsets.only(top: 10),
          child: Obx(() {
            return StatusChange.custom(
              theme: StatusChangeThemeData(
                direction: Axis.horizontal,
                connectorTheme:
                    const ConnectorThemeData(space: 1, thickness: 1),
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (_, index) => StatusChangeTile(
                  mainAxisExtent: Get.width * 0.3,
                  direction: Axis.horizontal,
                  nodePosition: 0,
                  node: TimelineNode(
                    startConnector: index == 0
                        ? null
                        : const SolidLineConnector(
                            direction: Axis.horizontal,
                            color: Colors.grey,
                            thickness: 1,
                          ),
                    endConnector: index < (controller.stages.length - 1)
                        ? const SolidLineConnector(
                            direction: Axis.horizontal,
                            color: Colors.grey,
                            thickness: 1,
                          )
                        : null,
                    indicator: Obx(() {
                      return InkWell(
                        onTap: () => controller.onOppStageIndex(index),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == controller.indexStage.value
                                ? AppColor.primaryColor
                                : AppColor.primaryButtonColor,
                          ),
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: AppTextStyle.regular(
                                color: AppColor.secondTextColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  contents: Obx(() {
                    return InkWell(
                      onTap: () => controller.onOppStageIndex(index),
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text(
                          index == 5 &&
                                  (controller.opportunityInfo.value
                                          ?.isOpportunityClose() ??
                                      false)
                              ? controller.opportunityInfo.value
                                          ?.opportunityStageId ==
                                      6
                                  ? 'crm.opportunity.stage.won'.tr
                                  : 'crm.opportunity.stage.lost'.tr
                              : controller.stages[index].opportunityStageName ??
                                  '',
                          textAlign: TextAlign.center,
                          style: index == controller.indexStage.value
                              ? AppTextStyle.bold(
                                  fontSize: 16, color: AppColor.primaryColor)
                              : AppTextStyle.regular(),
                        ),
                      ),
                    );
                  }),
                ),
                childCount: controller.stages.length,
              ),
            );
          }),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            '${'crm.opportunity.stage'.tr}: ${controller.opportunityInfo.value?.getStageName() ?? ''}',
            style: AppTextStyle.heavy(fontSize: 18),
          ),
        ),
        Visibility(
          visible: AppDataGlobal.userConfig?.menuActions
                  ?.crmServiceSaleManagementSaleOpporturnityInfo?.update !=
              null,
          child: WidgetButton(
            title: 'crm.opportunity.stage.confirm'.tr,
            backgroundButtonColor: AppColor.secondaryColor,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            onPressed: controller.onUpdateOppStage,
          ),
        ),
      ],
    );
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
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
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
}
