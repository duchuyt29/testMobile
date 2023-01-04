part of 'home_page.dart';

extension PageImportant on HomePage {
  Widget _buildImportant() {
    return Obx(
      () {
        if (controller.isImportantsLoading.value) {
          return const WidgetCenterLoading();
        } else {
          return _buildPageImporttantContent();
        }
      },
    );
  }

  Widget _buildPageImporttantContent() {
    return Obx(
      () => WidgetScrollviewRefresher(
        refreshController: controller.importantsRefreshController,
        onRefresh: controller.onRefreshImportants,
        onLoading: controller.onLoadingImportants,
        isLoadMore: controller.isMoreImportants.value,
        child: ListView.separated(
          controller: controller.scrollController,
          itemCount: controller.listImportants.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return controller.listImportants.isEmpty
                  ? _buildEmptyContent()
                  : Container();
            }
            return HomePageImporttantCell(
              controller.listImportants[index - 1],
              onTap: () => controller.onPostDetail(
                  controller.listImportants[index - 1], false),
            );
          },
          separatorBuilder: (context, index) => Container(),
        ),
      ),
    );
  }

  Widget _buildImporttantCell(PostContent contentItem) {
    return InkWell(
      onTap: () => controller.onPostDetail(contentItem, false),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 24, right: 24),
        child: Row(
          children: [
            WidgetAvatar(
              size: 48,
              isUrl: false,
              name: contentItem.task?.createBy?.fullName,
              avatar: '',
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contentItem.task?.createBy?.fullName ?? '',
                    style: AppTextStyle.heavy(fontSize: 16),
                  ),
                  Text(
                    contentItem.task?.name ?? '',
                    style: AppTextStyle.regular(fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
