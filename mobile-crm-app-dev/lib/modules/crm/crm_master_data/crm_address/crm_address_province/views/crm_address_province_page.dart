import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/province.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/constants/colors.dart';
import '../controllers/crm_address_province_controller.dart';

class CrmAddressProvincePage extends GetView<CrmAddressProvinceController> {
  CrmAddressProvincePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.account.city'.tr,
          style: AppTextStyle.regular(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SafeArea(
        top: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        _buildSearchBar(),
        Expanded(
          child: Obx(
            () => ListView.separated(
              itemCount: controller.filterProvinces.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) =>
                  _buildProvinceCell(controller.filterProvinces[index]),
            ),
          ),
        ),
      ],
    );
  }

  Container _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onChanged: controller.onSearchProvince,
        decoration: InputDecoration(
          hintText: 'search'.tr,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26,
          ),
        ),
      ),
    );
  }

  Widget _buildProvinceCell(Province province) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      horizontalTitleGap: 5,
      leading: province.id == controller.initialValue
          ? Icon(
              Icons.radio_button_checked,
              color: AppColor.primaryColor,
            )
          : Icon(
              Icons.radio_button_off,
              color: AppColor.primaryColor,
            ),
      title: Text(province.provinceName ?? ''),
      onTap: () => controller.onChange(province),
    );
    // return InkWell(
    //   onTap: () => controller.onChange(province),
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text(province.provinceName ?? ''),
    //         province.id != controller.initialValue
    //             ? Container()
    //             : Padding(
    //                 padding: const EdgeInsets.only(right: 10),
    //                 child: Icon(
    //                   Icons.check,
    //                   color: Colors.red.shade700,
    //                 ),
    //               ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
