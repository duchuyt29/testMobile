import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_audio/flutter_html_audio.dart';
import 'package:flutter_html_iframe/flutter_html_iframe.dart';
import 'package:flutter_html_math/flutter_html_math.dart';
import 'package:flutter_html_svg/flutter_html_svg.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:flutter_html_video/flutter_html_video.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:ui_api/sicix_api/models/notification/notification_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../resource/assets_constant/images_constants.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/constants/arguments.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';

class NotificationCell extends StatelessWidget {
  final NotificationModel notification;

  final GestureTapCallback onTap;

  const NotificationCell({
    Key? key,
    required this.onTap,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: notification.status == 1
            ? AppColor.canvasColor
            : AppColor.pollBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const AvatarWidget(iconNotification: IconConstants.icTag),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      notification.subject ?? '',
                      style: AppTextStyle.heavy(
                        color: AppColor.blackColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Html(
                      data: parse(notification.content ?? '').body?.text,
                      onImageTap: (url, context, attributes, element) {
                        if (url != null) {
                          printInfo(info: url);
                          if (GetUtils.isImage(url)) {
                            Get.toNamed(SicixRoutes.IMAGE_PREIEW, arguments: {
                              IMAGE_ARGUMENT: url,
                            });
                          } else {
                            launchUrlString(url,
                                mode: LaunchMode.externalApplication);
                          }
                        }
                      },
                      onLinkTap: (url, context, attributes, element) {
                        if (url != null) {
                          printInfo(info: url);
                          launchUrlString(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
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
                        videoMatcher(): videoRender(),
                      },
                      style: {
                        '#': Style(
                          fontSize: FontSize(16),
                        ),
                        'body': Style(
                          fontSize: FontSize(16),
                        ),
                        'p': Style(
                          fontSize: FontSize(16),
                        ),
                      },
                    ),
                  ),
                  // HtmlWidget(
                  //   parse(notification.content ?? '').body?.text ?? '',
                  //   onLoadingBuilder: (context, element, loadingProgress) =>
                  //       const CircularProgressIndicator(),
                  //   onTapUrl: (url) {
                  //     launchUrl(Uri.parse(url));
                  //     return true;
                  //   },
                  //   textStyle: AppTextStyle.regular(),
                  //   // ignore: deprecated_member_use
                  //   webView: true,
                  //   // ignore: deprecated_member_use
                  //   webViewJs: true,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      notification.getTime(),
                      style: AppTextStyle.heavy(
                        color: AppColor.textGrayColor,
                        fontSize: 10.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            // PopupMenuButton(
            //   padding: EdgeInsets.zero,
            //   icon: FCoreImage(
            //     IconConstants.iconMenu,
            //     color: AppColor.neutral5,
            //   ),
            //   offset: const Offset(0.0, 34.0),
            //   itemBuilder: (context) => _getMenuItemOption(notification),
            //   onSelected: () => onRemoveNotification(),
            // ),
          ],
        ),
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key, required this.iconNotification})
      : super(key: key);

  final String iconNotification;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FCoreImage(
          ImageConstants.avatar,
          width: 64.0,
          height: 64.0,
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.canvasColor,
                width: 2.0,
              ),
            ),
            child: FCoreImage(iconNotification),
          ),
        ),
      ],
    );
  }
}

List<PopupMenuEntry<int>> _getMenuItemOption(NotificationModel notification) {
  final menuItemOptions = <PopupMenuEntry<int>>[
    PopupMenuItem<int>(
      height: 32.0,
      padding: EdgeInsets.zero,
      value: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FCoreImage(IconConstants.icDelete),
            const SizedBox(width: 13),
            Text(
              'notification.delete'.tr,
              style: AppTextStyle.regular(),
            )
          ],
        ),
      ),
    ),
  ];
  return menuItemOptions;
}
