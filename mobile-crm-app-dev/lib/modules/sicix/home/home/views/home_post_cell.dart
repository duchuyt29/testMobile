import 'package:flutter/material.dart';
import 'package:ui_api/sicix_api/models/home/post_content.dart';

import 'home_comment_info.dart';
import 'home_post_content_cell.dart';
import 'home_post_deadline_cell.dart';
import 'home_post_polls_content_cell.dart';
import 'home_user_info.dart';

class HomePostCell extends StatefulWidget {
  final PostContent content;
  final Function(PostContent content, bool showKeyboard) onPostDetail;
  final Function(PostContent content) onLongPress;
  final Function(int? postId, int? pollId, List<int>? anwers) onUpdatePoll;
  final Function(PostContent content) onDeleteReaction;
  final Function(PostContent content) onUpdateReaction;

  HomePostCell({
    Key? key,
    required this.content,
    required this.onPostDetail,
    required this.onLongPress,
    required this.onUpdatePoll,
    required this.onDeleteReaction,
    required this.onUpdateReaction,
  }) : super(key: key);

  @override
  State<HomePostCell> createState() => _HomePostCellState();
}

class _HomePostCellState extends State<HomePostCell> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeUserInfo(content: widget.content),
          InkWell(
            onTap: () => widget.onPostDetail(widget.content, false),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomePostDeadlineCell(content: widget.content),
                HomePostContentCell(
                  content: widget.content,
                  isMax: true,
                  onLongPress: (content) => widget.onLongPress(content),
                  onTap: (content) =>
                      widget.onPostDetail(widget.content, false),
                ),
              ],
            ),
          ),
          (widget.content.task?.polls?.isNotEmpty ?? false)
              ? HomePostPollsContentCell(
                  content: widget.content,
                  onUpdatePoll: (postId, pollId, anwers) {
                    setState(() {
                      final isIncrease =
                          widget.content.task?.increaseViewer() ?? false;
                      widget.onUpdatePoll(
                          isIncrease ? postId : null, pollId, anwers);
                    });
                  },
                )
              : Container(),
          HomeCommentInfo(
            content: widget.content,
            onUpdateReaction: widget.onUpdateReaction,
            onDeleteReaction: widget.onDeleteReaction,
            onCommentPress: () {
              widget.onPostDetail.call(widget.content, true);
            },
          ),
        ],
      ),
    );
  }
}
