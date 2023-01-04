import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../../../../data/app_data_global.dart';
import '../../../../../routes/crm_pages.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/utils/app_util.dart';
import '../../../../../shared/utils/date_util.dart';
import '../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../shared/widgets/crm/widget_slidable.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../controllers/crm_all_activity_controllers.dart';

class CrmAllActivityPage extends GetView<CrmAllActivityController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('crm.activity'.tr,
              style: AppTextStyle.heavy(fontSize: 24, color: Colors.white)),
          actions: [
            Visibility(
              visible: AppDataGlobal.userConfig?.menuActions
                      ?.crmServiceSaleManagementSaleActivity?.createTask !=
                  null,
              child: CrmWidgetButton(
                bgColor: const Color.fromARGB(255, 85, 176, 249),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18,
                ),
                onTap: controller.showCreateModalBottomSheet,
              ),
            ),
            const SizedBox(width: 20),
            Visibility(
              visible: AppDataGlobal.userConfig?.menuActions
                      ?.crmServiceSaleManagementSaleActivity?.viewTask !=
                  null,
              child: CrmWidgetButton(
                bgColor: const Color(0xff54698D),
                icon: const Icon(
                  Icons.filter_alt,
                  color: Colors.white,
                  size: 18,
                ),
                onTap: controller.onViewFilterActivity,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: Obx(
          () => SafeArea(
            top: true,
            child: _buildBodyContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        _buildHeaderContent(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            child: WidgetScrollviewRefresher(
              refreshController: controller.allRefreshController,
              onRefresh: controller.onRefresh,
              onLoading: controller.onLoading,
              isLoadMore: controller.isMore.value,
              child: Obx(
                () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.listActivity.length,
                  itemBuilder: (context, index) {
                    return AppDataGlobal
                                .userConfig
                                ?.menuActions
                                ?.crmServiceSaleManagementSaleActivity
                                ?.changeStateTask !=
                            null
                        ? CrmWidgetSlidable(
                            endActions: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    controller.showChangeStateModalBottomSheet(
                                        controller
                                                .listActivity[index].task?.id ??
                                            0,
                                        controller.listActivity[index].task
                                                ?.nextStates ??
                                            [],
                                        index);
                                  },
                                  backgroundColor: Colors.orange,
                                  foregroundColor: Colors.white,
                                  icon: Icons.compare_arrows,
                                  // label: 'crm.activity.convert'.tr,
                                ),
                                // SlidableAction(
                                //   onPressed: (context) {
                                //     // controller.showCreateModalBottomSheet();
                                //   },
                                //   backgroundColor:
                                //       const Color.fromARGB(255, 8, 162, 228),
                                //   foregroundColor: Colors.white,
                                //   icon: Icons.edit,
                                //   // label: 'crm.update'.tr,
                                // ),
                              ],
                            ),
                            child: _buildRowItemDetail(
                                controller.listActivity[index].task?.name ?? '',
                                AppUtil.getIconActivity(controller
                                        .listActivity[index]
                                        .task
                                        ?.activityTypeId ??
                                    0),
                                AppUtil.getStateText(controller
                                    .listActivity[index].task!.state!),
                                Colors.white,
                                Colors.black87,
                                DateUtil.formatDatetimeToString(controller
                                    .listActivity[index].task!.startDate),
                                DateUtil.formatDatetimeToString(controller
                                    .listActivity[index].task!.deadline),
                                DateUtil.formatDatetimeToString(controller
                                    .listActivity[index].task!.closedOn),
                                controller.getPriorityText(controller
                                        .listActivity[index].task?.priorityId ??
                                    0),
                                controller.getNameReponsiableEmployee(
                                    controller.listActivity[index].involves ?? []),
                                () {
                              Get.toNamed(CRMRoutes.CRM_ACTIVITY_DETAIL,
                                      arguments: controller
                                              .listActivity[index].task!.id ??
                                          0)!
                                  .then((value) {
                                if (value != null && value) {
                                  controller.updateActivity(controller.page,
                                      controller.request, index);
                                }
                              });
                            }),
                          )
                        : _buildRowItemDetail(
                            controller.listActivity[index].task?.name ?? '',
                            AppUtil.getIconActivity(controller.listActivity[index].task?.activityTypeId ??
                                0),
                            AppUtil.getStateText(
                                controller.listActivity[index].task!.state!),
                            Colors.white,
                            Colors.black87,
                            DateUtil.formatDatetimeToString(
                                controller.listActivity[index].task!.startDate),
                            DateUtil.formatDatetimeToString(
                                controller.listActivity[index].task!.deadline),
                            DateUtil.formatDatetimeToString(
                                controller.listActivity[index].task!.closedOn),
                            controller.getPriorityText(
                                controller.listActivity[index].task?.priorityId ??
                                    0),
                            controller.getNameReponsiableEmployee(
                                controller.listActivity[index].involves ?? []), () {
                            Get.toNamed(CRMRoutes.CRM_ACTIVITY_DETAIL,
                                    arguments: controller
                                            .listActivity[index].task!.id ??
                                        0)!
                                .then((value) {
                              if (value != null && value) {
                                controller.updateActivity(
                                    controller.page, controller.request, index);
                              }
                            });
                          });
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Visibility(
          visible: AppDataGlobal.userConfig?.menuActions
                  ?.crmServiceSaleManagementSaleActivity?.viewTask !=
              null,
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              controller: controller.name,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 26,
                ),
                // helperText: "Search your topic",
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: 'crm.activity.search'.tr,
                labelStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                isDense: true,
              ),
              onFieldSubmitted: (value) => controller.onSearchName(value),
            ),
          ),
        ),
        Visibility(
          visible: AppDataGlobal.userConfig?.menuActions
                  ?.crmServiceSaleManagementSaleActivity?.viewTask !=
              null,
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.blue.shade400,
                  width: 2,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRowItemDetail(
    String name,
    String icon,
    String status,
    Color trangThaiBgColor,
    Color trangThaiTextColor,
    String dayStart,
    String daySuccess,
    String dayEnd,
    String priorityLevel,
    String responsible,
    VoidCallback viewDetail,
  ) {
    return InkWell(
      onTap: viewDetail,
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 10, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  FCoreImage(icon, width: 35, height: 35),
                  const SizedBox(width: 5),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: AppTextStyle.bold(fontSize: 18),
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: Text('crm.activity.status'.tr)),
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      height: 25,
                      decoration: BoxDecoration(
                          color: trangThaiBgColor,
                          border: Border.all(
                            width: 1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                      child: Text(
                        status,
                        style: TextStyle(color: trangThaiTextColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: Text('crm.activity.begin.day'.tr)),
                  Expanded(flex: 2, child: Text(dayStart))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: Text('crm.activity.completion'.tr)),
                  Expanded(flex: 2, child: Text(daySuccess))
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: Text('crm.activity.success.day'.tr)),
                  Expanded(flex: 2, child: Text(dayEnd))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1, child: Text('crm.activity.priority.level'.tr)),
                  Expanded(flex: 2, child: Text(priorityLevel))
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: Text('crm.activity.responsible'.tr)),
                  Expanded(flex: 2, child: Text(responsible))
                ],
              ),
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
