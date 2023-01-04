import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/home/post_content.dart';

import '../../../../../shared/services/user_info_service.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/widget_avatar.dart';

enum Menu { itemOne }

class HomePageImporttantCell extends StatefulWidget {
  final PostContent content;
  final GestureTapCallback? onTap;

  const HomePageImporttantCell(this.content, {Key? key, this.onTap})
      : super(key: key);

  @override
  State<HomePageImporttantCell> createState() => _HomePageImporttantCellState();
}

class _HomePageImporttantCellState extends State<HomePageImporttantCell> {
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
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 24, right: 24),
        child: Row(
          children: [
            WidgetAvatar(
              border: 0.5,
              size: 48,
              isUrl: false,
              name: name,
              avatar: avatar,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyle.heavy(fontSize: 16),
                  ),
                  Text(
                    widget.content.task?.name ?? '',
                    style: AppTextStyle.regular(fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
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
