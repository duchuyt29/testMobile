library flutter_html_video;

import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:html/dom.dart' as dom;
import 'package:video_player/video_player.dart';

import '../../../data/app_data_global.dart';
import '../../services/path_service.dart';

typedef VideoControllerCallback = void Function(
    dom.Element?, ChewieController, VideoPlayerController);

CustomRender videoRenderCustom(
        {VideoControllerCallback? onControllerCreated}) =>
    CustomRender.widget(
        widget: (context, buildChildren) =>
            VideoWidget(context: context, callback: onControllerCreated));

CustomRenderMatcher videoMatcherCustom() => (context) {
      return context.tree.element?.localName == 'video';
    };

class VideoWidget extends StatefulWidget {
  final RenderContext context;
  final VideoControllerCallback? callback;

  VideoWidget({
    required this.context,
    this.callback,
  });

  @override
  State<StatefulWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  ChewieController? _chewieController;
  VideoPlayerController? _videoController;
  double _width = Get.width;
  double _height = Get.width / 2;

  Future<void>? _future;

  @override
  void initState() {
    final attributes = widget.context.tree.element?.attributes ?? {};
    final sources = <String?>[
      if (attributes['src'] != null) attributes['src'],
      ...ReplacedElement.parseMediaSources(
          widget.context.tree.element!.children),
    ];
    final givenWidth = double.tryParse(attributes['width'] ?? '');
    final givenHeight = double.tryParse(attributes['height'] ?? '');
    if (sources.isNotEmpty && sources.first != null) {
      _width = givenWidth ?? (givenHeight ?? 150) * 2;
      _height = givenHeight ?? (givenWidth ?? 300) / 2;

      var source = sources.first!;
      if (Platform.isIOS && source.contains(PathService.storagePath)) {
        source =
            source.replaceAll(PathService.storagePath, PathService.mediaPath);
      }

      if (!source.contains('cid') && AppDataGlobal.cid != -1) {
        source += '?cid=${AppDataGlobal.cid}';
      }
      printInfo(info: source);

      // _videoController = VideoPlayerController.network(
      //     'https://media.sicix.vn/b1640ad230f54f1b9bc94536677a8c0f?cid=43');
      _videoController = VideoPlayerController.network(source);
    }
    super.initState();

    initVideoPlayer(attributes);
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext bContext) {
    return AspectRatio(
      aspectRatio: _width / _height,
      child: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          return Container(
            key: widget.context.key,
            child: (_chewieController != null)
                ? Chewie(controller: _chewieController!)
                : Container(color: Colors.black),
          );
        },
      ),
    );
  }

  Future<void> initVideoPlayer(Map<dynamic, dynamic> attributes) async {
    await _videoController?.initialize();
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _videoController!,
        placeholder:
            attributes['poster'] != null && attributes['poster']!.isNotEmpty
                ? Image.network(attributes['poster']!)
                : Container(color: Colors.black),
        autoPlay: attributes['autoplay'] != null,
        looping: attributes['loop'] != null,
        showControls: attributes['controls'] != null,
        autoInitialize: true,
        aspectRatio: _videoController?.value.aspectRatio,
      );

      widget.callback?.call(
          widget.context.tree.element, _chewieController!, _videoController!);
    });
  }
}
