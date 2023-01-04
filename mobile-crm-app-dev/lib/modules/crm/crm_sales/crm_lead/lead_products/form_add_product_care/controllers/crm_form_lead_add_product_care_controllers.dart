import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/lead/lead_detail.dart';
import 'package:ui_api/crm_api/models/product/product.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/constants/arguments.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class CrmCreateFormLeadAddProductCareController extends BaseController {
  final fbKey = GlobalKey<FormBuilderState>();
  LeadDetail? leadDetail;
  List<Product> listProducts = [];
  final product = Product();

  RxString name = ''.obs;
  int? productId;

  CrmCreateFormLeadAddProductCareController() {
    leadDetail = Get.arguments;
  }

  Future<void> loadEmployee() async {
    try {
      await Get.toNamed(CRMRoutes.CRM_LEAD_ALL_PRODUCT_FILTER, arguments: {
        IS_MULTI_SELECT: false,
        PRODUCT_LIST: leadDetail?.leadProducts
      })?.then((value) {
        if (value != null && value is Product) {
          name.value = value.productName ?? '';
          productId = value.id;
        }
      });
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  void onCancel() => Get.back();

  Future<void> onSubmitted() async {
    if (fbKey.currentState!.saveAndValidate()) {
      if (leadDetail?.leadProducts != null) {
        leadDetail?.leadProducts
            ?.add(Product(productId: productId, id: productId, status: 1));
      } else {
        listProducts
            .add(Product(productId: productId, id: productId, status: 1));
        leadDetail?.leadProducts = listProducts;
      }
      await _updateLead();
    }
  }

  Future<void> _updateLead() async {
    await crmUIRepository
        .updateLead(leadDetail?.id ?? 0, leadDetail!)
        .then((response) async {
      if (response.success) {
        Get.back(result: true);
      } else {
        await EasyLoading.dismiss();
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
          onPressed: Get.back,
        );
      }
    }).catchError((onError) {
      EasyLoading.dismiss();

      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }
}
