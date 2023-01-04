import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ui_api/crm_api/models/product/product.dart';

import '../../../../../../base/base_controller.dart';

import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/constants/common.dart';

class CrmAllProductController extends BaseController {
  final PagingController<int, Product> pagingController =
      PagingController(firstPageKey: 0);
  final products = RxList(<Product>[]);
  int _totalItems = RxInt(0).value;
  bool _isLastPage = RxBool(false).value;

  @override
  Future<void> onInit() async {
    // ignore: unnecessary_lambdas
    pagingController.addPageRequestListener((pageKey) {
      // _callGetProducts(pageKey);
    });

    await super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  Future<void> onViewDetailProduct(int id) async {
    await Get.toNamed(
      '${CRMRoutes.CRM_PRODUCT_DETAIL}/$id',
    );
  }

  Future<void> onRefresh() async {
    pagingController.refresh();
  }

  // API

  // Future<void> _callGetProducts(int pageKey) async {
  //   try {
  //     final response = await crmUIRepository.searchProduct(
  //       pageKey,
  //       CommonConstants.defaultSize,
  //       CommonConstants.sortId,
  //     );
  //     if (response.success) {
  //       _totalItems = _totalItems + response.data!.total!.toInt();
  //       final products = response.data?.content ?? <Product>[];
  //       this.products.addAll(products);
  //       final isLastPage = products.length < CommonConstants.defaultSize;

  //       if (isLastPage) {
  //         pagingController.appendLastPage(products);
  //         _isLastPage = true;
  //       } else {
  //         final nextPageKey = pageKey + 1;
  //         pagingController.appendPage(products, nextPageKey);
  //       }
  //     } else {
  //       pagingController.error = response.message;
  //     }
  //   } catch (e) {
  //     pagingController.error = e;
  //   }
  // }
}
