import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/theme/theme_decoration.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/messenger/widget_search_account_cell.dart';
import '../../../../../shared/widgets/widget_loading.dart';
import '../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../../../../../shared/widgets/widget_search_empty.dart';
import '../controllers/forward_message_controller.dart';

class ForwardMessageScreen extends GetView<ForwardMessageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'chat.forward'.tr,
          style: AppTextStyle.heavy(
            color: AppColor.secondTextColor,
            fontSize: 20,
          ),
        ),
      ),
      body: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSearchBar(),
        Expanded(
          child: Obx(
            () {
              if (controller.isLoading.value == null) {
                return Container();
              } else if (controller.isLoading.value!) {
                return const WidgetCenterLoading();
              } else if (controller.conversations.isEmpty) {
                return WidgetSearchEmpty();
              } else {
                return _buildConversation();
              }
            },
          ),
        ),
        _buildForwardMessage(),
        _buildNoteMessageTextField(),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColor.secondBackgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller.searchController,
        textInputAction: TextInputAction.search,
        decoration: ThemeDecoration.searchInputDecoration(
          hintText: 'chat.forward.search'.tr,
        ),
        onChanged: (value) => controller.onChangedSearh(value),
        onSubmitted: (value) => controller.onSubmittedSearh(value),
      ),
    );
  }

  Widget _buildConversation() {
    return Obx(() {
      final isMore = controller.isMore.value;
      final conversations = controller.conversations;
      return WidgetScrollviewRefresher(
        refreshController: controller.refreshController,
        onRefresh: controller.onRefresh,
        onLoading: controller.onLoading,
        isLoadMore: isMore,
        child: ListView.builder(
          itemCount: conversations.length,
          itemBuilder: (BuildContext context, int index) => Obx(
            () => WidgetSearchAccountCell(
              avatar: conversations[index].getAvatar(),
              name: conversations[index].getName(),
              isSelected: controller.conversationSelecteds
                  .any((element) => element.id == conversations[index].id),
              onTap: () => controller.onConversation(conversations[index]),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildForwardMessage() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppColor.primaryBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 34,
            margin: const EdgeInsets.only(left: 24, right: 10),
            decoration: BoxDecoration(
              color: AppColor.buttonBackgroundColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          controller.forwardMediaFile == null
              ? Container()
              : Container(
                  height: 34,
                  width: 34,
                  margin: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FCoreImage(
                      controller.forwardMediaFile!.getMediaFilePreview(),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'chat.forward'.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.heavy(
                    fontSize: 13,
                    color: AppColor.sixTextColorLight,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  controller.forwardMessage.getSumaryContent(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.regular(
                    fontSize: 13,
                    color: AppColor.primaryHintColor,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildNoteMessageTextField() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller.noteMessageController,
            textInputAction: TextInputAction.search,
            decoration: ThemeDecoration.inputNoneBorder.copyWith(
              hintText: 'chat.forward.hint'.tr,
            ),
          ),
        ),
        IconButton(
          onPressed: () => controller.onSend(),
          icon: FCoreImage(
            IconConstants.icSend,
            width: 25,
            height: 25,
          ),
        )
      ],
    );
    // return InputToolbar(
    //   inputOptions: InputOptions(
    //     inputTextStyle: AppTextStyle.regular(),
    //     inputDecoration: ThemeDecoration.inputNoneBorder.copyWith(
    //       hintText: 'chat.forward.hint'.tr,
    //     ),
    //     inputToolbarStyle: BoxDecoration(
    //       color: AppColor.primaryBackgroundColor,
    //     ),
    //     inputToolbarPadding: EdgeInsets.zero,
    //     inputToolbarMargin: EdgeInsets.zero,
    //     alwaysShowSend: true,
    //     sendButtonBuilder: (send) => IconButton(
    //       onPressed: send,
    //       icon: FCoreImage(
    //         IconConstants.icSend,
    //         width: 25,
    //         height: 25,
    //       ),
    //     ),
    //   ),
    //   currentUser: ChatUser(id: ''),
    //   onSend: (ChatMessage chatMessage) => controller.onSend(chatMessage),
    // );
  }
}
