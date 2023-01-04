import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/sicix_api/models/home/post_content.dart';
import 'package:ui_api/sicix_api/models/home/user_reaction.dart';
import 'package:ui_api/sicix_api/repository/sicix_ui_repository.dart';

import '../../../resource/assets_constant/icon_constants.dart';
import '../../constants/colors.dart';
import '../../constants/common.dart';
import '../../styles/text_style/text_style.dart';
import '../../utils/dialog_util.dart';
import '../image_widget/fcore_image.dart';
import '../widget_avatar.dart';
import '../widget_scrollview_refresher.dart';
import '../widget_user_avatar.dart';

class WidgetPostViews extends StatefulWidget {
  final PostContent postContent;

  WidgetPostViews(this.postContent, {Key? key}) : super(key: key);

  @override
  State<WidgetPostViews> createState() => _WidgetPostViewsState();
}

class _WidgetPostViewsState extends State<WidgetPostViews> {
  final _sicixUIRepository = Get.find<SicixUIRepository>();

  final _refreshController = RefreshController();

  final _viewers = <UserReaction>[];
  bool _isMore = true;
  int _page = 0;

  int total = 0;

  @override
  void initState() {
    total = widget.postContent.task?.viewers?.view ?? 0;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshController.requestRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 3 * 2,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  'home.comment.views'.trArgs([total.toString()]),
                  style: AppTextStyle.heavy(),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: Get.back,
                    icon: FCoreImage(
                      IconConstants.iconClose,
                      color: AppColor.neutral1,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: _buildViewer(),
          ),
        ],
      ),
    );
  }

  Widget _buildViewer() {
    return WidgetScrollviewRefresher(
      refreshController: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      isLoadMore: _isMore,
      child: ListView.builder(
        itemCount: _viewers.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                WidgetUserAvatar(
                  size: 30,
                  userId: _viewers[index].user?.id ?? '',
                  name: _viewers[index].user?.fullName ?? '',
                  avatar: _viewers[index].user?.getAvatar() ?? '',
                ),
                const SizedBox(width: 8),
                Text(
                  _viewers[index].user?.fullName ?? '',
                  style: AppTextStyle.regular(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /* Action */

  void _onRefresh() {
    setState(() {
      _page = 0;
      _isMore = true;
      _viewers.clear();
    });

    _callUserSeen();
  }

  void _onLoading() {
    if (!_isMore) {
      return;
    }
    _page++;
    _callUserSeen();
  }

  /* Function */

  void _updateRefreshController({bool isError = false}) {
    if (_refreshController.isRefresh) {
      isError
          ? _refreshController.refreshFailed()
          : _refreshController.refreshCompleted();
    } else {
      isError
          ? _refreshController.loadFailed()
          : _refreshController.loadComplete();
    }
  }

  /* API */

  Future<void> _callUserSeen() async {
    await _sicixUIRepository
        .getUserSeen(widget.postContent.task?.id ?? -1, _page,
            CommonConstants.defaultSize)
        .then((response) async {
      if (response.success) {
        _updateRefreshController();

        setState(() {
          _isMore = response.data!.isMore();
          _viewers.addAll(response.data?.content ?? []);
          if (response.data?.total != null) {
            total = response.data!.total!;
          }
        });
      } else {
        _updateRefreshController(isError: true);
        if (response.message?.isNotEmpty ?? false) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: response.message!);
        }
      }
    }).catchError((onError) {
      _updateRefreshController(isError: true);
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }
}
