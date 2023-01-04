import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../styles/text_style/text_style.dart';

class WidgetScrollviewRefresher extends StatefulWidget {
  final Widget child;
  final RefreshController refreshController;
  final VoidCallback onLoading;
  final VoidCallback onRefresh;
  final Axis scrollDirection;
  final bool isLoadMore;

  WidgetScrollviewRefresher({
    Key? key,
    required this.refreshController,
    required this.onLoading,
    required this.onRefresh,
    this.scrollDirection = Axis.vertical,
    this.isLoadMore = true,
    required this.child,
  }) : super(key: key);

  @override
  State<WidgetScrollviewRefresher> createState() =>
      _WidgetScrollviewRefresherState();
}

class _WidgetScrollviewRefresherState extends State<WidgetScrollviewRefresher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: widget.isLoadMore,
        header: ClassicHeader(
          idleText: 'scroll.refresher.reload'.tr,
          releaseText: 'scroll.refresher.reload.process'.tr,
          refreshingText: 'scroll.refresher.process'.tr,
          failedText: 'scroll.refresher.failed'.tr,
          completeText: 'scroll.refresher.complete'.tr,
          textStyle: AppTextStyle.regular(),
        ),
        footer: ClassicFooter(
          idleText: 'scroll.refresher.load.more'.tr,
          loadingText: 'scroll.refresher.process'.tr,
          failedText: 'scroll.refresher.failed'.tr,
          noDataText: 'scroll.refresher.no.data'.tr,
          canLoadingText: 'scroll.refresher.load.more'.tr,
          textStyle: AppTextStyle.regular(),
        ),
        controller: widget.refreshController,
        onRefresh: widget.onRefresh,
        onLoading: widget.onLoading,
        scrollDirection: widget.scrollDirection,
        child: widget.child,
      ),
    );
  }
}
