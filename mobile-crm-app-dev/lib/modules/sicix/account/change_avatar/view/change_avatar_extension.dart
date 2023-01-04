part of 'change_avatar_screen.dart';

extension ChangeAvatarExtension on ChangeAvatarScreen {
  PreferredSizeWidget _customAppBar() {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      centerTitle: true,
      title: Text(
        'change.avatar.update_avatar'.tr,
        style: AppTextStyle.heavy(
          fontSize: 18.0,
          color: AppColor.secondTextColor,
        ),
      ),
      leading: InkWell(
        onTap: Get.back,
        child: Center(
          child: Text(
            'cancel'.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.heavy(
              fontSize: 18.0,
              color: AppColor.secondTextColor,
            ),
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            controller.handleCompletedButtonPressed();
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Center(
              child: Text(
                'completed'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.heavy(
                  fontSize: 18.0,
                  color: AppColor.secondTextColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUpdateAvatar() {
    return Expanded(
      child: Stack(
        children: [
          Obx(
            () => controller.image.value != null
                ? Center(
                    child: Crop.file(
                      controller.image.value!,
                      key: controller.cropKey,
                      aspectRatio: 1,
                    ),
                  )
                : const SizedBox(),
          ),
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 30.0,
              child: Text(
                'change.avatar.status.ready'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.regular(
                  color: AppColor.secondTextColor,
                ),
              )),
        ],
      ),
    );
  }
}
