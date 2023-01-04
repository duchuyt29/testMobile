import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ui_api/crm_api/models/product/product.dart';

import '../../../../../../resource/assets_constant/images_constants.dart';

import '../../../../../../routes/crm_pages.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/flutter_back_widget.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/crm_all_product_controller.dart';

class CrmAllProductPage extends GetView<CrmAllProductController> {
  CrmAllProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        top: false,
        child: _buildBodyContent(context),
      ),
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    return Column(
      children: [
        _buildHeaderContent(context),
        _buildActionContent(),
        _buildMainContent()
      ],
    );
  }

  Widget _buildHeaderContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.blue.shade400,
            width: 3,
          ),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildTopBtnsContent(context),
          _buildSearchBar(),
        ],
      ),
    );
  }

  Row _buildTopBtnsContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackPageWidget(
          backText: 'crm.come.back'.tr,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        Container(
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.backup_rounded,
                  size: 30,
                  color: Colors.blue.shade700,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star,
                  size: 30,
                  color: Colors.blue.shade700,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.blue.shade700,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  size: 30,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26,
          ),
          // helperText: "Search your topic",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: 'crm.price.search'.tr,
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          isDense: true,
        ),
      ),
    );
  }

  Widget _buildActionContent() {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(CRMRoutes.CRM_PRODUCT_ADD);
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              Text('crm.create.new'.tr),
            ],
          ),
          const SizedBox(
            width: 130,
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Expanded(
      child: Column(children: [
        ListTile(
          leading: FCoreImage(
            ImageConstants.crmProduct,
            width: 50,
            height: 50,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          title: Text(
            'crm.product.all'.tr,
            style: AppTextStyle.bold(fontSize: 20),
          ),
        ),
        Expanded(
          child: PagedListView.separated(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Product>(
                animateTransitions: true,
                itemBuilder: (context, item, index) {
                  return _buildListItem(item.id!);
                }),
            separatorBuilder: (context, index) => Container(
              height: 1,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildListItem(int id) {
    return InkWell(
        onTap: () => controller.onViewDetailProduct(id),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
              Text('Dịch vụ đẳng cấp', style: AppTextStyle.bold(fontSize: 18)),
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.3,
                    child: Text(
                      'Mã:',
                      style: AppTextStyle.regular(color: Colors.grey.shade700),
                    ),
                  ),
                  Text(
                    'ASASsa',
                    style: AppTextStyle.regular(color: Colors.grey.shade700),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.3,
                    child: Text(
                      'Dòng sản phẩm:',
                      style: AppTextStyle.regular(color: Colors.grey.shade700),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'Dịch vụ',
                    style: AppTextStyle.regular(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
