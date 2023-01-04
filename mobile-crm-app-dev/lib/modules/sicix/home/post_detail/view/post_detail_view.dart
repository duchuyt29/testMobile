import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:ui_api/sicix_api/models/home/comment.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/theme/theme_decoration.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_preview_horizontal_media.dart';
import '../../../../../shared/widgets/widget_touch_hide_keyboard.dart';
import '../../../../../shared/widgets/widget_user_avatar.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_comment_info.dart';
import '../../home/views/home_post_content_cell.dart';
import '../../home/views/home_post_deadline_cell.dart';
import '../../home/views/home_post_polls_content_cell.dart';
import '../controller/post_detail_controller.dart';
import 'post_detail_comment_cell.dart';
import 'post_detail_comment_info.dart';

class PostDetailView extends GetView<PostDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 15,
            color: AppColor.primaryNavigationBarColor,
          ),
          onPressed: () {
            Get.find<HomeController>().listAllPosts.refresh();
            Get.back();
          },
        ),
        title: Row(
          children: [
            Obx(
              () => WidgetUserAvatar(
                border: 0.5,
                avatar: controller.avatar.value,
                name: controller.name.value,
                userId: controller.postContent.task?.createBy?.id ?? '',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      controller.name.value,
                      style: AppTextStyle.heavy(fontSize: 16),
                    ),
                  ),
                  Text(
                    controller.postContent.getTime(),
                    style: AppTextStyle.regular(
                        color: AppColor.sevenTextColorLight),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        child: WidgetTouchHideKeyBoard(
          child: _buildBodyContent(),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        Expanded(
          child: Obx(
            () => ScrollablePositionedList.builder(
              itemScrollController: controller.scrollController,
              itemCount: controller.commentList.length + 5,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return HomePostContentCell(
                      content: controller.postContent,
                      onLongPress: Get.find<HomeController>().onShowPostOption,
                    );
                  case 1:
                    return HomePostDeadlineCell(
                        content: controller.postContent);
                  case 2:
                    return (controller.postContent.task?.polls?.isNotEmpty ??
                            false)
                        ? HomePostPollsContentCell(
                            content: controller.postContent,
                            onUpdatePoll: (postId, pollId, anwers) {
                              controller.onUpdatePoll(postId, pollId, anwers);
                            },
                          )
                        : Container();
                  case 3:
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HomeCommentInfo(
                          content: controller.postContent,
                          onDeleteReaction: controller.onDeleteReaction,
                          onUpdateReaction: controller.onUpdateReaction,
                          onCommentPress: () {
                            controller.commentReply.value = Comment();
                            controller.commentFocusNode.requestFocus();
                          },
                        ),
                        const SizedBox(height: 14),
                      ],
                    );
                  case 4:
                    return const PostDetailCommentInfo();
                  default:
                    final data = controller.commentList[index - 5];
                    return PostDetailCommentCell(
                      comment: data,
                      onReplyPress: (comment) {
                        controller.commentReply.value = comment;
                        controller.commentFocusNode.requestFocus();
                      },
                      onUpdateReaction: controller.onUpdateReactionComment,
                      onDeleteReaction: controller.onDeleteCommentReaction,
                    );
                }
              },
            ),
          ),
        ),
        _buildBottomavigationBar(),
      ],
    );
  }

  Widget _buildBottomavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCommentReply(),
        const Divider(height: 1),
        _buildInputComment(),
        _buildAttachFile(),
      ],
    );
  }

  Widget _buildInputComment() {
    return Row(
      children: [
        Expanded(
          child: Scrollbar(
            child: TextField(
              focusNode: controller.commentFocusNode,
              controller: controller.commentController,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              minLines: 1,
              decoration: ThemeDecoration.inputNoneBorder.copyWith(
                hintText: 'home.comment'.tr,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: controller.onAttachFile,
          icon: FCoreImage(
            IconConstants.icAttachFile1,
            color: AppColor.actionNeutral,
            width: 21,
            height: 21,
          ),
        ),
        IconButton(
          onPressed: controller.onAttachMedia,
          icon: FCoreImage(
            IconConstants.icMedia,
            width: 20,
            height: 20,
          ),
        ),
        IconButton(
          onPressed: controller.onSendComment,
          icon: FCoreImage(
            IconConstants.icSend,
            width: 25,
            height: 25,
          ),
        ),
      ],
    );
  }

  Widget _buildAttachFile() {
    return Obx(() {
      final attachmentItems = controller.attachmentItems
          .map((element) => element.getMediaFile())
          .toList();
      return Visibility(
        visible: attachmentItems.isNotEmpty,
        child: WidgetPreviewHorizontalMedia(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          isName: true,
          files: attachmentItems,
          onDeleteAttach: (index) => controller.onDeleteAttach(index),
        ),

        // Container(
        //   height: 150,
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: attachmentItems.length,
        //     itemBuilder: (context, index) => PostDetailInputAttachCell(
        //       attachmentItems[index],
        //       onDeleteAttach: () => controller.onDeleteAttach(index),
        //     ),
        //   ),
        // ),
        //  Stack(
        //   alignment: Alignment.topRight,
        //   children: [
        //     Container(
        //       margin: const EdgeInsets.all(20),
        //       padding: const EdgeInsets.all(5),
        //       decoration: BoxDecoration(
        //         border: Border.all(color: Colors.grey, width: 0.5),
        //         borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        //       ),
        //       child: Row(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Container(
        //             width: 60,
        //             height: 60,
        //             child: IconButton(
        //               onPressed: controller.onAttachFile,
        //               icon: FCoreImage(
        //                 IconConstants.icAttachFile,
        //                 width: 60,
        //                 height: 60,
        //               ),
        //             ),
        //           ),
        //           const SizedBox(width: 10),
        //           Container(
        //             width: 150,
        //             child: Text(
        //               controller.attachFiles.isEmpty
        //                   ? ''
        //                   : (controller.attachFiles.first.path).split('/').last,
        //               style: AppTextStyle.heavy(fontSize: 15),
        //             ),
        //           ),
        //           const SizedBox(width: 20),
        //         ],
        //       ),
        //     ),
        //     IconButton(
        //       onPressed: controller.onClearAttachFile,
        //       icon: FCoreImage(
        //         IconConstants.icCloseBlack,
        //         width: 40,
        //         height: 40,
        //       ),
        //     )
        //   ],
        // ),
      );
    });
  }

  Widget _buildSelectAttachFile() {
    return Obx(
      () => Visibility(
        visible: controller.isAttachFile.value,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              width: 60,
              height: 60,
              child: IconButton(
                onPressed: controller.onAttachFile,
                icon: FCoreImage(
                  IconConstants.icAttachFile,
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            Text('home.post.attach.file'.tr),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentReply() {
    return Obx(
      () => Visibility(
        visible: controller.commentReply.value?.id != null,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColor.primaryBorderColor,
                width: 1,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
          child: Row(
            children: [
              Container(
                height: 34,
                width: 2,
                color: AppColor.primaryColor,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'post.detail.answering'.tr,
                        style: AppTextStyle.regular(),
                      ),
                      TextSpan(
                        text:
                            controller.commentReply.value?.createBy?.fullName ??
                                '',
                        style: AppTextStyle.heavy(
                          color: AppColor.stateInfoColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
