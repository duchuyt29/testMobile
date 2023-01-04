import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/theme/theme_decoration.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_loading.dart';
import '../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../../../../../shared/widgets/widget_touch_hide_keyboard.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_post_cell.dart';
import '../controllers/post_search_controller.dart';

class PostSearchScreen extends GetView<PostSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColor.primaryBackgroundColor,
        leadingWidth: 72,
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: Get.back,
            icon: FCoreImage(
              IconConstants.icCloseSquare,
              width: 40,
              height: 40,
            ),
          ),
        ),
        title: Container(
          height: 45,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: AppColor.secondBackgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            controller: controller.searchController,
            textInputAction: TextInputAction.search,
            decoration: ThemeDecoration.searchInputDecoration(),
            onChanged: (value) => controller.getSearchPosts(0),
          ),
        ),
      ),
      body: WidgetTouchHideKeyBoard(
        child: SafeArea(
          child: _buildBodyContent(),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Obx(
      () {
        if (controller.searchController.text.isEmpty &&
            controller.isAllPostsLoading.value) {
          return Container();
        } else if (controller.isAllPostsLoading.value) {
          return const WidgetCenterLoading();
        } else if (controller.listAllPosts.isEmpty) {
          return _buildEmptyResult();
        } else {
          return _buildContent();
        }
      },
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Text(
            '${controller.listAllPosts.length} kết quả tìm kiếm',
            style: AppTextStyle.heavy(),
          ),
        ),
        Expanded(
          child: WidgetScrollviewRefresher(
            refreshController: controller.allPostsRefreshController,
            onRefresh: controller.onRefreshAllPosts,
            onLoading: controller.onLoadingAllPosts,
            isLoadMore: controller.isMoreAllPosts.value,
            child: ListView.separated(
              controller: controller.scrollController,
              itemCount: controller.listAllPosts.length,
              itemBuilder: (context, index) {
                return HomePostCell(
                  content: controller.listAllPosts[index],
                  onPostDetail: Get.find<HomeController>().onPostDetail,
                  onUpdatePoll: Get.find<HomeController>().onUpdatePoll,
                  onDeleteReaction: Get.find<HomeController>().onDeleteReaction,
                  onUpdateReaction: Get.find<HomeController>().onUpdateReaction,
                  onLongPress: Get.find<HomeController>().onShowPostOption,
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 8,
                thickness: 8,
                color: AppColor.dividerColor.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyResult() {
    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.12),
      width: double.infinity,
      child: Column(
        children: [
          FCoreImage(
            IconConstants.icSearchEmpty,
            width: Get.width * 0.46,
          ),
          const SizedBox(height: 30),
          Text(
            'messenger.search.empty'.tr,
            style: AppTextStyle.regular(
              color: AppColor.fourthTextColor,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
