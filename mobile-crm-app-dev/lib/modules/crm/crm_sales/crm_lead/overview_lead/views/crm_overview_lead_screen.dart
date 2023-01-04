import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:status_change/status_change.dart';

import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/utils/app_util.dart';
import '../../../../../../shared/utils/date_util.dart';
import '../../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../../shared/widgets/button/widget_icon_button.dart';
import '../../../../../../shared/widgets/crm/widget_lead_name.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/crm_overview_lead_controllers.dart';

class CrmOverviewLeadScreen extends GetView<CrmOverviewLeadController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.lead.detail'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
        actions: [
          WidgetIconButton(
            onPressed: controller.onMenuAction,
            icon: Icons.more_horiz,
            backgroundColor: const Color(0xff54698D),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.back(result: controller.leadDetail.value);
          return false;
        },
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              // _buildLeadActivities(),
              Obx(() {
                return WidgetLeadName(
                  controller.lead.value?.getLeadTitle() ?? '',
                  color: controller.lead.value?.isConvert == 1
                      ? AppColor.secondaryColor
                      : AppColor.primaryTextColor,
                );
              }),
              _buildLeadInfo(),
              Divider(
                height: 7,
                thickness: 7,
                color: AppColor.secondBackgroundColor,
              ),
              const SizedBox(height: 10),
              _buildLeadStages(),
              Divider(
                height: 7,
                thickness: 7,
                color: AppColor.secondBackgroundColor,
              ),
              _buildLeadFunctionCell(
                title: 'crm.lead.details'.tr,
                ontap: controller.onViewLeadDetail,
              ),
              _buildLeadFunctionCell(
                title: 'crm.account.relevant.personal'.tr,
                ontap: controller.onRelevantPersonal,
              ),
              _buildLeadFunctionCell(title: 'crm.lead.document'.tr, ontap: () {}
                  // ontap: controller.onViewDocument
                  ),
              // _buildLeadFunctionCell(
              //     title: 'Ghi chú', ontap: controller.onViewNote),
              _buildLeadFunctionCell(
                  title: 'crm.lead.product.care'.tr,
                  ontap: controller.onViewProductInterest),
              const SizedBox(height: 100),
            ],
          ),
        ),
        SlidingUpPanel(
          maxHeight: Get.height * 0.89,
          minHeight: 90,
          panel: Center(
            child: Column(
              children: [
                Container(
                  width: 45,
                  height: 8,
                  margin: const EdgeInsets.only(top: 20),
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
                const Divider(thickness: 2),
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
                                controller.getActivities(0);
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
              ),
            ),
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
                  const Divider(thickness: 2),
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

  Widget _buildLeadInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: Text('crm.code'.tr),
                ),
                Expanded(
                  flex: 2,
                  child: Text(controller.lead.value?.leadCode ?? ''),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  child: Text('crm.lead.potential.level'.tr),
                ),
                Expanded(
                  flex: 2,
                  child:
                      Text(controller.lead.value?.leadPotentialLevelName ?? ''),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: Text('phone.number'.tr),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: controller.onPhoneAction,
                    child: Text(
                      controller.lead.value?.leadPhone ?? '',
                      style: AppTextStyle.regular(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: Text('crm.lead.email'.tr),
                ),
                Expanded(
                  flex: 2,
                  child: Text(controller.lead.value?.leadEmail ?? ''),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: Text('crm.lead.personal.in.charge'.tr),
                ),
                Expanded(
                    flex: 2,
                    child: Text(
                        controller.lead.value?.getEmplpoyeeFullname() ?? ''))
              ],
            ),
          ],
        );
      }),
    );
  }

  Widget _buildLeadFunctionCell({
    required String title,
    required VoidCallback ontap,
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
        // contentPadding: const EdgeInsets.symmetric(
        //   horizontal: 20,
        //   vertical: 10,
        // ),
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

  Widget _buildLeadStages() {
    return Obx(() {
      return Column(
        children: [
          Container(
            height: 90,
            margin: const EdgeInsets.only(top: 10),
            child: StatusChange.custom(
              theme: StatusChangeThemeData(
                direction: Axis.horizontal,
                connectorTheme:
                    const ConnectorThemeData(space: 1, thickness: 1),
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (_, index) => InkWell(
                  onTap: controller.isDone.value
                      ? null
                      : () => controller.onLeadStageIndex(index),
                  child: StatusChangeTile(
                    mainAxisExtent: Get.width / controller.stages.length,
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
                        return Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == controller.indexLeadStage.value
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
                        );
                      }),
                    ),
                    contents: Obx(() {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text(
                          controller.stages[index].leadStageName ?? '',
                          textAlign: TextAlign.center,
                          style: index == controller.indexLeadStage.value
                              ? AppTextStyle.bold(
                                  fontSize: 16, color: AppColor.primaryColor)
                              : AppTextStyle.regular(),
                        ),
                      );
                    }),
                  ),
                ),
                childCount: controller.stages.length,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              controller.getStageTitle(),
              style: AppTextStyle.heavy(fontSize: 18),
            ),
          ),
          WidgetButton(
            title: 'Xác nhận trạng thái',
            backgroundButtonColor: AppColor.secondaryColor,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            onPressed:
                controller.isDone.value ? null : controller.onUpdateStage,
          ),
        ],
      );
    });
    // return Column(
    //   children: [
    //     Container(
    //       height: 50,
    //       child: SizedBox(
    //         height: 50,
    //         width: 400,
    //         child: CustomPaint(
    //           painter: WidgetCustomPainter(),
    //           child: Row(
    //             children: [
    //               Expanded(
    //                 flex: 2,
    //                 child: InkWell(
    //                   onTap: () {
    //                     printInfo(info: 'crm.lead.not.contacted.yet'.tr);
    //                   },
    //                   child: Center(
    //                     child: Text(
    //                       'crm.lead.not.contacted.yet'.tr,
    //                       textAlign: TextAlign.center,
    //                       style: const TextStyle(color: Colors.white),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Expanded(
    //                 flex: 3,
    //                 child: Center(
    //                     child: Text(
    //                   'crm.lead.contacted'.tr,
    //                   style: const TextStyle(color: Colors.white),
    //                 )),
    //               ),
    //               Expanded(
    //                 flex: 2,
    //                 child: Center(
    //                     child: Text(
    //                   'crm.lead.close'.tr,
    //                   style: const TextStyle(color: Colors.white),
    //                 )),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //     Container(
    //       padding: const EdgeInsets.symmetric(vertical: 10),
    //       child: Text(
    //         'Trạng thái: Đang thực hiện',
    //         style: AppTextStyle.bold(fontSize: 18),
    //       ),
    //     ),
    //     WidgetButton(
    //       title: 'Xác nhận trạng thái',
    //       backgroundButtonColor: AppColor.secondaryColor,
    //       margin: const EdgeInsets.symmetric(horizontal: 20),
    //       onPressed: () {},
    //     ),
    //   ],
    // );
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

  Container _buildItem({
    required Color color,
    required IconData icon,
    required String title,
    required String day,
    required String dapriorityLevely,
    required String responsiblePerson,
    required String desc,
  }) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.regular(fontSize: 20, color: Colors.blue),
              ),
              Text(
                day,
                style: AppTextStyle.regular(),
              ),
              Row(
                children: [
                  Text(
                    'crm.activity.priority.level'.tr,
                    style: AppTextStyle.regular(),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    dapriorityLevely,
                    style: AppTextStyle.regular(),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'crm.activity.responsible'.tr,
                    style: AppTextStyle.regular(),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    responsiblePerson,
                    style: AppTextStyle.regular(),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'crm.desc'.tr,
                    style: AppTextStyle.regular(),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    child: Text(
                      desc,
                      style: AppTextStyle.regular(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
