import 'package:flutter/material.dart';
import 'package:ui_api/sicix_api/models/home/comment.dart';

import 'comment_cell.dart';

class PostDetailCommentCell extends StatefulWidget {
  final Comment comment;
  final Function(Comment)? onReplyPress;
  final Function(Comment comment)? onDeleteReaction;
  final Function(Comment comment)? onUpdateReaction;

  const PostDetailCommentCell({
    Key? key,
    required this.comment,
    this.onReplyPress,
    this.onDeleteReaction,
    this.onUpdateReaction,
  }) : super(key: key);

  @override
  State<PostDetailCommentCell> createState() => _PostDetailCommentCellState();
}

class _PostDetailCommentCellState extends State<PostDetailCommentCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 24, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommentCell(
            comment: widget.comment,
            onReplyPress: widget.onReplyPress,
            onDeleteReaction: widget.onDeleteReaction,
            onUpdateReaction: widget.onUpdateReaction,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children:
                List.generate(widget.comment.subComments?.length ?? 0, (index) {
              return Container(
                margin: const EdgeInsets.only(left: 50),
                child: CommentCell(
                  comment: widget.comment.subComments![index],
                  onReplyPress: widget.onReplyPress,
                  onDeleteReaction: widget.onDeleteReaction,
                  onUpdateReaction: widget.onUpdateReaction,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
