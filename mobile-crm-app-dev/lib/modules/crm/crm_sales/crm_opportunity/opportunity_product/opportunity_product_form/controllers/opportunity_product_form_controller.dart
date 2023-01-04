import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/crm_master_data/price.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity_info.dart';
import 'package:ui_api/crm_api/models/opportunity/opportunity_product_item.dart';
import 'package:ui_api/crm_api/models/product/product_price.dart';
import 'package:ui_api/crm_api/request/opportunity/opportunity_item_request.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class OpportunityProductFormController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();
  final opportunityInfo = Rx<OpportunityInfo>(OpportunityInfo());
  final Rx<String> type = Rx<String>('');
  final opportunityPrice = Rxn<Price>();
  final listProduct = Rxn<List<ProductPrice>>();
  final opportunityItem = Rx<OpportunityItem>(
    OpportunityItem(),
  );
  final productInfo = Rx<OpportunityProductItem>(OpportunityProductItem());
  final opportunityProduct = RxList<OpportunityProductItem>([]);
  final opportunityItemsRequest =
      Rx<OpportunityItemsRequest>(OpportunityItemsRequest(items: []));

  final quantityTextController = TextEditingController();
  final amountTextController = TextEditingController();

  OpportunityProductFormController() {
    if (Get.arguments != null) {
      opportunityInfo.value = Get.arguments['opportunityInfo'];
      type.value = Get.arguments['type'];
      opportunityPrice.value = Get.arguments['priceInfo'];
      if (type.value == 'edit') {
        productInfo.value = Get.arguments['productInfo'];
        quantityTextController.text =
            productInfo.value.quantity?.toStringAsFixed(0) ?? '';
        amountTextController.text =
            productInfo.value.salePrice?.toStringAsFixed(0) ?? '';
      }
    }
  }

  @override
  Future<void> onInit() async {
    await super.onInit();
    await _loadProducts();
    if (type.value == 'edit') {
      fbKey.currentState!.fields['listPrice']!.didChange(
        listProduct.value!
            .firstWhere(
              (element) => element.productId == productInfo.value.productId,
            )
            .listPrice
            ?.toStringAsFixed(0),
      );
      opportunityItem.value.productId = productInfo.value.productId;
      opportunityItem.value.productPriceId = productInfo.value.productPriceId;
      opportunityItem.value.listPrice = double.parse(
        fbKey.currentState!.fields['listPrice']!.value,
      );

      onCalculateTotalAmount();
    }
    if (Get.arguments['opportunityProduct'] != null) {
      opportunityProduct.value = Get.arguments['opportunityProduct'];
      opportunityProduct.forEach((element) {
        listProduct.value!.removeWhere(
          (item) => item.productId == element.productId,
        );
      });
    }
  }

  // Actions

  Future<void> onViewProductPrice() async {
    await Get.toNamed(CRMRoutes.CRM_PRODUCT_PRICE_SELECT,
            arguments: listProduct.value)!
        .then((value) {
      if (value != null) {
        final productPrice = value as ProductPrice;
        fbKey.currentState!.fields['productId']!
            .didChange(productPrice.productName);
        fbKey.currentState!.fields['listPrice']
            ?.didChange(productPrice.listPrice?.toStringAsFixed(0));
        opportunityItem.value.productId = productPrice.productId;
        opportunityItem.value.listPrice = productPrice.listPrice;
        opportunityItem.value.productPriceId = productPrice.id;
      }
    });
  }

  Future<void> onSubmitted() async {
    if (fbKey.currentState!.saveAndValidate()) {
      final data = fbKey.currentState!.value;
      opportunityItem.value.opportunityId = opportunityInfo.value.id;
      opportunityItem.value.quantity = int.parse(data['quantity'] ?? '0');
      opportunityItem.value.salePrice = int.parse(data['amount'] ?? '0');
      opportunityItem.value.status = 1;
      opportunityItemsRequest.value.items?.add(opportunityItem.value);
      if (type == 'edit') {
        await _updateProduct();
      } else {
        await _createProduct();
      }
    }
  }

  void onCalculateTotalAmount() {
    final quantity = quantityTextController.text;
    final amount = amountTextController.text;
    if (quantity.isNotEmpty && amount.isNotEmpty) {
      final totalAmount = int.parse(quantity) * int.parse(amount);
      fbKey.currentState!.fields['totalAmount']!
          .didChange(totalAmount.toStringAsFixed(0));
    }
  }

  // API CALL

  Future<void> _loadProducts() async {
    await EasyLoading.show();
    await crmUIRepository
        .getProductsByPriceId(opportunityInfo.value.priceId ?? 0,
            opportunityInfo.value.currencyExchangeRateId ?? 0)
        .then((response) {
      if (response.success) {
        listProduct.value = response.data ?? [];
      }
      EasyLoading.dismiss();
    }).catchError((error) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(message: error.toString());
    });
  }

  Future<void> _createProduct() async {
    await EasyLoading.show();
    await crmUIRepository
        .createProductInOpportunity(
            opportunityInfo.value.id ?? 0, opportunityItemsRequest.value)
        .then((response) {
      if (response.success) {
        EasyLoading.dismiss();
        Get.back(result: true);
      }
      EasyLoading.dismiss();
    }).catchError((error) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(message: error.toString());
    });
  }

  Future<void> _updateProduct() async {
    await EasyLoading.show();
    await crmUIRepository
        .updateProductInOpportunity(
            productInfo.value.id ?? 0, opportunityItemsRequest.value.items![0])
        .then((response) {
      if (response.success) {
        EasyLoading.dismiss();
        Get.back(result: true);
      }
      EasyLoading.dismiss();
    }).catchError((error) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(message: error.toString());
    });
  }
}
