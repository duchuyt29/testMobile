import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/price.dart';

import '../../../../../../data/app_data_global.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../controllers/crm_price_controller.dart';

class CrmPricePage extends GetView<CrmPriceController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(
              controller.type.value == 'edit'
                  ? 'crm.select.price.book.edit'.tr
                  : 'crm.select.price.book'.tr,
              style: AppTextStyle.regular(fontSize: 20, color: Colors.white),
            ),
            actions: [
              Visibility(
                visible: controller.isMultiSelect.value,
                child: InkWell(
                  onTap: () {
                    final temp = List<Price>.empty(growable: true);
                    for (var i = 0; i < controller.listSelect.length; i++) {
                      temp.add(AppDataGlobal
                          .crmMasterData!.listPrice![controller.listSelect[i]]);
                    }
                    controller.onChangeList(temp);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    height: 20,
                    child: Text(
                      'Chọn',
                      style: AppTextStyle.heavy(
                          color: AppColor.primaryBackgroundColor),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: SafeArea(
            top: false,
            child: _buildBodyContent(),
          ),
        ));
  }

  Widget _buildBodyContent() {
    return Container(
      child: ListView.builder(
        itemCount: AppDataGlobal.crmMasterData!.listPrice!.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              if (controller.isMultiSelect.value) {
                if (!controller.listSelect.any((element) => element == i)) {
                  controller.listSelect.add(i);
                } else {
                  controller.listSelect
                      .removeAt(controller.listSelect.indexOf(i));
                }
              } else {
                controller.onChange(AppDataGlobal.crmMasterData!.listPrice![i]);
              }
            },
            child: Obx(
              () => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: (controller.listSelect.any((element) => element == i))
                      ? AppColor.thirdBackgroundColor
                      : AppColor.primaryBackgroundColor,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Visibility(
                      visible: controller.isMultiSelect.value,
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Icon((controller.listSelect
                                .any((element) => element == i))
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_outlined),
                      ),
                    ),
                    Text(AppDataGlobal.crmMasterData!.listPrice![i].priceName ??
                        ''),
                    // controller.provinces.value?[i].id !=
                    //         controller.initialValue
                    //     ? Container()
                    //     : Padding(
                    //         padding: const EdgeInsets.only(right: 10),
                    //         child: Icon(
                    //           Icons.check,
                    //           color: Colors.red.shade700,
                    //         ),
                    //       ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
