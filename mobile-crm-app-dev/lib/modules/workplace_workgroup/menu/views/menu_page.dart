import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../resource/assets_constant/images_constants.dart';
import '../../../../routes/workgroup_pages.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/menu_controller.dart';

class MenuPage extends GetView<MenuController> {
  MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          title: Text(
            'Menu'.tr,
            style: AppTextStyle.heavy(fontSize: 26),
          ),
          leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          )),
      body: SafeArea(
        bottom: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        _buildItems(
          name: 'workplace.workgroup.synthesize.information'.tr,
          image: ImageConstants.workplaceWorkgroupChart,
          ontap: () {
            Get.toNamed(WorkGroupRoutes.WORKPLACE_WORKGROUP_DASHBOARD);
          },
        ),
        _buildItems(
          name: 'workplace.workgroup.my.request'.tr,
          image: ImageConstants.workplaceWorkgroupTick,
          ontap: () {
            Get.toNamed(WorkGroupRoutes.WORKPLACE_WORKGROUP_MY_REQUEST);
          },
        ),
        _buildItems(
          name: 'workplace.workgroup.request.needs.my.approval'.tr,
          image: ImageConstants.workplaceWorkgroupPen,
          ontap: () {
            Get.toNamed(
                WorkGroupRoutes.WORKPLACE_WORKGROUP_REQUEST_NEEDS_MY_APPROVAL);
          },
        ),
        _buildItems(
          name: 'workplace.workgroup.work'.tr,
          image: ImageConstants.workplaceWorkgroupBag,
          ontap: () {
            Get.toNamed(WorkGroupRoutes.WORKPLACE_WORKGROUP_WORK_HOME);
          },
        ),
        _buildItems(
          name: 'workplace.workgroup.news'.tr,
          image: ImageConstants.workplaceWorkgroupNews,
          ontap: () {},
        ),
      ],
    );
  }

  Widget _buildItems({
    required String name,
    required String image,
    required VoidCallback ontap,
  }) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15, right: 10, left: 10),
      child: InkWell(
        onTap: ontap,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColor.primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Container(
            height: 90,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: 45,
                  child: FCoreImage(
                    image,
                    width: 37,
                    height: 37,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildItems({
  //   required String name,
  //   required String image,
  //   required VoidCallback ontap,
  // }) {
  //   return Container(
  //     padding: const EdgeInsets.only(bottom: 15, right: 10, left: 10),
  //     child: InkWell(
  //       onTap: ontap,
  //       child: Card(
  //         elevation: 10,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         child: Container(
  //           height: 80,
  //           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //           padding: const EdgeInsets.symmetric(
  //             horizontal: 15,
  //           ),
  //           // decoration: BoxDecoration(
  //           //   borderRadius: BorderRadius.circular(15),
  //           //   border: Border.all(width: 1, color: const Color(0xff493083)),
  //           // ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Text(
  //                 name,
  //                 style: const TextStyle(
  //                     fontSize: 22,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.black),
  //               ),
  //               Container(
  //                 padding: const EdgeInsets.symmetric(horizontal: 5),
  //                 width: 45,
  //                 child: FCoreImage(
  //                   image,
  //                   width: 37,
  //                   height: 37,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
