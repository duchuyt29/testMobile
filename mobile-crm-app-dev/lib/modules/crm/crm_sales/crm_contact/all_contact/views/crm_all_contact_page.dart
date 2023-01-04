import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/contact/contact.dart';

import '../../../../../../data/app_data_global.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../shared/widgets/crm/widget_slidable.dart';
import '../../../../../../shared/widgets/crm/widget_text_form_field.dart';
import '../../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../controllers/crm_all_contact_controllers.dart';

class CrmAllContactPage extends GetView<CrmAllContactController> {
  CrmAllContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('crm.contact'.tr,
            style: AppTextStyle.heavy(fontSize: 20, color: Colors.white)),
        actions: [
          Visibility(
            visible: AppDataGlobal
                    .userConfig?.menuActions?.crmMasterDataContact?.view !=
                null,
            child: CrmWidgetButton(
              bgColor: const Color.fromARGB(255, 85, 176, 249),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
              onTap: controller.onCreateNew,
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
            onTap: controller.onFilter,
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
        label: 'crm.contact.search'.tr,
        controller: controller.keyword,
        onComplete: controller.onSearch,
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
              itemCount: controller.listData.length,
              itemBuilder: (context, index) {
                return CrmWidgetSlidable(
                  endActions: ActionPane(
                    extentRatio: 0.5,
                    motion: const ScrollMotion(),
                    children: [
                      // SlidableAction(
                      //   onPressed: (context) {},
                      //   backgroundColor: Colors.blueAccent.shade200,
                      //   foregroundColor: Colors.white,
                      //   icon: Icons.phone_in_talk_rounded,
                      // ),
                      Visibility(
                        visible: AppDataGlobal.userConfig?.menuActions
                                ?.crmMasterDataContact?.delete !=
                            null,
                        child: SlidableAction(
                          onPressed: (context) {
                            controller.onDeleteContact(
                                controller.listData[index].id ?? 0);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                        ),
                      ),
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        icon: Icons.lock_open,
                      ),
                    ],
                  ),
                  child: _buildItems(item: controller.listData[index]),
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
    required Contact item,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
          controller.onViewDetail(item);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                item.contactNameInList ?? '',
                style: AppTextStyle.heavy(),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(flex: 1, child: Text('Mã: ')),
                  Expanded(flex: 2, child: Text(item.contactNumber ?? ''))
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(flex: 1, child: Text('Chức vụ: ')),
                  Expanded(
                      flex: 2,
                      child: Text(item.contactTitle ?? '',
                          style: AppTextStyle.regular()))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: Text('phone.number'.tr)),
                  Expanded(
                      flex: 2,
                      child: Text(item.contactPhone ?? '',
                          style: AppTextStyle.regular(color: Colors.blue)))
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(flex: 1, child: Text('Email: ')),
                  Expanded(
                    flex: 2,
                    child: Text(item.contactEmail ?? ''),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
