import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../resource/assets_constant/icon_constants.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/master_controller.dart';

class MasterScreen extends GetView<MasterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 1),
              )
            ],
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FCoreImage(
                  IconConstants.icHomeOff,
                ),
                activeIcon: FCoreImage(
                  IconConstants.icHomeOn,
                ),
                label: 'home'.tr,
              ),
              BottomNavigationBarItem(
                icon: Obx(
                  () => Badge(
                    showBadge: controller.badgeConversation.value != 0,
                    badgeContent: Text(
                      controller.getBadgeConversation(),
                      style: AppTextStyle.regular(
                          color: AppColor.secondTextColor, fontSize: 11),
                    ),
                    badgeColor: AppColor.badgeColor,
                    child: FCoreImage(
                      IconConstants.icMessagesOff,
                    ),
                  ),
                ),
                activeIcon: Obx(
                  () => Badge(
                    showBadge: controller.badgeConversation.value != 0,
                    badgeContent: Text(
                      controller.getBadgeConversation(),
                      style: AppTextStyle.regular(
                          color: AppColor.secondTextColor, fontSize: 11),
                    ),
                    badgeColor: AppColor.badgeColor,
                    child: FCoreImage(
                      IconConstants.icMessagesOn,
                    ),
                  ),
                ),
                label: 'conversations'.tr,
              ),
              BottomNavigationBarItem(
                icon: Obx(
                  () => Badge(
                    showBadge: controller.badgeNotification.value != 0,
                    badgeContent: Text(
                      controller.getBadgeNotification(),
                      style: AppTextStyle.regular(
                          color: AppColor.secondTextColor, fontSize: 11),
                    ),
                    badgeColor: AppColor.badgeColor,
                    child: FCoreImage(
                      IconConstants.icNotificationOff,
                    ),
                  ),
                ),
                activeIcon: Obx(
                  () => Badge(
                    showBadge: controller.badgeNotification.value != 0,
                    badgeContent: Text(
                      controller.getBadgeNotification(),
                      style: AppTextStyle.regular(
                          color: AppColor.secondTextColor, fontSize: 11),
                    ),
                    badgeColor: AppColor.badgeColor,
                    child: FCoreImage(
                      IconConstants.icNotificationOn,
                    ),
                  ),
                ),
                label: 'notification'.tr,
              ),
              BottomNavigationBarItem(
                icon: FCoreImage(
                  IconConstants.icUserOff,
                ),
                activeIcon: FCoreImage(
                  IconConstants.icUserOn,
                ),
                label: 'account'.tr,
              ),
              BottomNavigationBarItem(
                icon: FCoreImage(
                  IconConstants.icMoreOff,
                ),
                activeIcon: FCoreImage(IconConstants.icMoreOn),
                label: 'more'.tr,
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: AppColor.primaryColor,
            unselectedLabelStyle: AppTextStyle.regular(
                color: AppColor.fifthTextColor, fontSize: 11),
            selectedLabelStyle: AppTextStyle.regular(
                color: AppColor.primaryColor, fontSize: 11),
            type: BottomNavigationBarType.fixed,
            onTap: controller.onItemTapped,
          ),
        ),
      ),
    );
  }
}
