import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/sicix_api/models/home/post_content.dart';
import 'package:ui_api/sicix_api/repository/sicix_ui_repository.dart';
import 'package:ui_api/sicix_api/request/conditions_request.dart';

import '../../../../../shared/constants/common.dart';
import '../../../../../shared/utils/dialog_util.dart';

class PostSearchController extends GetxController {
  final _sicixUIRepository = Get.find<SicixUIRepository>();

  final scrollController = ScrollController();
  final searchController = TextEditingController();

  final today = DateTime.now();
  final allPostsRefreshController = RefreshController();
  final listAllPosts = RxList<PostContent>([]);
  final isAllPostsLoading = RxBool(true);
  final isMoreAllPosts = RxBool(true);
  int _pageAllPosts = 0;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is String) {
      searchController.text = Get.arguments;
      onRefreshAllPosts();
    }
  }

  void onRefreshAllPosts() {
    getSearchPosts(0);
  }

  void onLoadingAllPosts() => getSearchPosts(_pageAllPosts + 1);

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

  Future<void> getSearchPosts(int page) async {
    final query = searchController.text;
    if (query.isEmpty) {
      listAllPosts.value = [];
      isMoreAllPosts.value = false;
      _pageAllPosts = page;
      isAllPostsLoading.value = true;
      listAllPosts.refresh();
      return;
    }
    await _sicixUIRepository
        .getPosts(
            page,
            CommonConstants.defaultSize,
            CommonConstants.sortDateDesc,
            ConditionsRequest.search(today, query))
        .then((response) async {
      if (response.success) {
        _updateAllPostsRefreshController(page);
        if (page == 0) {
          listAllPosts.value = response.data?.content ?? [];
        } else {
          listAllPosts.addAll(response.data?.content ?? []);
        }
        listAllPosts.refresh();
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
}
