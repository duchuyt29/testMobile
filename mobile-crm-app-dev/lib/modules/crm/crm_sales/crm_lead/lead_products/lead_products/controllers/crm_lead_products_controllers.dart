import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/lead/lead_detail.dart';
import 'package:ui_api/crm_api/models/product/product.dart';

import '../../../../../../../base/base_controller.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../../../shared/utils/dialog_util.dart';

class CrmLeadProductsController extends BaseController {
  LeadDetail? leadDetail;

  final listProducts = RxList<Product>();

  /* Init */

  CrmLeadProductsController() {
    leadDetail = Get.arguments as LeadDetail?;
    _loadData();
  }

  /* Action */

  Future<void> onAddLeadProduct() async {
    await Get.toNamed(CRMRoutes.CRM_LEAD_PRODUCTS_EDIT,
            arguments: listProducts.toList())
        ?.then((value) async {
      if (value != null && value is List<Product>) {
        listProducts.value = value;
        await _updateLead();
      }
    });
  }

  Future<void> onDeleteProduct(int index) async {
    await BottomSheetUtil.createConfirmBottomSheet(
      title: 'Bạn có chắc chắn muốn xóa sản phẩm quan tâm này?',
      message: 'Sản phẩm quan tâm sẽ bị xóa vĩnh viễn',
      confirmTitle: 'Xóa',
      onConfirm: () async {
        listProducts.removeAt(index);
        await _updateLead();
      },
    );
  }

  /* Call API */

  Future<void> _loadData() async {
    await EasyLoading.show();
    await crmUIRepository
        .getLeadProducts(leadDetail?.id ?? 0)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        listProducts.value = response.data ?? [];
      } else {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
          onPressed: Get.back,
        );
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
        onPressed: Get.back,
      );
    });
  }

  Future<void> _updateLead() async {
    await EasyLoading.show();
    leadDetail?.leadProducts = listProducts.toList();
    await crmUIRepository
        .updateLead(leadDetail?.id ?? 0, leadDetail!)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        await EasyLoading.showToast('crm.save.completed'.tr);
      } else {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }
}
