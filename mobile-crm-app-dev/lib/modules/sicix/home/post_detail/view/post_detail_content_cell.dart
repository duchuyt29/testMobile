import 'package:flutter/material.dart';
import 'package:ui_api/sicix_api/models/home/post_content.dart';

import '../../home/views/home_comment_info.dart';
import '../../home/views/home_post_content_cell.dart';
import '../../home/views/home_post_deadline_cell.dart';
import '../../home/views/home_post_polls_content_cell.dart';
import '../../home/views/home_user_info.dart';

class PostDetailContentCell extends StatelessWidget {
  final PostContent content;
  final Function(int? postId, int? pollId, List<int>? anwers) onUpdatePoll;
  final Function(PostContent content) onDeleteReaction;
  final Function(PostContent content) onUpdateReaction;

  const PostDetailContentCell(
      {Key? key,
      required this.content,
      required this.onUpdatePoll,
      required this.onDeleteReaction,
      required this.onUpdateReaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeUserInfo(content: content),
          HomePostDeadlineCell(content: content),
          HomePostContentCell(
            content: content,
            isMax: true,
          ),
          (content.task?.polls?.isNotEmpty ?? false)
              ? HomePostPollsContentCell(
                  content: content,
                  onUpdatePoll: onUpdatePoll,
                )
              : Container(),
          HomeCommentInfo(
            content: content,
            onDeleteReaction: onDeleteReaction,
            onUpdateReaction: onUpdateReaction,
          ),
        ],
      ),
    );
  }
}
