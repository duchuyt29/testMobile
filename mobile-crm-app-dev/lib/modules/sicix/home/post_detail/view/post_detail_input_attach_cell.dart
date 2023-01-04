import 'package:flutter/material.dart';
import 'package:ui_api/sicix_api/models/attachment/attachment_item.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';

class PostDetailInputAttachCell extends StatelessWidget {
  final AttachmentItem attachmentItem;
  final VoidCallback? onDeleteAttach;

  const PostDetailInputAttachCell(this.attachmentItem,
      {Key? key, this.onDeleteAttach})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Container(
                //   width: 60,
                //   height: 60,
                //   child: IconButton(
                //     onPressed: controller.onAttachFile,
                //     icon: FCoreImage(
                //       IconConstants.icAttachFile,
                //       width: 60,
                //       height: 60,
                //     ),
                //   ),
                // ),
                FCoreImage(
                  IconConstants.icAttachFile,
                  width: 60,
                  height: 60,
                ),
                const SizedBox(width: 10),
                Container(
                  width: 150,
                  child: Text(
                    attachmentItem.name ?? '',
                    style: AppTextStyle.heavy(fontSize: 15),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
          IconButton(
            onPressed: onDeleteAttach,
            icon: FCoreImage(
              IconConstants.icCloseBlack,
              width: 40,
              height: 40,
            ),
          )
        ],
      ),
    );
  }
}
