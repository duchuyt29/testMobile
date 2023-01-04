import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../../shared/constants/colors.dart';

class VideoPlayerView extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final String url;

  /// The Aspect Ratio of the Video. Important to get the correct size of the video
  final double aspectRatio;

  /// If the video can be played
  final bool canPlay;

  const VideoPlayerView(
    this.videoPlayerController,
    this.url, {
    this.aspectRatio = 16 / 9,
    this.canPlay = true,
  });

  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = null;
    // _initializePlay();
  }

  Future<void> _initializePlay() async {
    // if (widget.videoPlayerController.dataSource != widget.url) {
    //   videoPlayerController = VideoPlayerController.network(widget.url);
    //   await videoPlayerController.initialize().then((value) {
    //     setState(() {});
    //   }).catchError((onError) {
    //     printError(info: onError.toString());
    //     setState(() {});
    //   });
    // } else {
    //   videoPlayerController = widget.videoPlayerController;
    // }
    printInfo(info: 'initializePlay ${widget.url}');

    videoPlayerController = widget.videoPlayerController;
    await videoPlayerController?.initialize().then((value) {
      setState(() {});
    }).catchError((onError) {
      printError(info: onError.toString());
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (videoPlayerController == null ||
        videoPlayerController?.dataSource != widget.url) {
      _initializePlay();
    }
    if (videoPlayerController?.value.isInitialized ?? false) {
      return Stack(
        alignment: videoPlayerController!.value.isPlaying
            ? AlignmentDirectional.bottomStart
            : AlignmentDirectional.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: videoPlayerController!.value.aspectRatio,
            child: VideoPlayer(videoPlayerController!),
          ),
          IconButton(
            iconSize: videoPlayerController!.value.isPlaying ? 24 : 60,
            onPressed: widget.canPlay
                ? () {
                    setState(() {
                      videoPlayerController!.value.isPlaying
                          ? videoPlayerController?.pause()
                          : videoPlayerController?.play();
                    });
                  }
                : null,
            icon: Icon(
              videoPlayerController!.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
              color: Colors.white,
              // size: 60,
            ),
          ),
        ],
      );
    } else if (videoPlayerController?.value.hasError ?? false) {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: widget.aspectRatio,
            child: Container(
              color: AppColor.mediaBackgroundColor,
            ),
          ),
          const Icon(
            Icons.video_camera_back_outlined,
            color: Colors.white,
            size: 30,
          ),
        ],
      );
    } else {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          AspectRatio(
            aspectRatio: widget.aspectRatio,
            child: Container(
              color: AppColor.mediaBackgroundColor,
            ),
          ),
          CircularProgressIndicator(
            color: AppColor.primaryHintColor,
          ),
        ],
      );
    }

    // return videoPlayerController != null && videoPlayerController.value.isInitialized
    //     ? Stack(
    //         alignment: videoPlayerController.value.isPlaying
    //             ? AlignmentDirectional.bottomStart
    //             : AlignmentDirectional.center,
    //         children: <Widget>[
    //           AspectRatio(
    //             aspectRatio: videoPlayerController.value.aspectRatio,
    //             child: VideoPlayer(videoPlayerController),
    //           ),
    //           IconButton(
    //             iconSize: videoPlayerController.value.isPlaying ? 24 : 60,
    //             onPressed: widget.canPlay
    //                 ? () {
    //                     setState(() {
    //                       videoPlayerController.value.isPlaying
    //                           ? videoPlayerController?.pause()
    //                           : videoPlayerController?.play();
    //                     });
    //                   }
    //                 : null,
    //             icon: Icon(
    //               videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
    //               color: Colors.white,
    //               // size: 60,
    //             ),
    //           ),
    //         ],
    //       )
    //     : Container();
  }
}
