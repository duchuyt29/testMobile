import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ui_api/sicix_api/models/common/reaction_model.dart'
    as reaction_define;
import 'package:ui_api/sicix_api/models/home/comment.dart';
import 'package:ui_api/sicix_api/models/media_file/media_file.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/constants/arguments.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/services/user_info_service.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/utils/bottom_sheet_util.dart';
import '../../../../../shared/utils/focus.dart';
import '../../../../../shared/widgets/custom_reaction.dart';
import '../../../../../shared/widgets/reaction_button/flutter_reaction_button.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_preview_horizontal_media.dart';
import '../../../../../shared/widgets/widget_reaction.dart';
import '../../../../../shared/widgets/widget_user_avatar.dart';
import '../controller/post_detail_controller.dart';

class CommentCell extends StatefulWidget {
  final Comment comment;
  final Function(Comment)? onReplyPress;
  final Function(Comment comment)? onDeleteReaction;
  final Function(Comment comment)? onUpdateReaction;

  const CommentCell({
    Key? key,
    required this.comment,
    this.onReplyPress,
    this.onDeleteReaction,
    this.onUpdateReaction,
  }) : super(key: key);

  @override
  State<CommentCell> createState() => _CommentCellState();
}

class _CommentCellState extends State<CommentCell>
    with TickerProviderStateMixin {
  String avatar = '';
  String name = '';

  late GlobalObjectKey<FacePileState> _reactionGlobalKey;
  TabController? tabController;

  @override
  void initState() {
    avatar = widget.comment.createBy?.getAvatar() ?? '';
    name = widget.comment.createBy?.fullName ?? '';
    super.initState();
    _reactionGlobalKey =
        GlobalObjectKey<FacePileState>(widget.comment.id ?? '');

    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetUserAvatar(
              border: 0.5,
              avatar: avatar,
              name: name,
              userId: widget.comment.createBy?.id ?? '',
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: AppTextStyle.heavy(fontSize: 16),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          timeago.format(
                              widget.comment.createDate ?? DateTime.now(),
                              locale: 'locale'.tr),
                          maxLines: 1,
                          style: AppTextStyle.regular(
                              color: AppColor.sevenTextColorLight),
                        ),
                      ),
                    ],
                  ),
                  _buildComment(widget.comment.content ?? ''),
                  (widget.comment.attachments?.isEmpty ?? true)
                      ? Container()
                      : WidgetPreviewHorizontalMedia(
                          height: 100,
                          margin: const EdgeInsets.only(right: 20, top: 10),
                          files: widget.comment.attachments ?? [],
                          onPressed: _openUrl,
                        ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 52),
          child: Row(
            children: [
              ReactionButton<String>(
                onReactionChanged: (value) =>
                    _reactionPress(value, widget.comment),
                reactions: WidgetReaction.reactions(displayReactionIcon: false),
                initialReaction: Reaction<String>(
                  value: widget.comment.reaction?.userReaction,
                  enabled: true,
                  icon: WidgetReaction.buildReactionStatus(
                    widget.comment.reaction?.userReaction ?? '',
                    displayReactionIcon: false,
                  ),
                ),
                boxColor: Colors.white,
                boxRadius: 10,
                boxDuration: const Duration(milliseconds: 100),
                itemScaleDuration: const Duration(milliseconds: 100),
              ),
              TextButton(
                onPressed: () => widget.onReplyPress?.call(widget.comment),
                child: Text(
                  'post.detail.reply'.tr,
                  style: AppTextStyle.regular(),
                ),
              ),
              Visibility(
                visible: (widget.comment.reaction?.reactionCount ?? 0) > 0,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: _showViewsWidget,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 80),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          FacePile(
                            key: _reactionGlobalKey,
                            contents: widget.comment.reaction,
                          ),
                          Container(
                            transform: Matrix4.translationValues(
                                _calculatorReactionCountPadding(widget.comment),
                                0,
                                0),
                            child: Text(
                              '${widget.comment.reaction?.totalReaction ?? 0}',
                              style: AppTextStyle.regular(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildComment(String comment) {
    if (comment.isEmpty) {
      return Container();
    }
    final textSpans = <InlineSpan>[];
    final regex = RegExp(
        r'\@\[[A-Za-z0-9\u00E0-\u1EF5\ ]{1,999}\]\((\w+)\-(\w+)\-(\w+)\-(\w+)\-(\w+)\)');
    final Iterable<Match> matches = regex.allMatches(comment);
    var start = 0;
    for (final match in matches) {
      textSpans.add(TextSpan(text: comment.substring(start, match.start)));

      final userRegex = RegExp(r'\@\[[A-Za-z0-9\u00E0-\u1EF5\ ]{1,999}\]');
      userRegex.allMatches(match.group(0) ?? '').forEach((element) {
        textSpans.add(WidgetSpan(
            child: Text(
          '${element.group(0)?.replaceAll('[', '').replaceAll(']', '')}',
          style: AppTextStyle.regular(color: AppColor.stateInfoColor),
        )));
      });
      start = match.end;
    }
    textSpans.add(TextSpan(text: comment.substring(start, comment.length)));
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text.rich(
        TextSpan(children: textSpans),
        style: AppTextStyle.regular(),
      ),
    );
  }

  Widget buildExercises(BuildContext context) {
    final controller = Get.find<PostDetailController>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            isScrollable: true,
            onTap: (v) {
              controller.indexTab.value = v;
              controller.onSelectTab(v, widget.comment.id ?? '');
            },
            labelColor: Colors.black,
            labelStyle: AppTextStyle.regular(color: Colors.black),
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
                            avatar: '',
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

  List<Tab> _buildReactionTab() {
    final controller = Get.find<PostDetailController>();
    final tabs = <Tab>[];
    tabs.add(Tab(
      text:
          '${'reaction.all'.tr} ${controller.reactionCount.value.data!.length}',
    ));
    final reactionTab = <reaction_define.Reaction>[];
    reaction_define.Reaction.values.forEach((type) {
      final count = controller.calculatorReactionCount(type);
      if (count > 0) {
        reactionTab.add(type);
        tabs.add(Tab(
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                type.avatarUrl,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              Text('$count')
            ],
          ),
        ));
      }
    });
    controller.reactionTab.value = reactionTab;
    return tabs;
  }

  /* Action */

  Future _showViewsWidget() async {
    AppFocus.unFocus();
    final controller = Get.find<PostDetailController>();
    await controller.getReactionCommentCount(widget.comment.id ?? '');

    tabController =
        TabController(length: controller.calculatorReactionTab(), vsync: this);
    await BottomSheetUtil.showBottomSheet(
      child: buildExercises(context),
    );
  }

  void _reactionPress(String? value, Comment comment) {
    AppFocus.unFocus();
    if (comment.reaction?.userReaction == value) {
      setState(() {
        comment.reaction?.userReaction = '';
        comment.reaction?.removeReaction(value);
      });
      widget.onDeleteReaction?.call(comment);
    } else {
      setState(() {
        if (comment.reaction == null) {
          comment.reaction = reaction_define.ReactionModel(userReaction: value);
        } else {
          comment.reaction?.removeReaction(comment.reaction?.userReaction);
          comment.reaction?.userReaction = value;
        }
        comment.reaction?.addReaction(value);
      });
      widget.onUpdateReaction?.call(comment);
    }
    _reactionGlobalKey.currentState?.reloadReaction();
  }

  /* Function */

  double _calculatorReactionCountPadding(Comment comment) {
    final reactionCount = comment.reaction?.reactionCount ?? 0;
    if (reactionCount == 0) {
      return 0;
    }
    return -20 - (reactionCount - 1) * 6;
  }

  List<String> extractHashtags(String text) {
    final Iterable<Match> matches =
        RegExp(r'\B(\@[a-zA-Z]+\b)').allMatches(text);
    return matches.map((m) => m[0] ?? '').toList();
  }

  Future _openUrl(MediaFile mediaFile) async {
    if (mediaFile.isImage()) {
      await Get.toNamed(SicixRoutes.IMAGE_PREIEW, arguments: {
        NAME_ARGUMENT: mediaFile.name,
        IMAGE_ARGUMENT: mediaFile.getMediaFilePath(),
      });
    } else {
      await launchUrlString(
        mediaFile.getMediaFilePath(),
        mode: LaunchMode.externalApplication,
      );
    }

    // final url = attachment.getMediaFilePath();
    // printInfo(info: url);
    // await launchUrlString(url, mode: LaunchMode.externalApplication);
  }

  Future _loadUser() async {
    final userId = widget.comment.createBy?.id ?? '';
    final user = await UserInfoService.getUserProfileHCMFromId(userId,
        onError: (message) {
      printError(info: message);
    }, onMappingError: (message) {
      printError(info: message);
    });
    if (user != null) {
      setState(() {
        avatar = user.getAvatar();
        name = user.getName();
      });
    }
  }
}
