import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/media_file/media_file.dart';

import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/button/widget_button_selection_underline.dart';
import '../../../../../shared/widgets/widget_loading.dart';
import '../../../../../shared/widgets/widget_preview_media.dart';
import '../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../../../../../shared/widgets/widget_search_empty.dart';
import '../controllers/chat_media_controller.dart';

class ChatMediaScreen extends GetView<ChatMediaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'chat.option.media.title'.tr,
          style: AppTextStyle.heavy(
            color: AppColor.secondTextColor,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(
            () => Row(
              children: [
                Expanded(
                  child: WidgetButtonSelectionUnderline(
                    title: 'chat.option.media.image'.tr,
                    isSelected: controller.pageIndex.value ==
                        ChatMediaController.MENU_IMAGE,
                    onTap: () => controller
                        .onSelectionPage(ChatMediaController.MENU_IMAGE),
                  ),
                ),
                Expanded(
                  child: WidgetButtonSelectionUnderline(
                    title: 'chat.option.media.file'.tr,
                    isSelected: controller.pageIndex.value ==
                        ChatMediaController.MENU_FILE,
                    onTap: () => controller
                        .onSelectionPage(ChatMediaController.MENU_FILE),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Obx(() {
            switch (controller.pageIndex.value) {
              case ChatMediaController.MENU_IMAGE:
                if (controller.isMediaLoading.value) {
                  return const WidgetCenterLoading();
                } else if (controller.medias.isEmpty) {
                  return WidgetSearchEmpty();
                } else {
                  return WidgetScrollviewRefresher(
                    refreshController: controller.refreshMediaController,
                    onRefresh: controller.onRefreshMedia,
                    onLoading: controller.onLoadingMedia,
                    isLoadMore: controller.isMoreMedia.value,
                    child: GridView.builder(
                      itemCount: controller.medias.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                      ),
                      itemBuilder: (context, index) {
                        return WidgetPreviewMedia(
                          controller.medias[index],
                          onTap: () =>
                              controller.onMedia(controller.medias[index]),
                        );
                      },
                    ),
                  );
                }

              case ChatMediaController.MENU_FILE:
                if (controller.isFileLoading.value) {
                  return const WidgetCenterLoading();
                } else if (controller.files.isEmpty) {
                  return WidgetSearchEmpty();
                } else {
                  return WidgetScrollviewRefresher(
                    refreshController: controller.refreshFileController,
                    onRefresh: controller.onRefreshFile,
                    onLoading: controller.onLoadingFile,
                    isLoadMore: controller.isMoreFile.value,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        itemCount: controller.files.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () =>
                                controller.onMedia(controller.medias[index]),
                            child: _buildFileCell(controller.files[index]),
                          );
                        }),
                  );
                }
            }
            return Container();
          }),
        ),
      ],
    );
  }

  Widget _buildFileCell(MediaFile content) {
    printInfo(info: '${content.name!} ${content.getMediaFilePreview()}');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: WidgetPreviewMedia(content),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content.name ?? '',
                  style: AppTextStyle.heavy(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
