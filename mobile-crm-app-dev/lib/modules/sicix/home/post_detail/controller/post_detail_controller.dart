import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:ui_api/sicix_api/models/attachment/attachment_item.dart';
import 'package:ui_api/sicix_api/models/common/reaction_model.dart';
import 'package:ui_api/sicix_api/models/home/comment.dart';
import 'package:ui_api/sicix_api/models/home/post_content.dart';
import 'package:ui_api/sicix_api/models/home/reaction_count.dart';
import 'package:ui_api/sicix_api/models/media_file/media_file.dart';
import 'package:ui_api/sicix_api/request/comment_request.dart';
import 'package:ui_api/sicix_api/request/upload_file_request.dart';
import 'package:ui_api/sicix_api/request/vote_request.dart';

import '../../../../../base/base_controller.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/services/user_info_service.dart';
import '../../../../../shared/utils/app_util.dart';
import '../../../../../shared/utils/dialog_util.dart';

class PostDetailController extends BaseController {
  final RxBool isLoaded = RxBool(false);

  final avatar = RxString('');
  final name = RxString('');

  final commentController = TextEditingController();
  final commentFocusNode = FocusNode();

  final scrollController = ItemScrollController();

  final commentList = RxList<Comment>.empty();
  int pageComment = 0;
  final isMoreComments = RxBool(true);

  final commentReply = Rxn<Comment>();

  final reactionCount = ReactionCount().obs;
  final reactionTab = <Reaction>[].obs;

  // final attachFiles = RxList<File>.empty();
  final attachmentItems = RxList<AttachmentItem>.empty();

  final indexTab = 0.obs;
  final isAttachFile = RxBool(false);

  PostContent postContent;

  PostDetailController(this.postContent) {
    avatar.value = postContent.getUserAvatar();
    name.value = postContent.getUserName();
  }

  @override
  Future<void> onInit() async {
    await super.onInit();

    if (postContent.workgroup == null) {
      await _loadUser();
    }
    await _getComments(0, postContent.task?.id ?? 0);

    if (postContent.showKeyboardComment) {
      commentFocusNode.requestFocus();
    }
  }

  /* Action */

  Future<void> onUpdatePoll(int? postId, int? pollId, List<int>? anwers) async {
    postContent.task?.increaseViewer();

    if (pollId == null) {
      return;
    }
    final request = VoteRequest(pollId, anwers ?? []);
    await _sendVote(request);
  }

  void onDeleteReaction(PostContent content) =>
      _sendDeleteReaction(content.task?.id);

  void onUpdateReaction(PostContent content) => _sendUpdateReaction(
      content.task?.id, content.task?.reaction?.userReaction ?? '');

  Future onSendComment() async {
    commentFocusNode.unfocus();

    final postId = postContent.task?.id;
    if (postId == null) {
      return;
    }

    final comment = commentController.text.trim();
    if (comment.isEmpty && attachmentItems.isEmpty) {
      return;
    }

    await _callSendComment(postId, comment, attachmentItems);
  }

  Future onAttachMedia() async {
    // await Get.toNamed(Routes.IMAGE_PICKER, arguments: true)?.then((value) {
    //   if (value != null && value is File) {
    //     attachFiles.value = [value];
    //   }
    // });
    await Get.toNamed(SicixRoutes.IMAGE_PICKER, arguments: true)
        ?.then((value) async {
      if (value != null && value is File) {
        await _callAttachFile(value);
      }
    });
  }

  Future onAttachFile() async {
    isAttachFile.value = false;
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      await _callAttachFile(file);
    }
  }

  void onDeleteCommentReaction(Comment comment) {
    sicixUIRepository.deleteReactionComment(comment.id ?? '');
  }

  void onUpdateReactionComment(Comment comment) {
    sicixUIRepository.reactionComment(
        comment.id ?? '', comment.reaction?.userReaction ?? '');
  }

  void onClearAttachFile() {
    // attachFiles.clear();
    attachmentItems.clear();
  }

  void onDeleteAttach(int index) {
    // attachFiles.clear();
    attachmentItems.removeAt(index);
  }

  /* Call API */

  Future<void> _sendVote(VoteRequest request) async {
    await sicixUIRepository.sendVote(request).then((response) async {
      if (response.success) {
        printInfo(info: 'sendVote succress ${request.toJson()}');
      } else {
        printError(
            info:
                'sendVote error ${request.toJson()} \n ${response.message ?? 'unknow'}');
      }
    }).catchError(
      (onError) {
        printError(
            info:
                'sendVote error ${request.toJson()} \n ${onError.toString()}');
      },
    );
  }

  void _sendDeleteReaction(int? postId) {
    if (postId == null) {
      return;
    }
    sicixUIRepository.deleteReactionPost(postId).then((response) {
      if (response.success) {
        printInfo(info: '_sendDeleteReaction $postId');
      } else {
        printError(info: '_sendDeleteReaction $postId\n${response.message}');
      }
    }).catchError((onError) {
      printError(info: '_sendDeleteReaction $postId\n${onError.toString()}');
    });
  }

  void _sendUpdateReaction(int? postId, String reaction) {
    if (postId == null) {
      return;
    }
    sicixUIRepository.reactionPost(postId, reaction).then((response) {
      if (response.success) {
        printInfo(info: '_sendUpdateReaction $postId $reactive');
      } else {
        printError(info: '_sendUpdateReaction $postId\n${response.message}');
      }
    }).catchError((onError) {
      printError(info: '_sendUpdateReaction $postId\n${onError.toString()}');
    });
  }

  Future<void> _getComments(
    int page,
    int postId, {
    Comment? reply,
    bool addComment = false,
  }) async {
    // pageComment = page;
    // final response = await sicixUIRepository.getComment(
    //     'comm-service', 'feed', postId, '-1', page, 100);
    // // final comments = <Comment>[];
    // // if (page > 0) {
    // //   comments.addAll(commentList);
    // // }
    // // comments.addAll(response.data?.content ?? []);

    // // response.data?.content.forEach((comment) async {
    // //   final subComments = await getSubComments(0, postId, comment.id ?? '');
    // //   comments.firstWhereOrNull((e) => e.id == comment.id)?.subComments =
    // //       subComments;
    // //   commentList.refresh();
    // // });
    // // isMoreComments.value = response.data?.isMore() ?? false;
    // // // _updateCommentsRefreshController(pageComment);
    // // commentList.value = RxList(comments);

    await sicixUIRepository
        .getComment('comm-service', 'feed', postId, '-1', page, 100)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        if (page == 0) {
          commentList.clear();
        }
        pageComment = page;

        isMoreComments.value = response.data?.isMore() ?? false;
        final comments = response.data?.content ?? [];

        await Future.forEach(comments, (Comment comment) async {
          if (comment.childrenQuantity != null &&
              comment.childrenQuantity! > 0) {
            comment.subComments =
                await getSubComments(0, postId, comment.id ?? '');
          }

          final attachments = comment.attachments ?? [];
          await Future.forEach(attachments, (MediaFile attachment) async {
            final id = attachment.id;
            if (id != null && AppUtil.isVideo(attachment.name ?? '')) {
              final mediaFile = await _getMediaFileInfo(id);
              if (mediaFile != null) {
                if (mediaFile.contentType != null) {
                  attachment.contentType = mediaFile.contentType;
                }
                attachment.ref = mediaFile.ref;
              }
            }
          });
          commentList.add(comment);
        });
        if (addComment) {
          if (reply?.id != null) {
            final index = commentList.indexWhere((e) => e.id == reply?.id);
            if (index > -1) {
              await scrollController.scrollTo(
                  index: index + 5,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOutCubic);
            } else {
              await scrollController.scrollTo(
                  index: 5,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOutCubic);
            }
          } else {
            await scrollController.scrollTo(
                index: 5,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOutCubic);
          }
        }
      } else {
        printError(info: response.message ?? 'lỗi load comment $postId');
      }
    }).catchError((onError) {
      printError(info: 'lỗi load comment ${onError.toString()}');
    });
  }

  Future<List<Comment>> getSubComments(
      int page, int postId, String parentId) async {
    final comments = <Comment>[];
    final response = await sicixUIRepository.getComment(
        'comm-service', 'feed', postId, parentId, page, 100);
    comments.addAll(response.data?.content ?? []);
    if ((response.data?.total ?? 0) > page + 1) {
      final tmpeComments = await getSubComments(page + 1, postId, parentId);
      comments.addAll(tmpeComments);
    }

    await Future.forEach(comments, (Comment comment) async {
      final attachments = comment.attachments ?? [];
      await Future.forEach(attachments, (MediaFile attachment) async {
        final id = attachment.id;
        if (id != null && AppUtil.isVideo(attachment.name ?? '')) {
          final mediaFile = await _getMediaFileInfo(id);
          if (mediaFile != null) {
            if (mediaFile.contentType != null) {
              attachment.contentType = mediaFile.contentType;
            }
            attachment.ref = mediaFile.ref;
          }
        }
      });
    });

    return comments;
  }

  Future getReactionCommentCount(String id) async {
    reactionCount.value = await sicixUIRepository.getUserReactionComment(
        id, Reaction.values.map((e) => e.key).toList().join(','), 0, 20);
  }

  int calculatorReactionCount(Reaction reaction) {
    return reactionCount.value.data!
        .where((e) => e.type == reaction.key)
        .toList()
        .length;
  }

  int calculatorReactionTab() {
    var count = 1;
    Reaction.values.forEach((type) {
      if (calculatorReactionCount(type) > 0) {
        count += 1;
      }
    });
    return count;
  }

  Future<void> onSelectTab(int v, String id) async {
    if (v == 0) {
      reactionCount.value.data!.clear();
      await getReactionCommentCount(id);
    } else {
      final reaction = reactionTab.value[v - 1];
      reactionCount.value.data!.clear();
      reactionCount.value = await sicixUIRepository.getUserReactionComment(
          id, reaction.key, 0, 20);
    }
  }

  Future _loadUser() async {
    final userId = postContent.task?.createBy?.id ?? '';
    final user = await UserInfoService.getUserProfileHCMFromId(userId,
        onError: (message) {
      printError(info: message);
    }, onMappingError: (message) {
      printError(info: message);
    });
    if (user != null) {
      avatar.value = user.getAvatar();
      name.value = user.getName();
    }
  }

  Future _callSendComment(
    int postId,
    String comment,
    List<AttachmentItem>? attachments,
  ) async {
    final request = CommentRequest.fromComment(
      postId: postId,
      comment: comment,
      commentReply: commentReply.value,
      attachments: attachments ?? [],
    );
    await EasyLoading.show();
    await sicixUIRepository.sendComment(request).then((response) async {
      if (response.success && response.data != null) {
        // await _getComments(0, postId,
        //     reply: commentReply.value, addComment: true);
        final commentCount =
            (int.tryParse(postContent.task?.commentCount ?? '') ?? 0) + 1;
        postContent.task?.commentCount = commentCount.toString();

        if (commentReply.value != null) {
          final indexReply = commentList
              .indexWhere((element) => element.id == commentReply.value!.id);
          if (indexReply != -1) {
            commentList[indexReply].subComments?.insert(0, response.data!);
            commentList.refresh();
          }
        } else {
          commentList.insert(0, response.data!);
          commentList.refresh();
        }

        if (commentReply.value != null) {
          final index =
              commentList.indexWhere((e) => e.id == commentReply.value?.id);
          if (index > -1) {
            await scrollController.scrollTo(
                index: index + 5,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOutCubic);
          } else {
            await scrollController.scrollTo(
                index: 5,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOutCubic);
          }
        } else {
          await scrollController.scrollTo(
              index: 5,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOutCubic);
        }

        onClearAttachFile();
        commentReply.value = null;
        commentController.text = '';
      } else {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
        );
      }
      await EasyLoading.dismiss();
    }).catchError((e) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }

  Future<List<AttachmentItem>?> _callAttachFiles(List<File> files) async {
    return sicixUIRepository
        .uploadFile(files, UploadFileRequest.comment())
        .then((response) async {
      if (response.success) {
        return response.data;
        // clearAttachFile();
        // await onSendComment(attachments: response.data);
      } else {
        await EasyLoading.showToast(
          response.message ?? 'upload.failure'.tr,
        );
        return null;
      }
    }).catchError((e) {
      printError(info: e.toString());
      EasyLoading.showToast('upload.failure'.tr);
      return null;
    });
  }

  Future _callAttachFile(File file) async {
    await EasyLoading.show();
    return sicixUIRepository
        .uploadFile([file], UploadFileRequest.comment()).then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        final attach = response.data?.firstWhereOrNull((element) => true);
        if (attach == null) {
          return;
        }
        if (AppUtil.isVideo(attach.file?.name ?? '') &&
            attach.file?.id != null) {
          final mediaFile = await _getMediaFileInfo(attach.file!.id!);
          if (mediaFile != null) {
            if (mediaFile.contentType != null) {
              attach.file?.contentType = mediaFile.contentType;
            }
            attach.file?.ref = mediaFile.ref;
          }
        }

        attachmentItems.add(attach);
      } else {
        await EasyLoading.showToast(
          response.message ?? 'upload.failure'.tr,
        );
      }
    }).catchError((e) {
      printError(info: e.toString());
      EasyLoading.dismiss();
      EasyLoading.showToast('upload.failure'.tr);
    });
  }

  Future<MediaFile?> _getMediaFileInfo(String id) async {
    return sicixUIRepository.mediaFileInfo(id).then((response) async {
      if (response.success) {
        return response.data;
      } else {
        return null;
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      return null;
    });
  }
}
