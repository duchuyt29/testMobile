import 'package:flutter/material.dart';
import 'package:ui_api/sicix_api/models/common/reaction_model.dart';

import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class WidgetMessageReaction extends StatelessWidget {
  final ReactionModel reactionModel;
  final Color backgroundColor;

  const WidgetMessageReaction(this.reactionModel, this.backgroundColor,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          (reactionModel.like != null && reactionModel.like! > 0)
              ? _buildReactionItem(Reaction.like.avatarUrl, reactionModel.like!)
              : Container(),
          (reactionModel.love != null && reactionModel.love! > 0)
              ? _buildReactionItem(Reaction.love.avatarUrl, reactionModel.love!)
              : Container(),
          (reactionModel.care != null && reactionModel.care! > 0)
              ? _buildReactionItem(Reaction.care.avatarUrl, reactionModel.care!)
              : Container(),
          (reactionModel.haha != null && reactionModel.haha! > 0)
              ? _buildReactionItem(Reaction.haha.avatarUrl, reactionModel.haha!)
              : Container(),
          (reactionModel.sad != null && reactionModel.sad! > 0)
              ? _buildReactionItem(Reaction.sad.avatarUrl, reactionModel.sad!)
              : Container(),
          (reactionModel.wow != null && reactionModel.wow! > 0)
              ? _buildReactionItem(Reaction.wow.avatarUrl, reactionModel.wow!)
              : Container(),
          (reactionModel.angry != null && reactionModel.angry! > 0)
              ? _buildReactionItem(
                  Reaction.angry.avatarUrl, reactionModel.angry!)
              : Container(),
        ],
      ),
    );
  }

  Widget _buildReactionItem(String icon, int count) {
    return Row(
      children: [
        FCoreImage(icon, height: 20, width: 20),
        count <= 1
            ? Container()
            : Container(
                margin: const EdgeInsets.only(left: 2),
                child: Text(
                  count.toString(),
                  style: AppTextStyle.regular(
                    fontSize: 13,
                    color: AppColor.actionNeutral,
                  ),
                ),
              ),
        const SizedBox(width: 5),
      ],
    );
  }
}
