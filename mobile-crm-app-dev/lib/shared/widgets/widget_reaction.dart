import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resource/assets_constant/icon_constants.dart';
import '../constants/colors.dart';
import '../styles/text_style/text_style.dart';
import 'image_widget/fcore_image.dart';
import 'reaction_button/src/models/reaction.dart';

class WidgetReaction {
  static List<Reaction<String>> reactions({bool displayReactionIcon = true}) {
    return [
      Reaction<String>(
        value: 'like',
        previewIcon: _buildReactionsPreviewIcon(IconConstants.icLike),
        icon: _buildReactionsIcon(
          IconConstants.icLike,
          'reaction.like'.tr,
          AppColor.likeColor,
          displayReactionIcon: displayReactionIcon,
        ),
      ),
      Reaction<String>(
        value: 'love',
        previewIcon: _buildReactionsPreviewIcon(IconConstants.icLove),
        icon: _buildReactionsIcon(
          IconConstants.icLove,
          'reaction.love'.tr,
          AppColor.loveColor,
          displayReactionIcon: displayReactionIcon,
        ),
      ),
      Reaction<String>(
        value: 'care',
        previewIcon: _buildReactionsPreviewIcon(IconConstants.icCare),
        icon: _buildReactionsIcon(
          IconConstants.icCare,
          'reaction.care'.tr,
          AppColor.careColor,
          displayReactionIcon: displayReactionIcon,
        ),
      ),
      Reaction<String>(
        value: 'haha',
        previewIcon: _buildReactionsPreviewIcon(IconConstants.icHaha),
        icon: _buildReactionsIcon(
          IconConstants.icHaha,
          'reaction.haha'.tr,
          AppColor.hahaColor,
          displayReactionIcon: displayReactionIcon,
        ),
      ),
      Reaction<String>(
        value: 'wow',
        previewIcon: _buildReactionsPreviewIcon(IconConstants.icWow),
        icon: _buildReactionsIcon(
          IconConstants.icWow,
          'reaction.wow'.tr,
          AppColor.wowColor,
          displayReactionIcon: displayReactionIcon,
        ),
      ),
      Reaction<String>(
        value: 'sad',
        previewIcon: _buildReactionsPreviewIcon(IconConstants.icSad),
        icon: _buildReactionsIcon(
          IconConstants.icSad,
          'reaction.sad'.tr,
          AppColor.sadColor,
          displayReactionIcon: displayReactionIcon,
        ),
      ),
      Reaction<String>(
        value: 'angry',
        previewIcon: _buildReactionsPreviewIcon(IconConstants.icAngry),
        icon: _buildReactionsIcon(
          IconConstants.icAngry,
          'reaction.angry'.tr,
          AppColor.angryColor,
          displayReactionIcon: displayReactionIcon,
        ),
      ),
    ];
  }

  static Widget _buildTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 2.5),
      decoration: BoxDecoration(
        color: AppColor.secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        'title',
        style: AppTextStyle.heavy(
          fontSize: 10,
          color: AppColor.secondTextColor,
        ),
      ),
    );
  }

  static Widget _buildReactionsPreviewIcon(String icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
      child: FCoreImage(icon, height: 40),
    );
  }

  static Widget buildReactionStatus(String type,
      {bool displayReactionIcon = true}) {
    switch (type) {
      case 'wow':
        return _buildReactionsIcon(
          IconConstants.icWow,
          'reaction.wow'.tr,
          AppColor.wowColor,
          displayReactionIcon: displayReactionIcon,
        );
      case 'angry':
        return _buildReactionsIcon(
          IconConstants.icAngry,
          'reaction.angry'.tr,
          AppColor.angryColor,
          displayReactionIcon: displayReactionIcon,
        );
      case 'care':
        return _buildReactionsIcon(
          IconConstants.icCare,
          'reaction.care'.tr,
          AppColor.careColor,
          displayReactionIcon: displayReactionIcon,
        );
      case 'haha':
        return _buildReactionsIcon(
          IconConstants.icHaha,
          'reaction.haha'.tr,
          AppColor.hahaColor,
          displayReactionIcon: displayReactionIcon,
        );
      case 'love':
        return _buildReactionsIcon(
          IconConstants.icLove,
          'reaction.love'.tr,
          AppColor.loveColor,
          displayReactionIcon: displayReactionIcon,
        );
      case 'sad':
        return _buildReactionsIcon(
          IconConstants.icSad,
          'reaction.sad'.tr,
          AppColor.sadColor,
          displayReactionIcon: displayReactionIcon,
        );
      case 'like':
        return _buildReactionsIcon(
          IconConstants.icLike,
          'reaction.like'.tr,
          AppColor.likeColor,
          displayReactionIcon: displayReactionIcon,
        );
      default:
        return Container(
          child: Row(
            children: <Widget>[
              Visibility(
                visible: displayReactionIcon,
                child: FCoreImage(IconConstants.icLikeOff, height: 20),
              ),
              Visibility(
                visible: displayReactionIcon,
                child: const SizedBox(width: 5),
              ),
              Text(
                'reaction.like'.tr,
                style: AppTextStyle.regular(),
              ),
            ],
          ),
        );
    }
  }

  static Widget _buildReactionsIcon(String icon, String text, Color? color,
      {bool displayReactionIcon = true}) {
    return Container(
      child: Row(
        children: <Widget>[
          Visibility(
            visible: displayReactionIcon,
            child: FCoreImage(icon, height: 20),
          ),
          Visibility(
            visible: displayReactionIcon,
            child: const SizedBox(width: 5),
          ),
          Text(
            text,
            style: AppTextStyle.heavy(fontSize: 16, color: color),
          ),
        ],
      ),
    );
  }
}
