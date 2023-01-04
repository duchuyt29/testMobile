import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/auth/user_info.dart';
import 'package:ui_api/sicix_api/models/home/post_content.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/models/type_model.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/utils/date_util.dart';
import '../../../../../shared/widgets/button/widget_button_selection_underline.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_loading.dart';
import '../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../controllers/home_controller.dart';
import 'home_page_important_cell.dart';
import 'home_post_cell.dart';

part 'home_birth_month.dart';
part 'home_page_all.dart';
part 'home_page_important.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'home.title'.tr,
          style: AppTextStyle.heavy(fontSize: 20),
        ),
        leading: Obx(
          () => IconButton(
            onPressed: controller.onChangeCompany,
            icon: WidgetAvatar(
              size: 32,
              fit: BoxFit.contain,
              isUrl: true,
              name: controller.companySelected.value?.name ?? '',
              avatar: controller.companySelected.value?.getAvatar(),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: controller.onSearch,
            icon: FCoreImage(
              IconConstants.icSearch,
              width: 32,
              height: 32,
            ),
          )
        ],
      ),
      body: _buildBodyContent(),
    );
  }

  // Widget _buildBodyContent() {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       _buildMenuTopNavigator(),
  //       Obx(
  //         () => controller.currentMenuTopIndex.value ==
  //                 HomeController.MENU_TOP_NEWS
  //             ? _buildNewsContent()
  //             : _buildImportantContent(),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildBodyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMenuTopNavigator(),
        Expanded(
          child: Obx(
            () {
              switch (controller.currentHomePage.value) {
                case TypeModel.PAGE_POST:
                  return _pageAll();
                case TypeModel.PAGE_IMPORTANT:
                  return _buildImportant();
                case TypeModel.PAGE_BIRTH_MONTH:
                  return _birthMonth();
                default:
                  return Container();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMenuTopNavigator() {
    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: WidgetButtonSelectionUnderline(
                title: 'home.page.new'.tr,
                isSelected:
                    controller.currentHomePage.value == TypeModel.PAGE_POST,
                onTap: () =>
                    controller.onSelectionHomePage(TypeModel.PAGE_POST),
              ),
            ),
            Flexible(
              flex: 1,
              child: WidgetButtonSelectionUnderline(
                title: 'home.page.notification'.tr,
                isSelected: controller.currentHomePage.value ==
                    TypeModel.PAGE_IMPORTANT,
                onTap: () =>
                    controller.onSelectionHomePage(TypeModel.PAGE_IMPORTANT),
              ),
            ),
            Flexible(
              flex: 1,
              child: WidgetButtonSelectionUnderline(
                title: 'home.birth.month'.tr,
                isSelected: controller.currentHomePage.value ==
                    TypeModel.PAGE_BIRTH_MONTH,
                onTap: () =>
                    controller.onSelectionHomePage(TypeModel.PAGE_BIRTH_MONTH),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyContent() {
    return Container(
      margin: EdgeInsets.only(top: Get.height / 2 - 200 - Get.width * 0.23),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          FCoreImage(
            IconConstants.icMessengerEmpty,
            width: Get.width * 0.46,
          ),
          const SizedBox(height: 30),
          Text(
            'home.empty'.tr,
            style: AppTextStyle.heavy(
              color: AppColor.sixTextColorLight,
              fontSize: 23,
            ),
          ),
        ],
      ),
    );
  }
}
