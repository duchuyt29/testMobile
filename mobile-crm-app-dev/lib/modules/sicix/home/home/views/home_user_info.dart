import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/home/post_content.dart';
import 'package:ui_api/sicix_api/repository/sicix_ui_repository.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/services/user_info_service.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_user_avatar.dart';

enum Menu { itemOne }

class HomeUserInfo extends StatefulWidget {
  final PostContent content;

  const HomeUserInfo({Key? key, required this.content}) : super(key: key);

  @override
  State<HomeUserInfo> createState() => _HomeUserInfoState();
}

class _HomeUserInfoState extends State<HomeUserInfo> {
  String avatar = '';
  String name = '';

  @override
  void initState() {
    avatar = widget.content.getUserAvatar();
    name = widget.content.getUserName();
    super.initState();

    if (widget.content.workgroup == null) {
      _loadUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _sicixUIRepository = Get.find<SicixUIRepository>();
    return Container(
      padding: const EdgeInsets.only(left: 24),
      child: Row(
        children: [
          WidgetUserAvatar(
            border: 0.5,
            avatar: avatar,
            name: name,
            userId: widget.content.task?.createBy?.id ?? '',
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name, style: AppTextStyle.heavy(fontSize: 16)),
                        const SizedBox(width: 8),
                        widget.content.task?.follow == true
                            ? const Icon(
                                Icons.notifications_active,
                                size: 16,
                              )
                            : Container(),
                      ],
                    ),
                    Text(
                      widget.content.getTime(),
                      style: AppTextStyle.regular(
                          color: AppColor.sevenTextColorLight),
                    ),
                  ],
                ),
              ],
            ),
          ),
          PopupMenuButton<Menu>(
              onSelected: (Menu item) {
                if (widget.content.task!.follow == true) {
                  _sicixUIRepository.unfollowPost(widget.content.task?.id ?? 0);
                } else {
                  _sicixUIRepository.followPost(widget.content.task?.id ?? 0);
                }

                setState(() {
                  widget.content.task?.follow = !widget.content.task!.follow!;
                });
              },
              itemBuilder: (context) => <PopupMenuEntry<Menu>>[
                    PopupMenuItem(
                        value: Menu.itemOne,
                        child: Row(
                          children: [
                            FCoreImage(
                              widget.content.task?.follow == false
                                  ? IconConstants.icOnNoti
                                  : IconConstants.icOffNoti,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            widget.content.task?.follow == false
                                ? Text('home.post.turn.on.notification'.tr)
                                : Text('home.post.turn.off.notification'.tr)
                          ],
                        ))
                  ])
        ],
      ),
    );
  }

  Future _loadUser() async {
    final userId = widget.content.task?.createBy?.id ?? '';
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
