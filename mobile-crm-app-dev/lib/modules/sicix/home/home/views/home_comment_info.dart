import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/common/reaction_model.dart'
    as reaction_define;
import 'package:ui_api/sicix_api/models/home/post_content.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../shared/utils/focus.dart';
import '../../../../../shared/widgets/bottom_sheet/widget_post_views.dart';
import '../../../../../shared/widgets/custom_reaction.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/reaction_button/flutter_reaction_button.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_reaction.dart';
import '../controllers/home_controller.dart';

class HomeCommentInfo extends StatefulWidget {
  final PostContent content;
  final Function(PostContent content) onDeleteReaction;
  final Function(PostContent content) onUpdateReaction;
  final Function()? onCommentPress;

  HomeCommentInfo({
    Key? key,
    required this.content,
    required this.onDeleteReaction,
    required this.onUpdateReaction,
    this.onCommentPress,
  }) : super(key: key);

  @override
  State<HomeCommentInfo> createState() => _HomeCommentInfoState();
}

class _HomeCommentInfoState extends State<HomeCommentInfo>
    with TickerProviderStateMixin {
  final _reactionGlobalKey = GlobalKey<FacePileState>();

  TabController? tabController;
  int tabIndex = 0;

  void onSelect(int v) {
    setState(() {
      tabIndex = v;
    });
  }

  void _reactionPress(String? value) {
    if (widget.content.task?.reaction?.userReaction == value) {
      setState(() {
        widget.content.task?.reaction?.userReaction = '';
        widget.content.task?.reaction?.removeReaction(value);
      });
      widget.onDeleteReaction(widget.content);
    } else {
      setState(() {
        if (widget.content.task?.reaction == null) {
          widget.content.task?.reaction =
              reaction_define.ReactionModel(userReaction: value);
        } else {
          widget.content.task?.reaction
              ?.removeReaction(widget.content.task?.reaction?.userReaction);
          widget.content.task?.reaction?.userReaction = value;
        }
        widget.content.task?.reaction?.addReaction(value);
      });
      widget.onUpdateReaction(widget.content);
    }
    _reactionGlobalKey.currentState?.reloadReaction();
  }

  Future<void> _openExercisesDialog() async {
    AppFocus.unFocus();
    final controller = Get.find<HomeController>();
    await controller.getReactionCount(widget.content.task?.id ?? 0);

    tabController =
        TabController(length: controller.calculatorReactionTab(), vsync: this);
    await BottomSheetUtil.showBottomSheet(
      child: buildExercises(context),
    );
  }

  List<Tab> _buildReactionTab() {
    final controller = Get.find<HomeController>();
    final tabs = <Tab>[];
    tabs.add(
      Tab(
        child: Text(
          '${'reaction.all'.tr} ${controller.reactionCount.value.data!.length}',
          style: AppTextStyle.heavy(
            fontSize: 14,
            color: AppColor.sixTextColorLight,
          ),
        ),
      ),
    );
    final reactionTab = <reaction_define.Reaction>[];
    reaction_define.Reaction.values.forEach((type) {
      final count = controller.calculatorReactionCount(type);
      if (count > 0) {
        reactionTab.add(type);
        tabs.add(Tab(
          child: Row(
            children: [
              FCoreImage(type.avatarUrl, width: 21),
              const SizedBox(width: 4),
              Text(
                '$count',
                style: AppTextStyle.regular(
                  fontSize: 13,
                  color: AppColor.sixTextColorLight,
                ),
              )
            ],
          ),
        ));
      }
    });
    controller.reactionTab.value = reactionTab;
    return tabs;
  }

  double get _calculatorReactionCountPadding {
    final reactionCount = widget.content.task?.reaction?.reactionCount ?? 0;
    if (reactionCount == 0) {
      return 0;
    }
    return 20 + (reactionCount - 1) * 6;
    // switch (reactionCount) {
    //   case 1:
    //     return 20;
    //   case 2:
    //     return 25;
    //   default:
    //     return reactionCount * 10;
    // }
  }

  @override
  Widget build(BuildContext context) {
    final reactionCount = widget.content.task?.reaction?.totalReaction ?? 0;
    // Get.find<HomeController>()
    //     .calculatorReaction(widget.content.task?.reaction);
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 80),
                child: GestureDetector(
                  onTap: _openExercisesDialog,
                  child: Visibility(
                    visible: reactionCount > 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        FacePile(
                          key: _reactionGlobalKey,
                          contents: widget.content.task?.reaction,
                        ),
                        Container(
                          transform: Matrix4.translationValues(
                              _calculatorReactionCountPadding, 0.0, 0.0),
                          child: Text(
                            '$reactionCount',
                            style: AppTextStyle.regular(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    'home.comments.count'
                        .trArgs([widget.content.task?.commentCount ?? '0']),
                    style: AppTextStyle.regular(),
                  ),
                  GestureDetector(
                    onTap: () async {
                      AppFocus.unFocus();
                      // await Get.find<HomeController>()
                      //     .getUserSeen(0, widget.content.task?.id ?? 0);
                      await BottomSheetUtil.showBottomSheet(
                          child: WidgetPostViews(widget.content));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 10),
                          Icon(
                            Icons.remove_red_eye_outlined,
                            color:
                                (widget.content.task?.viewers?.hasView ?? false)
                                    ? AppColor.eightTextColorLight
                                    : AppColor.primaryTextColor,
                            size: 18,
                          ),
                          Text(
                            ' ${widget.content.task?.viewers?.view ?? 0}',
                            style: AppTextStyle.regular(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Builder(
                builder: (ctx) {
                  return ReactionButton<String>(
                    onReactionChanged: _reactionPress,
                    reactions: WidgetReaction.reactions(),
                    initialReaction: Reaction<String>(
                      value: widget.content.task?.reaction?.userReaction,
                      enabled: true,
                      icon: WidgetReaction.buildReactionStatus(
                          widget.content.task?.reaction?.userReaction ?? ''),
                    ),
                    // boxOffset: Offset.zero,
                    boxColor: Colors.white,
                    boxRadius: 10,
                    boxDuration: const Duration(milliseconds: 100),
                    itemScaleDuration: const Duration(milliseconds: 100),
                  );
                },
              ),
              TextButton(
                onPressed: widget.onCommentPress,
                child: Row(children: [
                  FCoreImage(IconConstants.icComment, width: 16),
                  const SizedBox(width: 8),
                  Text(
                    'home.comment'.tr,
                    style: AppTextStyle.regular(),
                  )
                ]),
              ),
            ],
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }

  Widget buildExercises(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            isScrollable: true,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 1.5,
                color: AppColor.primaryColor,
              ),
            ),
            onTap: (v) {
              controller.indexTab.value = v;
              controller.onSelectTab(v, widget.content.task?.id ?? 0);
            },
            controller: tabController,
            tabs: _buildReactionTab(),
          ),
          Obx(
            () => Container(
              height: 300,
              child: ListView.builder(
                  itemCount: controller.reactionCount.value.data!.length,
                  itemBuilder: (context, i) {
                    final item = controller.reactionCount.value.data![i];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          WidgetAvatar(
                            size: 32,
                            isUrl: false,
                            name: item.user?.fullName ?? '',
                            avatar: item.user?.getAvatar(),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(item.user?.fullName ?? ''),
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  // Widget buildViews() {
  //   final controller = Get.find<HomeController>();
  //   return Container(
  //     height: 300,
  //     child: Column(
  //       children: [
  //         Container(
  //           margin: const EdgeInsets.symmetric(horizontal: 20),
  //           child: Stack(
  //             alignment: Alignment.center,
  //             children: [
  //               Text(
  //                 // ' ${widget.content.task?.viewers?.view ?? 0}',
  //                 // '${'home.comment.views'.tr} (${controller.viewCount.value.data?.content.length ?? 0})',
  //                 'home.comment.views'
  //                     .trArgs(['${widget.content.task?.viewers?.view ?? 0}']),
  //                 style: AppTextStyle.heavy(),
  //               ),
  //               Align(
  //                 alignment: Alignment.centerRight,
  //                 child: IconButton(
  //                   onPressed: Get.back,
  //                   icon: FCoreImage(
  //                     IconConstants.iconClose,
  //                     color: AppColor.neutral1,
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         Obx(
  //           () => Expanded(
  //             child: ListView.builder(
  //               itemCount: controller.viewCount.value.data?.content.length,
  //               itemBuilder: (context, i) {
  //                 final item = controller.viewCount.value.data?.content[i];
  //                 return Padding(
  //                   padding:
  //                       const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
  //                   child: Row(
  //                     children: [
  //                       WidgetAvatar(
  //                         size: 30,
  //                         isUrl: false,
  //                         name: item?.user?.fullName ?? '',
  //                         avatar: item?.user?.getAvatar(),
  //                       ),
  //                       const SizedBox(
  //                         width: 8,
  //                       ),
  //                       Text(
  //                         item?.user?.fullName ?? '',
  //                         style: AppTextStyle.regular(fontSize: 18),
  //                       ),
  //                     ],
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
