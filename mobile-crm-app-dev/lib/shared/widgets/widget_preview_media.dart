import 'package:flutter/material.dart';
import 'package:ui_api/sicix_api/models/media_file/media_file.dart';

import '../../resource/assets_constant/icon_constants.dart';
import '../constants/colors.dart';
import '../styles/text_style/text_style.dart';
import 'image_widget/fcore_image.dart';

class WidgetPreviewMedia extends StatelessWidget {
  final MediaFile mediaFile;
  final GestureTapCallback? onTap;
  final bool? isName;
  final BorderRadius borderRadius;
  final VoidCallback? onDeleteAttach;

  const WidgetPreviewMedia(this.mediaFile,
      {Key? key,
      this.onTap,
      this.isName,
      this.borderRadius = BorderRadius.zero,
      this.onDeleteAttach})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: (isName ?? false)
          ? Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: _buildPreview(),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    mediaFile.name ?? '',
                    maxLines: 1,
                    style: AppTextStyle.heavy(fontSize: 11),
                  )
                ],
              ),
            )
          : _buildPreview(),
    );
  }

  Widget _buildPreview() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: onDeleteAttach == null
              ? EdgeInsets.zero
              : const EdgeInsets.only(right: 10, left: 10, top: 10),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  FCoreImage(
                    mediaFile.getMediaFilePreview(),
                    width: double.infinity,
                    height: double.infinity,
                    errorWidget: Container(
                      color: AppColor.mediaBackgroundColor,
                      child: Center(
                        child: Icon(
                          Icons.warning_amber_rounded,
                          size: 40,
                          color: AppColor.disabledColor,
                        ),
                      ),
                    ),
                  ),
                  mediaFile.isVideo()
                      ? const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black45,
                          child: Icon(
                            Icons.play_arrow,
                            size: 20,
                            color: Colors.white,
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
        onDeleteAttach == null
            ? Container()
            : IconButton(
                onPressed: onDeleteAttach,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: FCoreImage(
                  IconConstants.icCloseBlack,
                  width: 25,
                  height: 25,
                ),
              )
      ],
    );
    // return ClipRRect(
    //   borderRadius: borderRadius,
    //   child: AspectRatio(
    //     aspectRatio: 1,
    //     child: Stack(
    //       alignment: Alignment.center,
    //       children: [
    //         FCoreImage(
    //           mediaFile.getMediaFilePreview(),
    //           width: double.infinity,
    //           height: double.infinity,
    //           errorWidget: Container(
    //             color: AppColor.mediaBackgroundColor,
    //             child: Center(
    //               child: Icon(
    //                 Icons.warning_amber_rounded,
    //                 size: 40,
    //                 color: AppColor.disabledColor,
    //               ),
    //             ),
    //           ),
    //         ),
    //         mediaFile.isVideo()
    //             ? const CircleAvatar(
    //                 radius: 20,
    //                 backgroundColor: Colors.black45,
    //                 child: Icon(
    //                   Icons.play_arrow,
    //                   size: 20,
    //                   color: Colors.white,
    //                 ),
    //               )
    //             : Container()
    //       ],
    //     ),
    //   ),
    // );
  }
}
