import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/product/product.dart';
import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/button/widget_icon_button.dart';
import '../../../../../../../shared/widgets/crm/widget_content_cell.dart';
import '../../../../../../../shared/widgets/crm/widget_lead_name.dart';
import '../controllers/crm_lead_products_controllers.dart';

class CrmLeadProductsScreen extends GetView<CrmLeadProductsController> {
  CrmLeadProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.lead.product.care'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
        actions: [
          if (controller.leadDetail?.isConvert != 1)
            WidgetIconButton(
              onPressed: controller.onAddLeadProduct,
              icon: Icons.add,
              backgroundColor: AppColor.addIconButtonColor,
            ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: _buildMainContent(),
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(children: [
      WidgetLeadName(controller.leadDetail?.getLeadTitle() ?? ''),
      Expanded(
        child: Obx(
          () => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.listProducts.length,
            itemBuilder: (context, index) {
              if (controller.leadDetail?.isConvert == 1) {
                return _buildListItem(item: controller.listProducts[index]);
              }
              return Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  extentRatio: 0.3,
                  children: [
                    SlidableAction(
                      onPressed: (context) => controller.onDeleteProduct(index),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'delete'.tr,
                    ),
                  ],
                ),
                child: _buildListItem(item: controller.listProducts[index]),
              );
            },
          ),
        ),
      ),
    ]);
  }

  Container _buildListItem({required Product? item}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    item?.productName ?? '',
                    style: AppTextStyle.heavy(),
                  ),
                ),
              ],
            ),
          ),
          WidgetContentCell('crm.code'.tr, item?.productCode ?? '')
        ],
      ),
    );
  }
}
