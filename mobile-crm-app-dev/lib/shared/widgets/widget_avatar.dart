import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../styles/text_style/text_style.dart';
import 'image_widget/fcore_image.dart';

class WidgetAvatar extends StatelessWidget {
  final double size;
  final String? avatar;
  final Color? color;
  final String? name;
  final bool isUrl;
  final bool? isOnline;
  final double border;
  final String? userId;
  final BoxFit fit;

  const WidgetAvatar({
    Key? key,
    this.size = 56,
    this.avatar,
    this.color,
    this.name,
    this.isUrl = false,
    this.isOnline,
    this.border = 0,
    this.userId,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(size / 2),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              border: border == 0
                  ? null
                  : Border.all(width: border, color: AppColor.primaryHintColor),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size / 2),
              child: (avatar?.isEmpty ?? true)
                  ? _buildAvatarWithName(name ?? '')
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(size / 2),
                      child: Container(
                        child: FCoreImage(
                          avatar ?? '',
                          isUrl: isUrl,
                          fit: fit,
                          placeHolder: _buildAvatarWithName(name ?? ''),
                          errorWidget: _buildAvatarWithName(name ?? ''),
                        ),
                      ),
                    ),
            ),
          ),
        ),
        if (isOnline != null && isOnline!)
          Positioned(
            right: 0.0,
            bottom: 0.0,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.statusSuccess,
                border: Border.all(
                  color: AppColor.canvasColor,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAvatarWithName(String name) {
    var result = '';
    final words = name.split(' ');
    words.forEach((element) {
      if (element.isNotEmpty && result.length < 2) {
        result += element[0];
      }
    });
    result =
        (result.length < 2 && name.length > 1) ? name.substring(0, 2) : result;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            AppColor.gradientViolet1,
            AppColor.gradientViolet2,
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          result.toUpperCase(),
          style: AppTextStyle.heavy(
            color: AppColor.secondTextColor,
            fontSize: size / 3,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
