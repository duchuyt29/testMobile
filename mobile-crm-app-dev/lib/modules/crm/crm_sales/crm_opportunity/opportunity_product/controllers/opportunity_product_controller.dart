import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/price.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity_info.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity_product_item.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/arguments.dart';
import '../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../shared/utils/dialog_util.dart';
import '../views/widgets/create_opp_product_modal_sheet.dart';

class OpportunityProductController extends BaseController {
  final opportunityInfo = Rx<OpportunityInfo>(OpportunityInfo());
  final listProduct = RxList<OpportunityProductItem>([]);
  final listPrice = RxList<Price>([]);
  final opportunityPrice = Rx<Price>(Price());
  OpportunityProductController() {
    opportunityInfo.value = Get.arguments;
    opportunityInfo.value.isOpportunityHasPrice()
        ? isHasPrice.value = true
        : isHasPrice.value = false;
  }
  final isHasPrice = RxBool(false);
  final isChangePrice = RxBool(false);

  @override
  Future<void> onInit() async {
    await super.onInit();
    await _loadData();
    listPrice.value = crmMasterData?.listPrice ?? [];
    opportunityPrice.value = listPrice
        .firstWhere((element) => element.id == opportunityInfo.value.priceId);
    if (opportunityInfo.value.isOpportunityHasPrice()) {
      opportunityPrice.value.id = opportunityInfo.value.priceId;
    }
  }

  // Actions
  Future<void> showCreateModalBottomSheet() async {
    await Get.bottomSheet(CreateOppProductModalBottomSheet(),
        isScrollControlled: true,
        backgroundColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )));
  }

  Future<void> onViewSelectPrice() async {
    await Get.toNamed(CRMRoutes.CRM_PRICE, arguments: {
      IS_MULTI_SELECT: false,
      'listSelect': [],
      'type': 'add',
    })?.then((value) {
      if (value != null) {
        final Price? price = value;
        if (price != null) {
          opportunityPrice.value = price;
          isHasPrice.value = true;
          opportunityInfo.value.priceId = price.id;
          selectPriceForOppProduct(price.id ?? 0);
        }
      }
    });
  }

  Future<void> onConfirmChangePrice() async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'crm.opportunity.pricebook.edit'.tr,
      message: 'crm.opportunity.pricebook.edit.message'.tr,
      confirmTitle: 'crm.delete'.tr,
      onConfirm: () {
        onViewChangePrice();
      },
    );
  }

  Future<void> onViewChangePrice() async {
    // await Get.di
    await Get.toNamed(CRMRoutes.CRM_PRICE, arguments: {
      IS_MULTI_SELECT: false,
      'listSelect': [],
      'type': 'edit',
    })?.then((value) {
      if (value != null) {
        final Price? price = value;
        if (price != null) {
          opportunityPrice.value = price;
          isHasPrice.value = true;
          opportunityInfo.value.priceId = price.id;
          changePriceForOppProduct(price.id ?? 0);
        }
      }
    });
  }

  Future<void> onAddProduct() async {
    await Get.toNamed(CRMRoutes.CRM_OPPORTUNITY_PRODUCT_FORM, arguments: {
      'type': 'add',
      'opportunityInfo': opportunityInfo.value,
      'priceInfo': opportunityPrice.value,
      'opportunityProduct': listProduct.isNotEmpty ? listProduct : null,
    })?.then((value) => {
          if (value != null)
            {
              listProduct.clear(),
              _loadData(),
            }
        });
  }

  Future<void> onEditProduct(
    OpportunityProductItem product,
  ) async {
    await Get.toNamed(CRMRoutes.CRM_OPPORTUNITY_PRODUCT_FORM, arguments: {
      'type': 'edit',
      'opportunityInfo': opportunityInfo.value,
      'priceInfo': opportunityPrice.value,
      'productInfo': product,
      'opportunityProduct': listProduct.isNotEmpty ? listProduct : null,
    })?.then((value) => {
          if (value != null)
            {
              listProduct.clear(),
              _loadData(),
            }
        });
  }

  Future<void> onDeleteProduct(int id) async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'crm.opportunity.delete.product'.tr,
      message: 'crm.opportunity.delete.product.confirm'.tr,
      confirmTitle: 'post.detail.delete'.tr,
      onConfirm: () {
        deleteProduct(id);
      },
    );
  }

  // API CALL

  Future<void> _loadData() async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .getProductsByOpportunityId(opportunityInfo.value.id!)
          .then((response) async {
        if (response.success && response.data != null) {
          listProduct.addAll(response.data ?? []);

          await EasyLoading.dismiss();
        } else {
          await EasyLoading.dismiss();
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: 'notify.error'.tr);
        }
      }).catchError((onError) {
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      });
    } catch (e) {
      await EasyLoading.dismiss();
    } finally {
      await EasyLoading.dismiss();
    }
  }

  Future<void> selectPriceForOppProduct(
    int priceId,
  ) async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .selectPriceForOpportunity(opportunityInfo.value.id ?? 0, priceId)
          .then((response) async {
        if (response.success) {
          isHasPrice.value = true;
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: 'crm.save.completed'.tr);
        }
        await EasyLoading.dismiss();
      }).catchError((onError) {
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> changePriceForOppProduct(
    int priceId,
  ) async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .updatePriceForOpportunity(opportunityInfo.value.id ?? 0, priceId)
          .then((response) async {
        if (response.success) {
          isChangePrice.value = !isChangePrice.value;
          listProduct.clear();
          await _loadData();
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: 'crm.save.completed'.tr);
        }
        await EasyLoading.dismiss();
      }).catchError((onError) {
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      await EasyLoading.show();
      await crmUIRepository
          .deleteProductInOpportunity(id)
          .then((response) async {
        if (response.success) {
          listProduct.removeWhere((element) => element.id == id);
          // await _loadData();
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: 'crm.save.completed'.tr);
        }
        await EasyLoading.dismiss();
      }).catchError((onError) {
        EasyLoading.dismiss();
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: 'notify.error'.tr);
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }
}
