import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/sicix_api/models/attachment/attachment_item.dart';
import 'package:ui_api/sicix_api/models/auth/user_info.dart';
import 'package:ui_api/sicix_api/models/common/reaction_model.dart';
import 'package:ui_api/sicix_api/models/home/post_content.dart';
import 'package:ui_api/sicix_api/models/home/reaction_count.dart';
import 'package:ui_api/sicix_api/models/media_file/media_file.dart';
import 'package:ui_api/sicix_api/repository/sicix_ui_repository.dart';
import 'package:ui_api/sicix_api/request/conditions_request.dart';
import 'package:ui_api/sicix_api/request/vote_request.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../data/app_data_global.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/models/type_model.dart';
import '../../../../../shared/services/user_info_service.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/utils/app_util.dart';
import '../../../../../shared/utils/dialog_util.dart';
import '../../../master/controllers/master_controller.dart';

class HomeController extends GetxController {
  final MasterController masterController;
  final _sicixUIRepository = Get.find<SicixUIRepository>();

  final scrollController = ScrollController();

  final today = DateTime.now();
  final reactionCount = ReactionCount().obs;
  final reactionTab = <Reaction>[].obs;
  // final viewCount = ViewCount().obs;
  final homePages = TypeModel.homePages;
  final currentHomePage = RxInt(TypeModel.PAGE_POST);
  final companySelected = Rxn(AppDataGlobal.userConfig?.getLastCompany());

  // Tab Bảng tin bao gồm 10 Event gần nhất và Toàn bộ bài post
  final allPostsRefreshController = RefreshController();
  final carouselController = CarouselController();
  final listAllPosts = RxList<PostContent>([]);
  final listHomeEvents = RxList<PostContent>([]);
  final isAllPostsLoading = RxBool(true);
  final isMoreAllPosts = RxBool(true);
  int _pageAllPosts = 0;

  // Slide các event Tab Bảng tin
  final sliderCurrentIndex = RxInt(0);

  // Tab toàn bộ Bài viết quan trọng
  final importantsRefreshController = RefreshController();
  final listImportants = RxList<PostContent>([]);
  final isImportantsLoading = RxBool(true);
  final isMoreImportants = RxBool(true);
  int _pageImportants = 0;

  // Tab toàn bộ Sự kiện
  final eventsRefreshController = RefreshController();
  final listEvents = RxList<PostContent>([]);
  final indexTab = 0.obs;
  final isEventsLoading = RxBool(true);
  final isMoremEvents = RxBool(true);
  int _pageEvents = 0;

  // Tab Sinh nhật
  final birthMonthRefreshController = RefreshController();
  final listBirthMonth = RxList<UserInfo>([]);
  final isBirthMonthLoading = RxBool(true);

  HomeController(this.masterController);

  @override
  Future<void> onInit() async {
    super.onInit();

    onRefreshAllPosts();

    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  void refresh() {
    super.refresh();

    final company = AppDataGlobal.userConfig?.getLastCompany();
    if (companySelected.value?.id != company?.id) {
      companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
      _refreshPage();
    }
  }

  /* Action */

  Future<void> onChangeCompany() async {
    await Get.toNamed(SicixRoutes.CHOOSE_COMPANY)?.then((value) {
      if (value is bool && value) {
        companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
        _refreshPage();
      }
    });
  }

  Future onSearch() async {
    await Get.toNamed(SicixRoutes.POST_SEARCH);
  }

  Future<void> onSelectTab(int v, int id) async {
    if (v == 0) {
      reactionCount.value.data!.clear();
      await getReactionCount(id);
    } else {
      final reaction = reactionTab.value[v - 1];
      reactionCount.value.data!.clear();
      reactionCount.value =
          await _sicixUIRepository.getUserReactionPost(id, reaction.key, 0, 20);
    }
  }

  Future<void> onSelectionHomePage(int homePage) async {
    if (currentHomePage.value == homePage) {
      await scrollController.animateTo(0,
          duration: const Duration(seconds: 3), curve: Curves.fastOutSlowIn);
      return;
    }
    currentHomePage.value = homePage;
    switch (homePage) {
      case TypeModel.PAGE_POST:
        if (isAllPostsLoading.value) {
          onRefreshAllPosts();
        }
        break;
      case TypeModel.PAGE_IMPORTANT:
        if (isImportantsLoading.value) {
          onRefreshImportants();
        }
        break;
      case TypeModel.PAGE_BIRTH_MONTH:
        if (isBirthMonthLoading.value) {
          onRefreshBirthMonth();
        }
        break;
      default:
    }
  }

  void onRefreshAllPosts() {
    getHomeEvents();
    _getPosts(0);
  }

  void onUpdatePoll(int? postId, int? pollId, List<int>? anwers) {
    if (pollId == null) {
      return;
    }
    final request = VoteRequest(pollId, anwers ?? []);
    _sendViewed(postId);
    _sendVote(postId, request);
  }

  void onDeleteReaction(PostContent content) => _sendDeleteReaction(content);

  void onUpdateReaction(PostContent content) => _sendUpdateReaction(content);

  void onViewEvent(PostContent postContent) {
    final isIncrease = postContent.task?.increaseViewer() ?? false;
    listAllPosts.refresh();
    if (isIncrease) {
      _sendViewed(postContent.task?.id);
    }
    if (postContent.task?.referenceId != null) {
      _callPostEventDetail(postContent.task!.referenceId!);
    }
  }

  void onThumbEvent(int index) {
    carouselController.jumpToPage(index);
  }

  void onPostDetail(PostContent content, bool showKeyboard) {
    final isIncrease = content.task?.increaseViewer() ?? false;
    listAllPosts.refresh();
    if (isIncrease) {
      _sendViewed(content.task?.id);
    }
    content.showKeyboardComment = showKeyboard;
    Get.toNamed(SicixRoutes.POST_DETAIL, arguments: content);
  }

  Future onPostDetailById(int? id) async {
    // final isIncrease = content.task?.increaseViewer() ?? false;
    // listAllPosts.refresh();
    // if (isIncrease) {
    //   _sendViewed(content.task?.id);
    // }
    // content.showKeyboardComment = showKeyboard;
    // Get.toNamed(SicixRoutes.POST_DETAIL, arguments: content);
    if (id == null) {
      return;
    }
    var postContent =
        listAllPosts.firstWhereOrNull((element) => element.task?.id == id);
    if (postContent != null) {
      await Get.toNamed(SicixRoutes.POST_DETAIL, arguments: postContent);
    } else {
      postContent = await _callGetPostDetailById(id);
      if (postContent != null) {
        await Get.toNamed(SicixRoutes.POST_DETAIL, arguments: postContent);
      }
    }
  }

  void onLoadingAllPosts() => _getPosts(_pageAllPosts + 1);

  void onRefreshImportants() => _getImportants(0);

  void onLoadingImportants() => _getImportants(_pageImportants + 1);

  void onRefreshEvents() => _getEvents(0);

  void onLoadingEvents() => _getEvents(_pageEvents + 1);

  void onRefreshBirthMonth() => _getBirthMonth();

  /* Function */

  void _refreshPage() {
    currentHomePage.value = TypeModel.PAGE_POST;

    listAllPosts.clear();
    listHomeEvents.clear();
    isAllPostsLoading.value = true;
    isMoreAllPosts.value = true;
    _pageAllPosts = 0;
    sliderCurrentIndex.value = 0;

    listImportants.clear();
    isImportantsLoading.value = true;
    isMoreImportants.value = true;
    _pageImportants = 0;

    listEvents.clear();
    isEventsLoading.value = true;
    isMoremEvents.value = true;
    _pageEvents = 0;

    isBirthMonthLoading.value = true;

    onRefreshAllPosts();
  }

  void _updateAllPostsRefreshController(int page, {bool isError = false}) {
    if (page == 0) {
      isError
          ? allPostsRefreshController.refreshFailed()
          : allPostsRefreshController.refreshCompleted();
    } else {
      isError
          ? allPostsRefreshController.loadFailed()
          : allPostsRefreshController.loadComplete();
    }
  }

  void _updateImportantsRefreshController(int page, {bool isError = false}) {
    if (page == 0) {
      isError
          ? importantsRefreshController.refreshFailed()
          : importantsRefreshController.refreshCompleted();
    } else {
      isError
          ? importantsRefreshController.loadFailed()
          : importantsRefreshController.loadComplete();
    }
  }

  void _updateEventsRefreshController(int page, {bool isError = false}) {
    if (page == 0) {
      isError
          ? eventsRefreshController.refreshFailed()
          : eventsRefreshController.refreshCompleted();
    } else {
      isError
          ? eventsRefreshController.loadFailed()
          : eventsRefreshController.loadComplete();
    }
  }

  void _updateBirthMonthRefreshController({bool isError = false}) {
    isError
        ? birthMonthRefreshController.refreshFailed()
        : birthMonthRefreshController.refreshCompleted();
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

  bool isToday(DateTime? compareDate) {
    if (compareDate == null) {
      return false;
    }
    final today = DateTime.now();
    return today.day == compareDate.day && today.month == compareDate.month;
  }

  /* API */

  Future<void> getHomeEvents() async {
    await _sicixUIRepository
        .getPosts(
            0, 10, CommonConstants.sortDateDesc, ConditionsRequest.event(today))
        .then((response) async {
      if (!response.success) {
        await DialogUtil.createDialogMessage(
          title: 'notify.title'.tr,
          message: response.message ?? 'notify.error'.tr,
        );
      }
      final postContents = response.data?.content ?? [];
      await Future.forEach(postContents, (PostContent postContent) async {
        final attachmentItems = await _getAttachment(postContent);
        postContent.attachmentItems = attachmentItems ?? [];
        if ((postContent.task?.useDelegate ?? false) &&
            postContent.task?.groupId != null) {
          postContent.workgroup =
              await UserInfoService.getWorkgroup(postContent.task?.groupId);
        }

        listHomeEvents.add(postContent);
      });

      listHomeEvents.refresh();
    }).catchError((onError) {
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }

  Future<void> _getPosts(int page) async {
    await _sicixUIRepository
        .getPosts(page, CommonConstants.defaultSize,
            CommonConstants.sortDateDesc, ConditionsRequest.post(today))
        .then((response) async {
      if (response.success) {
        _updateAllPostsRefreshController(page);
        if (page == 0) {
          listAllPosts.clear();
        }

        final postContents = response.data?.content ?? [];
        await Future.forEach(postContents, (PostContent postContent) async {
          final attachmentItems = await _getAttachment(postContent);
          postContent.attachmentItems = attachmentItems ?? [];
          if ((postContent.task?.useDelegate ?? false) &&
              postContent.task?.groupId != null) {
            postContent.workgroup =
                await UserInfoService.getWorkgroup(postContent.task?.groupId);
          }

          listAllPosts.add(postContent);
        });

        _pageAllPosts = page;
        isMoreAllPosts.value = response.data?.isMore() ?? false;
      } else {
        _updateAllPostsRefreshController(page, isError: true);
        if (response.message?.isNotEmpty ?? false) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: response.message!);
        }
      }
      isAllPostsLoading.value = false;
    }).catchError((onError) {
      _updateAllPostsRefreshController(page, isError: true);
      isAllPostsLoading.value = false;
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }

  Future<void> _getImportants(int page) async {
    await _sicixUIRepository
        .getPosts(page, CommonConstants.defaultSize,
            CommonConstants.sortDateDesc, ConditionsRequest.important())
        .then((response) async {
      if (response.success) {
        _updateImportantsRefreshController(page);
        if (page == 0) {
          listImportants.clear();
        }

        final postContents = response.data?.content ?? [];
        await Future.forEach(postContents, (PostContent postContent) async {
          final attachmentItems = await _getAttachment(postContent);
          postContent.attachmentItems = attachmentItems ?? [];

          if ((postContent.task?.useDelegate ?? false) &&
              postContent.task?.groupId != null) {
            postContent.workgroup =
                await UserInfoService.getWorkgroup(postContent.task?.groupId);
          }

          listImportants.add(postContent);
        });

        _pageImportants = page;
        isMoreImportants.value = response.data?.isMore() ?? false;
      } else {
        _updateImportantsRefreshController(page, isError: true);
        if (response.message?.isNotEmpty ?? false) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: response.message!);
        }
      }
      isImportantsLoading.value = false;
    }).catchError((onError) {
      isImportantsLoading.value = false;
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }

  Future<void> _getEvents(int page) async {
    await _sicixUIRepository
        .getPosts(page, CommonConstants.defaultSize,
            CommonConstants.sortDateDesc, ConditionsRequest.event(today))
        .then((response) async {
      if (response.success) {
        if (page == 0) {
          listEvents.clear();
        }

        final postContents = response.data?.content ?? [];
        await Future.forEach(postContents, (PostContent postContent) async {
          final attachmentItems = await _getAttachment(postContent);
          postContent.attachmentItems = attachmentItems ?? [];
          listEvents.add(postContent);
        });

        _pageEvents = page;
        isMoremEvents.value = response.data?.isMore() ?? false;
        _updateEventsRefreshController(page);
      } else {
        _updateEventsRefreshController(page, isError: true);
        if (response.message?.isNotEmpty ?? false) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: response.message!);
        }
      }
    }).catchError((onError) {
      _updateEventsRefreshController(page, isError: true);
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
    Future.delayed(
      const Duration(milliseconds: 100),
      () => isEventsLoading.value = false,
    );
  }

  Future<void> _callPostEventDetail(int referenceId) async {
    await EasyLoading.show();
    await _sicixUIRepository.postDetail(referenceId).then((response) async {
      await EasyLoading.dismiss();
      if (response.success && response.data != null) {
        final isIncrease = response.data!.task?.increaseViewer() ?? false;
        listAllPosts.refresh();
        if (isIncrease) {
          _sendViewed(response.data!.task?.id);
        }
        await Get.toNamed(SicixRoutes.POST_DETAIL, arguments: response.data!);
      }

      // else if (response.message != null) {
      //   await DialogUtil.createDialogMessage(
      //     title: 'notify.title'.tr,
      //     message: response.message!,
      //   );
      // }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }

  Future<PostContent?> _callGetPostDetailById(int referenceId) async {
    return _sicixUIRepository.postDetail(referenceId).then((response) async {
      if (response.success) {
        final isIncrease = response.data!.task?.increaseViewer() ?? false;
        if (isIncrease) {
          _sendViewed(response.data!.task?.id);
        }
        return response.data;
      } else {
        return null;
      }
    }).catchError((onError) {
      return null;
    });
  }

  Future<List<AttachmentItem>?> _getAttachment(PostContent postContent) async {
    final postId = postContent.task?.id;
    if (postId == null) {
      return null;
    }
    final attachments =
        await _sicixUIRepository.getAttachment(postId).then((response) async {
      if (response.success) {
        final attachments = response.data ?? [];
        return attachments;
      } else {
        printError(
            info: 'getAttachment $postId\n${response.message ?? 'error'}');
        return null;
      }
    }).catchError((onError) {
      printError(info: 'getAttachment $postId\n${onError.toString()}');
      return null;
    });

    if (attachments == null) {
      return null;
    }

    await Future.forEach(attachments, (AttachmentItem attachment) async {
      final id = attachment.file?.id;
      if (id != null && AppUtil.isVideo(attachment.file?.name ?? '')) {
        final mediaFile = await _getMediaFileInfo(id);
        if (mediaFile != null) {
          if (mediaFile.contentType != null) {
            attachment.file?.contentType = mediaFile.contentType;
          }
          attachment.file?.ref = mediaFile.ref;
        }
      }
    });

    return attachments;
  }

  Future<MediaFile?> _getMediaFileInfo(String id) async {
    return _sicixUIRepository.mediaFileInfo(id).then((response) async {
      if (response.success) {
        printInfo(
            info:
                '_getMediaFileInfo $id ${response.data?.toJson().toString()}');
        return response.data;
      } else {
        return null;
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      return null;
    });
  }

  Future<void> _sendVote(int? postId, VoteRequest request) async {
    await _sicixUIRepository.sendVote(request).then((response) async {
      if (response.success) {
        printInfo(info: 'sendVote ${request.toJson()}');
      } else {
        printError(info: 'sendVote ${request.toJson()} \n ${response.message}');
      }
    }).catchError(
      (onError) {
        printError(
            info: 'sendVote ${request.toJson()} \n ${onError.toString()}');
      },
    );
  }

  void _sendViewed(int? postId) {
    if (postId == null) {
      return;
    }
    _sicixUIRepository.viewed(postId).then((response) {
      if (response.success) {
        printInfo(info: 'sendViewed $postId');
      } else {
        printError(info: 'sendViewed $postId\n${response.message}');
      }
    }).catchError((onError) {
      printError(info: 'sendViewed $postId\n${onError.toString()}');
    });
  }

  void _sendDeleteReaction(PostContent postContent) {
    final postId = postContent.task?.id;
    if (postId == null) {
      return;
    }
    _sicixUIRepository.deleteReactionPost(postId).then((response) {
      if (response.success) {
        printInfo(info: '_sendDeleteReaction $postId');
      } else {
        printError(info: '_sendDeleteReaction $postId\n${response.message}');
      }
    }).catchError((onError) {
      printError(info: '_sendDeleteReaction $postId\n${onError.toString()}');
    });
  }

  void _sendUpdateReaction(PostContent postContent) {
    final postId = postContent.task?.id;
    final reaction = postContent.task?.reaction?.userReaction;
    if (postId == null || reaction == null) {
      return;
    }
    _sicixUIRepository.reactionPost(postId, reaction).then((response) {
      if (response.success) {
        printInfo(info: '_sendUpdateReaction $postId $reactive');
      } else {
        printError(info: '_sendUpdateReaction $postId\n${response.message}');
      }
    }).catchError((onError) {
      printError(info: '_sendUpdateReaction $postId\n${onError.toString()}');
    });
  }

  // Future<void> getUserSeen(
  //   int page,
  //   int postId,
  // ) async {
  //   viewCount.value = await _sicixUIRepository.getUserSeen(
  //       postId, true, 0, page, CommonConstants.defaultSize);
  // }

  Future _getBirthMonth() async {
    await _sicixUIRepository.getBirthInMonth().then((response) async {
      if (response.success) {
        listBirthMonth.value = response.data;
        _updateBirthMonthRefreshController();
      } else {
        _updateBirthMonthRefreshController();
        if (response.message?.isNotEmpty ?? false) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: response.message!);
        }
      }
      _updateBirthMonthRefreshController(isError: false);
    }).catchError((onError) {
      _updateBirthMonthRefreshController(isError: true);
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
    Future.delayed(
      const Duration(milliseconds: 100),
      () => isBirthMonthLoading.value = false,
    );
  }

  Future getReactionCount(int id) async {
    final response = await _sicixUIRepository.getUserReactionPost(
        id, Reaction.values.map((e) => e.key).toList().join(','), 0, 100);
    reactionCount.value = response;
    reactionCount.value.data?.forEach((data) async {
      final userInfo = await UserInfoService.getUserProfileHCMFromId(
        data.user?.id ?? '',
        isCache: false,
        onError: (message) {
          printError(info: message);
        },
        onMappingError: (message) {
          printError(info: message);
        },
      );
      data.user?.avatar = userInfo?.avatar;
      reactionCount.refresh();
    });
  }

  Future<void> onShowPostOption(PostContent content) async {
    await showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          'post.detail.option'.tr,
                          style: AppTextStyle.regular().copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.close,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: Get.width,
                  height: 1,
                  color: Colors.black12,
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                          Clipboard.setData(
                              ClipboardData(text: content.task?.name ?? ''));
                          DialogUtil.createDialogMessage(
                            title: 'notify.title'.tr,
                            message: 'home.page.copy.success'.tr,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: Text(
                            'home.page.copy'.tr,
                            style: AppTextStyle.regular(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
