import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';
import '../../../../../../data/app_data_global.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../shared/widgets/crm/widget_content_cell.dart';
import '../../../../../../shared/widgets/crm/widget_phone_action.dart';
import '../../../../../../shared/widgets/crm/widget_slidable.dart';
import '../../../../../../shared/widgets/crm/widget_text_form_field.dart';
import '../../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../controllers/crm_all_account_controllers.dart';

class CrmAllAccountPage extends GetView<CrmAllAccountController> {
  CrmAllAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('crm.customer'.tr,
            style: AppTextStyle.heavy(fontSize: 20, color: Colors.white)),
        actions: [
          Visibility(
            visible: AppDataGlobal
                    .userConfig?.menuActions?.crmMasterDataAccount?.create !=
                null,
            child: CrmWidgetButton(
              bgColor: const Color.fromARGB(255, 85, 176, 249),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
              onTap: controller.onViewCreateOption,
            ),
          ),
          const SizedBox(width: 20),
          CrmWidgetButton(
            bgColor: const Color(0xff54698D),
            icon: const Icon(
              Icons.filter_alt,
              color: Colors.white,
              size: 18,
            ),
            onTap: () {
              controller.onFilter();
            },
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
          child: _buildBodyContent(),
        ),
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
        label: 'crm.account.search'.tr,
        controller: controller.keyword,
        onComplete: controller.onSearchAccount,
      ),
    );
  }

  Widget _buildMainContent() {
    return Expanded(
      child: Obx(() => WidgetScrollviewRefresher(
            refreshController: controller.allRefreshController,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            isLoadMore: controller.isMore.value,
            child: ListView.separated(
              controller: controller.scrollController,
              itemCount: controller.listAccounts.length,
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
                                ?.crmServiceSaleManagementSaleActivity
                                ?.createTask !=
                            null,
                        child: SlidableAction(
                          onPressed: (context) {
                            controller.showCreateModalBottomSheet(context);
                          },
                          backgroundColor: Colors.orangeAccent,
                          foregroundColor: Colors.white,
                          icon: Icons.phone_in_talk_rounded,
                        ),
                      ),
                      // SlidableAction(
                      //   onPressed: (context) {
                      //     controller.onDeleteAccount(
                      //         controller.listAccounts[index].id ?? 0);
                      //   },
                      //   backgroundColor: Colors.red,
                      //   foregroundColor: Colors.white,
                      //   icon: Icons.delete,
                      // ),
                      Visibility(
                        visible: AppDataGlobal.userConfig?.menuActions
                                ?.crmMasterDataAccount?.update !=
                            null,
                        child: SlidableAction(
                          onPressed: (context) {
                            controller
                                .onLockAccount(controller.listAccounts[index]);
                          },
                          backgroundColor:
                              controller.listAccounts[index].isActive == 1
                                  ? Colors.green
                                  : Colors.redAccent,
                          foregroundColor: Colors.white,
                          icon: controller.listAccounts[index].isActive == 1
                              ? Icons.lock_open
                              : Icons.lock_outlined,
                        ),
                      ),
                    ],
                  ),
                  child: _buildItems(item: controller.listAccounts[index]),
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 1,
                thickness: 1,
                color: AppColor.dividerColor,
              ),
            ),
          )),
    );
  }

  Container _buildItems({
    required Account item,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          if (AppDataGlobal
                  .userConfig?.menuActions?.crmMasterDataAccount?.view !=
              null) {
            controller.onViewAccountDetail(item);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                item.accountName ?? '',
                style: AppTextStyle.heavy(),
              ),
            ),
            WidgetContentCell('Mã', item.accountCode ?? ''),
            CrmWidgetPhoneAction(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              title: item.accountPhone ?? '',
              onTap: () {
                controller.onPhoneAction(item);
              },
            ),
            WidgetContentCell('Địa chỉ', item.accountBillingProvinceName ?? ''),
            WidgetContentCell('Nhân sự phụ trách', item.getOwnerEmployeeName()),
            WidgetContentCell('Loại khách hàng', item.accountTypeName ?? ''),
          ],
        ),
      ),
    );
  }
}
