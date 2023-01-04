import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../shared/constants/colors.dart';
import 'video_player_view.dart';

class MediaContainerView extends StatelessWidget {
  /// Message that contains the media to show
  final ChatMessage message;

  /// If the message is from the current user
  final bool isOwnMessage;

  /// Options to customize the behaviour and design of the messages
  final MessageOptions messageOptions;

  const MediaContainerView({
    required this.message,
    required this.isOwnMessage,
    this.messageOptions = const MessageOptions(),
    Key? key,
  }) : super(key: key);

  /// Get the right media widget according to its type
  Widget _getMedia(ChatMedia media, double? height, double? width) {
    final Widget loading = Container(
      width: 15,
      height: 15,
      margin: const EdgeInsets.all(10),
      child: const CircularProgressIndicator(),
    );
    switch (media.type) {
      case MediaType.video:
        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: <Widget>[
            VideoPlayerView(
              VideoPlayerController.network(media.url),
              media.url,
            ),
            if (media.isUploading) loading
          ],
        );
      case MediaType.image:
        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: <Widget>[
            Image(
              height: height,
              width: width,
              fit: BoxFit.cover,
              alignment: isOwnMessage ? Alignment.topRight : Alignment.topLeft,
              image: getImageProvider(media.url),
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: AppColor.mediaBackgroundColor,
                  child: const Icon(
                    Icons.image_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                );
              },
            ),
            if (media.isUploading) loading
          ],
        );
      default:
        return TextContainer(
          isOwnMessage: isOwnMessage,
          messageOptions: messageOptions,
          message: message,
          messageTextBuilder: (ChatMessage m, ChatMessage? p, ChatMessage? n) {
            return Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: !media.isUploading
                      ? Icon(
                          Icons.description,
                          size: 18,
                          color: isOwnMessage
                              ? (messageOptions.currentUserTextColor ??
                                  Colors.white)
                              : (messageOptions.textColor ?? Colors.black),
                        )
                      : loading,
                ),
                Flexible(
                  child: Text(
                    media.fileName,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: isOwnMessage
                          ? (messageOptions.currentUserTextColor ??
                              Colors.white)
                          : (messageOptions.textColor ?? Colors.black),
                    ),
                  ),
                ),
              ],
            );
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (message.medias != null && message.medias!.isNotEmpty) {
      final media = message.medias!;
      return Wrap(
        alignment: isOwnMessage ? WrapAlignment.end : WrapAlignment.start,
        children: media.map(
          (ChatMedia m) {
            final gallerySize =
                (MediaQuery.of(context).size.width * 0.7) / 2 - 5;
            final isImage = m.type == MediaType.image;
            return Container(
              color: Colors.transparent,
              margin: const EdgeInsets.only(top: 5, right: 5),
              width: media.length > 1 && isImage ? gallerySize : null,
              height: media.length > 1 && isImage ? gallerySize : null,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4,
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: GestureDetector(
                onTap: messageOptions.onTapMedia != null
                    ? () => messageOptions.onTapMedia!(m)
                    : null,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      m.isUploading
                          ? Colors.white54
                          : Colors.white.withOpacity(
                              0.1,
                            ), // Because transparent is causing an issue on flutter web
                      BlendMode.srcATop,
                    ),
                    child: _getMedia(
                      m,
                      media.length > 1 ? gallerySize : null,
                      media.length > 1 ? gallerySize : null,
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      );
    }
    return Container();
  }

  ImageProvider getImageProvider(String url) {
    if (url.startsWith('http')) {
      return CachedNetworkImageProvider(url);
    } else {
      return FileImage(
        File(url),
      );
    }
  }
}
