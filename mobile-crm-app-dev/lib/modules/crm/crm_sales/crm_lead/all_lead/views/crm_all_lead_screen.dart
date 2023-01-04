import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/button/widget_icon_button.dart';
import '../../../../../../shared/widgets/widget_loading.dart';
import '../../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../../../../../../shared/widgets/widget_search_empty.dart';
import '../controllers/crm_all_lead_controllers.dart';
import 'crm_lead_info_cell.dart';

class CrmAllLeadScreen extends GetView<CrmAllLeadController> {
  CrmAllLeadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.lead'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
        actions: [
          WidgetIconButton(
            onPressed: controller.onCreateLead,
            icon: Icons.add,
            backgroundColor: AppColor.addIconButtonColor,
          ),
          WidgetIconButton(
            onPressed: controller.onSearchFilter,
            icon: Icons.filter_alt,
            backgroundColor: const Color(0xff54698D),
          ),
        ],
      ),
      body: SafeArea(
        child: _buildBodyContent(context),
      ),
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    return Column(
      children: [
        _buildSearchBar(),
        Divider(
          height: 2,
          thickness: 2,
          color: Colors.blue.shade400,
        ),
        Expanded(
          child: _buildLeads(),
        ),
      ],
    );
  }

  Container _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: controller.searchController,
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (value) => controller.onSearchAction(value),
        decoration: InputDecoration(
          hintText: 'crm.lead.search'.tr,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26,
          ),
        ),
      ),
    );
  }

  Widget _buildLeads() {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const WidgetCenterLoading();
        } else {
          return WidgetScrollviewRefresher(
            refreshController: controller.refreshController,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            isLoadMore: controller.isMore.value,
            child: controller.leadModels.isEmpty
                ? WidgetSearchEmpty()
                : ListView.separated(
                    itemCount: controller.leadModels.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1),
                    itemBuilder: (context, index) => CrmLeadInfoCell(
                      lead: controller.leadModels[index],
                      onTap: () => controller
                          .onViewLeadDetail(controller.leadModels[index]),
                      onPhoneTap: () => controller.onPhoneAction(
                          controller.leadModels[index].leadPhone ?? ''),
                      onAddAction: () => controller.onAddAction(),
                      onDelete: () =>
                          controller.onDeleteLead(controller.leadModels[index]),
                      onConvert: () => controller
                          .onConvertLead(controller.leadModels[index]),
                    ),
                  ),
          );
        }
      },
    );
  }
}
