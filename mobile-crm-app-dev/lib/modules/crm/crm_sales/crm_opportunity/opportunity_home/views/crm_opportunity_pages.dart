import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity.dart';

import '../../../../../../data/app_data_global.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/utils/date_util.dart';
import '../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../shared/widgets/crm/widget_slidable.dart';
import '../../../../../../shared/widgets/crm/widget_text_form_field.dart';
import '../../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../controllers/crm_opportunity_controllers.dart';

class CrmOpportunityPage extends GetView<CrmOpportunityController> {
  CrmOpportunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.opportunity'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
        actions: [
          Visibility(
            visible: AppDataGlobal.userConfig?.menuActions
                    ?.crmServiceSaleManagementSaleOpporturnity?.create !=
                null,
            child: CrmWidgetButton(
              bgColor: const Color.fromARGB(255, 85, 176, 249),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
              onTap: controller.onViewAddOpportunity,
            ),
          ),
          const SizedBox(width: 20),
          Visibility(
            visible: AppDataGlobal.userConfig?.menuActions
                    ?.crmServiceSaleManagementSaleOpporturnity?.view !=
                null,
            child: CrmWidgetButton(
              bgColor: const Color(0xff54698D),
              icon: const Icon(
                Icons.filter_alt,
                color: Colors.white,
                size: 18,
              ),
              onTap: controller.onViewFilter,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        top: false,
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: _buildBodyContent()),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [_buildHeaderContent(), _buildMainContent()],
    );
  }

  Widget _buildHeaderContent() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.blue.shade400,
            width: 2,
          ),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 10),
      child: CrmWidgetTextFormField(
        label: 'crm.opportunity.search'.tr,
        controller: controller.searchController,
        onComplete: () {
          controller.onSearchAction(controller.searchController.text);
        },
      ),
    );
  }

  Widget _buildMainContent() {
    return Expanded(
      child: Obx(
        () {
          return WidgetScrollviewRefresher(
            refreshController: controller.refreshController,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            isLoadMore: controller.isMore.value,
            child: controller.opportunities.isEmpty
                ? Container()
                : ListView.separated(
                    itemCount: controller.opportunities.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1),
                    itemBuilder: (context, index) =>
                        _buildListItem(item: controller.opportunities[index]),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildListItem({
    required Opportunity item,
  }) {
    return CrmWidgetSlidable(
      endActions: ActionPane(
        motion: const ScrollMotion(),
        children: [
          item.isOpportunityClose()
              ? const SizedBox.shrink()
              : Visibility(
                  visible: AppDataGlobal.userConfig?.menuActions
                          ?.crmServiceSaleManagementSaleOpporturnity?.delete !=
                      null,
                  child: SlidableAction(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    onPressed: (context) =>
                        controller.showDeleteModalBottomSheet(item.id ?? 0),
                  ),
                ),
          Visibility(
            visible: AppDataGlobal.userConfig?.menuActions
                    ?.crmServiceSaleManagementSaleActivity?.createTask !=
                null,
            child: SlidableAction(
              onPressed: (context) =>
                  controller.showCreateActivityModalBottomSheet(item),
              backgroundColor: Colors.orangeAccent,
              foregroundColor: Colors.white,
              icon: Icons.phone_in_talk_rounded,
            ),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          controller.onViewOpportunityDetail(opportunity: item);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.opportunityName ?? '',
                style: AppTextStyle.heavy(),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Text('crm.code'.tr)),
                    Expanded(flex: 2, child: Text(item.opportunityCode ?? ''))
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Text('crm.opportunity.stage'.tr)),
                    Expanded(flex: 2, child: Text(item.getStageName()))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Text('crm.close.date'.tr)),
                    Expanded(
                        flex: 2,
                        child: Text(
                            DateUtil.formatDatetimeToString(item.closeDate)))
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Text('crm.opportunity.amount'.tr)),
                    Expanded(flex: 2, child: Text(item.getAmount()))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
