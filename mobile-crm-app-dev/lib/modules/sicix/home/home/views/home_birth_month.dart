part of 'home_page.dart';

extension BirthMonth on HomePage {
  Widget _birthMonth() {
    return Obx(
      () {
        if (controller.isBirthMonthLoading.value) {
          return const WidgetCenterLoading();
        } else {
          return _buildBirthMonthContent();
        }
      },
    );
  }

  Widget _buildBirthMonthContent() {
    return Obx(
      () => WidgetScrollviewRefresher(
        refreshController: controller.birthMonthRefreshController,
        onRefresh: controller.onRefreshBirthMonth,
        onLoading: () {},
        isLoadMore: false,
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 24),
          controller: controller.scrollController,
          itemCount: controller.listBirthMonth.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return controller.listBirthMonth.isEmpty
                  ? _buildEmptyContent()
                  : Container();
            }
            return _buildBirthMonthCell(controller.listBirthMonth[index - 1]);
          },
        ),
      ),
    );
  }

  Widget _buildBirthMonthCell(UserInfo userInfo) {
    final birthday = userInfo.getBirthday();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Row(
        children: [
          WidgetAvatar(
            border: 0.5,
            size: 48,
            avatar: userInfo.getAvatar(),
            name: userInfo.getName(),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userInfo.getName(),
                  style: AppTextStyle.heavy(fontSize: 16),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'home.birth.month.happy.birthday'.tr,
                        style: AppTextStyle.regular(fontSize: 13),
                      ),
                      birthday == null
                          ? TextSpan(
                              text: 'home.birth.month.in.month'.tr,
                              style: AppTextStyle.heavy(fontSize: 13),
                            )
                          : controller.isToday(birthday)
                              ? TextSpan(
                                  text: 'home.birth.month.today'.tr,
                                  style: AppTextStyle.heavy(fontSize: 13),
                                )
                              : TextSpan(
                                  text: DateUtil.formatDatetimeToString(
                                      birthday,
                                      type: DateUtil.DAY_TYPE),
                                  style: AppTextStyle.heavy(fontSize: 13),
                                ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Visibility(
            visible: controller.isToday(userInfo.getBirthday()),
            child: FCoreImage(
              IconConstants.icBirthday,
              width: 24,
              height: 24,
            ),
          )
        ],
      ),
    );
  }
}
