import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_avatar.dart';

class ConversationCell extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Conversation conversation;

  const ConversationCell(this.conversation, {Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          children: [
            WidgetAvatar(
              size: 64,
              isUrl: true,
              avatar: conversation.getAvatar(),
              name: conversation.getName(),
              isOnline: conversation.partnerOnline,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    conversation.getConversationName(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.heavy(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    conversation.getMessageContent(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.regular(
                      color: AppColor.niceTextColorLight,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  conversation.getTime(),
                  style: AppTextStyle.regular(
                    color: AppColor.niceTextColorLight,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    conversation.notice == 0
                        ? Container(
                            margin: const EdgeInsets.only(
                                top: 4, bottom: 4, right: 4),
                            child: FCoreImage(
                              IconConstants.icMute,
                              width: 16,
                              height: 16,
                            ),
                          )
                        : Container(),
                    if (conversation.current?.unread != 0)
                      Badge(
                        badgeContent: Text(
                          conversation.current?.getUnread() ?? '',
                          style: AppTextStyle.regular(
                              color: AppColor.secondTextColor, fontSize: 11),
                        ),
                        ignorePointer: true,
                        badgeColor: AppColor.badgeColor,
                      ),
                    // (widget.conversation.current?.unread != 0)
                    //     ? WidgeBadge(
                    //         widget.conversation.current?.getUnread() ?? '',
                    //         margin: const EdgeInsets.only(left: 8),
                    //       )
                    //     : Container(),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Future _loadUser() async {
  //   final userId = widget.conversation.partner;
  //   if (userId == null) {
  //     return;
  //   }
  //   final user =
  //       await UserInfoService.getUserProfileFromId(userId, onError: (message) {
  //     printError(info: message);
  //   }, onMappingError: (message) {
  //     printError(info: message);
  //   });
  //   if (user != null) {
  //     setState(() {
  //       avatar = user.getAvatar();
  //       name = user.getName();
  //     });
  //   }
  // }
}
