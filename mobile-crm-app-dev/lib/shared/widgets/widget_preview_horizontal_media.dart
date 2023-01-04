import 'package:flutter/material.dart';
import 'package:ui_api/sicix_api/models/media_file/media_file.dart';

import 'widget_preview_media.dart';

class WidgetPreviewHorizontalMedia extends StatefulWidget {
  final double height;
  final EdgeInsetsGeometry? margin;
  final List<MediaFile> files;
  final bool? isName;
  final Function(MediaFile file)? onPressed;
  final Function(int index)? onDeleteAttach;

  WidgetPreviewHorizontalMedia({
    Key? key,
    required this.height,
    this.margin,
    this.files = const [],
    this.isName,
    this.onPressed,
    this.onDeleteAttach,
  }) : super(key: key);

  @override
  State<WidgetPreviewHorizontalMedia> createState() =>
      _WidgetPreviewHorizontalMediaState();
}

class _WidgetPreviewHorizontalMediaState
    extends State<WidgetPreviewHorizontalMedia> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: widget.margin,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: widget.files.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 10);
          },
          itemBuilder: (BuildContext context, int index) {
            if (widget.onDeleteAttach == null) {
              return WidgetPreviewMedia(
                widget.files[index],
                borderRadius: BorderRadius.circular(8),
                isName: widget.isName,
                onTap: () => widget.onPressed?.call(widget.files[index]),
              );
            }
            return Container(
              width: widget.height,
              child: WidgetPreviewMedia(
                widget.files[index],
                borderRadius: BorderRadius.circular(8),
                isName: widget.isName,
                onTap: () => widget.onPressed?.call(widget.files[index]),
                onDeleteAttach: () => widget.onDeleteAttach?.call(index),
              ),
            );
          }

          //  {
          //   return InkWell(
          //     onTap: () => widget.onPressed?.call(widget.files[index]),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(8),
          //       child: FCoreImage(
          //         widget.files[index].getMediaFilePreview(),
          //         height: widget.height,
          //         width: widget.height,
          //       ),
          //     ),
          //   );
          // },
          ),
    );
  }
}
