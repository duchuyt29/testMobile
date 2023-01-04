import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity_product_item.dart';

import '../../../../../../data/app_data_global.dart';
import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../shared/widgets/crm/widget_slidable.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/opportunity_product_controller.dart';

class OpportunityProductScreen extends GetView<OpportunityProductController> {
  const OpportunityProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.product.title'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
        actions: controller.opportunityInfo.value.isOpportunityClose()
            ? []
            : [
                Obx(
                  () => controller.listProduct.isNotEmpty ||
                          controller.isHasPrice.value
                      ? Visibility(
                          visible: AppDataGlobal
                                  .userConfig
                                  ?.menuActions
                                  ?.crmServiceSaleManagementSaleOpporturnityItem
                                  ?.update !=
                              null,
                          child: CrmWidgetButton(
                            bgColor: Colors.greenAccent,
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 18,
                            ),
                            onTap: () {
                              controller.onConfirmChangePrice();
                            },
                          ),
                        )
                      : Container(),
                ),
                const SizedBox(width: 10),
                Obx(
                  () => controller.listProduct.isNotEmpty ||
                          controller.isHasPrice.value
                      ? Visibility(
                          visible: AppDataGlobal
                                  .userConfig
                                  ?.menuActions
                                  ?.crmServiceSaleManagementSaleOpporturnityItem
                                  ?.create !=
                              null,
                          child: CrmWidgetButton(
                            bgColor: Colors.blue,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            ),
                            onTap: () {
                              controller.onAddProduct();
                            },
                          ),
                        )
                      : Visibility(
                          visible: AppDataGlobal
                                  .userConfig
                                  ?.menuActions
                                  ?.crmServiceSaleManagementSaleOpporturnityItem
                                  ?.create !=
                              null,
                          child: CrmWidgetButton(
                            bgColor: Colors.blue,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            ),
                            onTap: () {
                              controller.onViewSelectPrice();
                            },
                          ),
                        ),
                ),
                const SizedBox(width: 10),
              ],
      ),
      body: SafeArea(
        top: false,
        child: Obx(
          () => SingleChildScrollView(child: _buildBodyContent()),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(children: [
      Container(
        color: const Color.fromARGB(255, 245, 244, 244),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        margin: const EdgeInsets.only(bottom: 5),
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
                'crm.opportunity'.tr,
                style: AppTextStyle.heavy(fontSize: 15),
              ),
              Text(
                '${controller.opportunityInfo.value.opportunityName ?? ''} - ${controller.opportunityInfo.value.opportunityCode ?? ''}',
                style: AppTextStyle.bold(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      controller.listProduct.isNotEmpty
          ? ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.listProduct.length,
              itemBuilder: (context, index) {
                return _buildListItem(
                    productItem: controller.listProduct[index]);
              })
          : const SizedBox.shrink()
    ]);
  }

  Widget _buildListItem({
    required OpportunityProductItem productItem,
  }) {
    return CrmWidgetSlidable(
      endActions: ActionPane(
        motion: const ScrollMotion(),
        children: [
          Visibility(
            visible: AppDataGlobal.userConfig?.menuActions
                    ?.crmServiceSaleManagementSaleOpporturnityItem?.update !=
                null,
            child: SlidableAction(
              onPressed: (context) {
                controller.opportunityInfo.value.isOpportunityClose()
                    ? null
                    : controller.onEditProduct(productItem);
              },
              backgroundColor:
                  controller.opportunityInfo.value.isOpportunityClose()
                      ? Colors.grey
                      : Colors.orangeAccent,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Chỉnh sửa',
            ),
          ),
          Visibility(
            visible: AppDataGlobal.userConfig?.menuActions
                    ?.crmServiceSaleManagementSaleOpporturnityItem?.delete !=
                null,
            child: SlidableAction(
              onPressed: (context) {
                controller.opportunityInfo.value.isOpportunityClose()
                    ? null
                    : controller.onDeleteProduct(productItem.id ?? 0);
              },
              backgroundColor:
                  controller.opportunityInfo.value.isOpportunityClose()
                      ? Colors.grey
                      : Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Xóa',
            ),
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        productItem.productName ?? '',
                        style: AppTextStyle.heavy(),
                      )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        productItem.productCode ?? '',
                        style: AppTextStyle.heavy(),
                      ))
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text('${'crm.opportunity.product.quantity'.tr}:')),
                  Expanded(
                      flex: 2,
                      child:
                          Text(productItem.quantity?.toStringAsFixed(0) ?? ''))
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text('${'crm.opportunity.product.price'.tr}:')),
                  Expanded(
                      flex: 2,
                      child: Text(
                        productItem.salePrice?.toStringAsFixed(0) ?? '',
                        style: TextStyle(
                            color: productItem.isSalePriceSmallListPrice()
                                ? Colors.orangeAccent
                                : Colors.black),
                      ))
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1, child: Text('${'crm.opportunity.amount'.tr}:')),
                  Expanded(flex: 2, child: Text(productItem.getTotalAmount()))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
