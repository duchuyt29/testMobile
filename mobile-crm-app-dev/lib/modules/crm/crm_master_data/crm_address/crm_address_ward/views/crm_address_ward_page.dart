import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/common/ward.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/constants/colors.dart';
import '../controllers/crm_address_ward_controller.dart';

class CrmAddressWardPage extends GetView<CrmAddressWardController> {
  CrmAddressWardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.account.ward'.tr,
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
              itemCount: controller.filterWards.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) =>
                  _buildWardCell(controller.filterWards[index]),
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
        onChanged: controller.onSearchWard,
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

  Widget _buildWardCell(Ward ward) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      horizontalTitleGap: 5,
      leading: ward.id == controller.initialValue
          ? Icon(
              Icons.radio_button_checked,
              color: AppColor.primaryColor,
            )
          : Icon(
              Icons.radio_button_off,
              color: AppColor.primaryColor,
            ),
      title: Text(ward.wardName ?? ''),
      onTap: () => controller.onChange(ward),
    );
    // return InkWell(
    //   onTap: () => controller.onChange(ward),
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    //     decoration: BoxDecoration(
    //       border: Border(
    //         bottom: BorderSide(
    //           color: Colors.grey.shade200,
    //         ),
    //       ),
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text(ward.wardName ?? ''),
    //         ward.id != controller.initialValue
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
