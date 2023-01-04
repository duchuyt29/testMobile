import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_audio/flutter_html_audio.dart';
import 'package:flutter_html_iframe/flutter_html_iframe.dart';
import 'package:flutter_html_math/flutter_html_math.dart';
import 'package:flutter_html_svg/flutter_html_svg.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/home/post_content.dart';
import 'package:ui_api/sicix_api/models/media_file/media_file.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/constants/arguments.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/html_render/video_render_custom.dart';
import '../../../../../shared/widgets/widget_preview_horizontal_media.dart';

class HomePostContentCell extends StatelessWidget {
  final PostContent content;
  final bool isMax;
  final Function(PostContent content)? onLongPress;
  final Function(PostContent content)? onTap;

  HomePostContentCell({
    Key? key,
    required this.content,
    this.isMax = false,
    this.onLongPress,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () => onLongPress?.call(content),
      onTap: () => onTap?.call(content),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: content.task?.tags?.isNotEmpty ?? false,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: RichText(
                text: TextSpan(
                  style: AppTextStyle.heavy(
                      fontSize: 16, color: AppColor.stateInfoColor),
                  children: content.task?.tags
                      ?.map((e) => TextSpan(
                          text: '#$e ',
                          style: AppTextStyle.heavy(
                              fontSize: 16, color: AppColor.stateInfoColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(SicixRoutes.POST_SEARCH,
                                  arguments: '#$e');
                            }))
                      .toList(),
                ),
              ),
            ),
          ),
          const Divider(height: 24),
          Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Text(
              content.task?.name ?? '',
              style: AppTextStyle.heavy(fontSize: 16),
            ),
          ),
          const Divider(height: 24),
          Container(
            margin: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            child: Html(
              data: content.task?.getDescription(isMax),
              onImageTap: (url, context, attributes, element) {
                if (url == null) {
                  return;
                }
                if (GetUtils.isImage(url)) {
                  Get.toNamed(SicixRoutes.IMAGE_PREIEW, arguments: {
                    IMAGE_ARGUMENT: url,
                  });
                } else {
                  launchUrlString(url, mode: LaunchMode.externalApplication);
                }
              },
              onLinkTap: (url, context, attributes, element) {
                if (url != null) {
                  launchUrlString(url, mode: LaunchMode.externalApplication);
                }
              },
              customRenders: {
                audioMatcher(): audioRender(),
                iframeMatcher(): iframeRender(),
                mathMatcher(): mathRender(),
                svgTagMatcher(): svgTagRender(),
                svgDataUriMatcher(): svgDataImageRender(),
                svgAssetUriMatcher(): svgAssetImageRender(),
                svgNetworkSourceMatcher(): svgNetworkImageRender(),
                tableMatcher(): tableRender(),
                videoMatcherCustom(): videoRenderCustom(),
                networkSourceMatcher(): networkImageRender(),
              },
              style: {
                // 'iframe': Style(
                //   width: Get.width,
                // ),
                // 'video': Style(
                //   width: Get.width,
                // ),
                '#': Style(
                  fontSize: FontSize(16),
                  // textOverflow: TextOverflow.ellipsis,
                ),
                // 'body': Style(
                //   fontSize: const FontSize(16),
                // ),
                // 'p': Style(
                //   fontSize: const FontSize(16),
                // ),
                // 'div': Style(
                //   fontSize: const FontSize(16),
                // ),
              },
            ),

            //     HtmlWidget(
            //   content.task?.getDescription(isMax) ?? '',
            //   // ignore: deprecated_member_use
            //   webView: true,
            //   // ignore: deprecated_member_use
            //   webViewJs: true,
            //   // onTapUrl: (url) async {
            //   //   printInfo(info: url);
            //   //   return launchUrlString(url);
            //   // },
            // ),

            //   textStyle: AppTextStyle.regular(),
            // ),
            //   WebView(
            //     onWebViewCreated: (WebViewController webViewController) {
            //       webViewController.loadHtmlString(
            //         content.task?.getDescription(isMax) ?? '',
            //       );
            //       webViewController
            //           .evaluateJavascript('document.body.clientHeight')
            //           .then(
            //         (height) {
            //           print('Height of Page is: $height}');
            //           setState(() {
            //             sizedBoxHeight = double.parse(height);
            //           });
            //         },
            //       );
            //     },
            //      javascriptChannels: {
            //    JavascriptChannel(
            //        name: 'RenderedWebViewHeight',
            //        onMessageReceived: (JavascriptMessage message) {
            //            setState(() {
            //              sizedBoxHeight = double.parse(message.message);
            //            });
            //  },
            //   ),
          ),
          ((content.task?.isMore ?? false) && isMax)
              ? Container(
                  padding: const EdgeInsets.fromLTRB(24, 5, 24, 16),
                  child: Text(
                    'view.more'.tr,
                    style:
                        AppTextStyle.regular(color: AppColor.primaryHintColor),
                  ),
                )
              : Container(height: 16),
          content.attachmentItems.isEmpty
              ? Container()
              : WidgetPreviewHorizontalMedia(
                  height: 70,
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  files: content.attachmentItems
                      .map((e) => e.getMediaFile())
                      .toList(),
                  onPressed: _openUrl,
                ),
        ],
      ),
    );
  }

  Future _openUrl(MediaFile mediaFile) async {
    if (mediaFile.isImage()) {
      await Get.toNamed(SicixRoutes.IMAGE_PREIEW, arguments: {
        NAME_ARGUMENT: mediaFile.name,
        IMAGE_ARGUMENT: mediaFile.getMediaFilePath(),
      });
    } else {
      await launchUrlString(
        mediaFile.getMediaFilePath(),
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
