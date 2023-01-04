import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/auth/user_conversation.dart';

import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/theme/theme_decoration.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_loading.dart';
import '../../../../../shared/widgets/widget_scrollview_refresher.dart';
import '../../../../../shared/widgets/widget_search_empty.dart';
import '../controllers/member_conversation_controller.dart';

class MemberConversationScreen extends GetView<MemberConversationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'member.conversation'.tr,
          style:
              AppTextStyle.heavy(color: AppColor.secondTextColor, fontSize: 20),
        ),
        actions: [
          TextButton(
            onPressed: controller.addMember,
            child: Text(
              'add'.tr,
              style: AppTextStyle.heavy(color: AppColor.secondTextColor),
            ),
          ),
        ],
      ),
      body: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: AppColor.secondBackgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            controller: controller.searchController,
            textInputAction: TextInputAction.search,
            decoration: ThemeDecoration.searchInputDecoration(
              hintText: 'member.conversation.search'.tr,
            ),
            onChanged: (value) => controller.onSubmittedSearh(value),
          ),
        ),
        Expanded(
          child: Obx(
            () {
              if (controller.isLoading.value) {
                return const WidgetCenterLoading();
              } else if (controller.userConversations.isEmpty) {
                return WidgetSearchEmpty();
              } else {
                return WidgetScrollviewRefresher(
                  refreshController: controller.refreshController,
                  onRefresh: controller.onRefresh,
                  onLoading: controller.onLoading,
                  isLoadMore: controller.isMore.value,
                  child: ListView.builder(
                    itemCount: controller.userConversations.length,
                    padding: const EdgeInsets.only(bottom: 20),
                    itemBuilder: (BuildContext context, int index) =>
                        _buildMemberCell(controller.userConversations[index]),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMemberCell(UserConversation userConversation) {
    return InkWell(
      onTap: () => controller.onSelectionMember(userConversation),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          children: [
            WidgetAvatar(
              size: 64,
              name: userConversation.getName(),
              avatar: userConversation.getAvatar(),
              isOnline: userConversation.partnerOnline,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userConversation.getName(),
                  maxLines: 1,
                  style: AppTextStyle.heavy(),
                ),
                Text(
                  userConversation.getRule(),
                  maxLines: 1,
                  style: AppTextStyle.regular(
                    fontSize: 14,
                    color: AppColor.niceTextColorLight,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
