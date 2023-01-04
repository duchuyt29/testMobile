part of 'home_page.dart';

extension PageAll on HomePage {
  Widget _pageAll() {
    return Obx(
      () {
        if (controller.isAllPostsLoading.value) {
          return const WidgetCenterLoading();
        } else {
          return _buildPageAllContent();
        }
      },
    );
  }

  Widget _buildPageAllContent() {
    return Obx(
      () => WidgetScrollviewRefresher(
        refreshController: controller.allPostsRefreshController,
        onRefresh: controller.onRefreshAllPosts,
        onLoading: controller.onLoadingAllPosts,
        isLoadMore: controller.isMoreAllPosts.value,
        child: ListView.separated(
          controller: controller.scrollController,
          itemCount: controller.listAllPosts.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              if (controller.listAllPosts.isEmpty &&
                  controller.listHomeEvents.isEmpty) {
                return _buildEmptyContent();
              }
              return _buildEvent();
            }
            return HomePostCell(
              content: controller.listAllPosts[index - 1],
              onPostDetail: controller.onPostDetail,
              onUpdatePoll: controller.onUpdatePoll,
              onDeleteReaction: controller.onDeleteReaction,
              onUpdateReaction: controller.onUpdateReaction,
              onLongPress: controller.onShowPostOption,
            );
          },
          separatorBuilder: (context, index) => Divider(
            height: 8,
            thickness: 8,
            color: AppColor.dividerColor.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildEvent() {
    return Obx(
      () {
        if (controller.listHomeEvents.isEmpty) {
          return Container();
        }
        final event =
            controller.listHomeEvents[controller.sliderCurrentIndex.value];
        return Container(
          color: AppColor.dividerColor.withOpacity(0.5),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CarouselSlider.builder(
                carouselController: controller.carouselController,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  aspectRatio: 10 / 3,
                  viewportFraction: 1,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    controller.sliderCurrentIndex.value = index;
                  },
                ),
                itemCount: controller.listHomeEvents.length,
                itemBuilder: (context, index, realIndex) {
                  final event = controller.listHomeEvents[index];
                  return InkWell(
                    onTap: () => (event.task?.referenceId != null &&
                            event.task?.referenceId != 0)
                        ? controller.onViewEvent(event)
                        : null,
                    child: CachedNetworkImage(
                      height: double.infinity,
                      width: double.infinity,
                      imageUrl: event.getAttachment(),
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Container(),
                      errorWidget: (context, url, error) => Container(),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      controller.listHomeEvents.asMap().entries.map((entry) {
                    return Container(
                      width: 20,
                      height: 3,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(
                            controller.sliderCurrentIndex.value == entry.key
                                ? 0.9
                                : 0.4),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );

        // return Container(
        //   width: Get.width,
        //   height: Get.width * 0.2, //300, //Get.height * 0.25,
        //   child: Stack(
        //     children: [
        //       CachedNetworkImage(
        //         height: double.infinity,
        //         width: double.infinity,
        //         imageUrl: event.getAttachment(),
        //         fit: BoxFit.cover,
        //         placeholder: (context, url) => Container(),
        //         errorWidget: (context, url, error) => Container(),
        //       ),
        //       Positioned(
        //         bottom: 15,
        //         left: 15,
        //         child: Visibility(
        //           visible: true,
        //           // visible: event.task?.referenceId != null &&
        //           //     event.task?.referenceId != 0,
        //           child: WidgetButton(
        //             onPressed: () => controller.onViewEvent(event),
        //             width: 150,
        //             height: 30,
        //             margin: const EdgeInsets.only(top: 15),
        //             title: 'home.view.event'.tr,
        //             fontSize: 14,
        //             backgroundButtonColor: AppColor.secondButtonColor,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // );
      },
    );
  }

  // Widget _buildEvent() {
  //   return Obx(
  //     () {
  //       if (controller.listHomeEvents.isEmpty) {
  //         return Container();
  //       }
  //       final event =
  //           controller.listHomeEvents[controller.sliderCurrentIndex.value];
  //       return Container(
  //         width: Get.width,
  //         height: Get.width * 0.2,//300, //Get.height * 0.25,
  //         child: Stack(
  //           children: [
  //             CachedNetworkImage(
  //               height: double.infinity,
  //               width: double.infinity,
  //               imageUrl: event.getAttachment(),
  //               fit: BoxFit.cover,
  //               placeholder: (context, url) => Container(),
  //               errorWidget: (context, url, error) => Container(),
  //             ),
  //             Container(
  //               color: Colors.black38,
  //               padding:
  //                   const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Expanded(
  //                     child: Container(
  //                         // alignment: Alignment.centerLeft,
  //                         // child: Text(
  //                         //   event.getUserName(),
  //                         //   maxLines: 2,
  //                         //   overflow: TextOverflow.ellipsis,
  //                         //   style: AppTextStyle.heavy(
  //                         //     fontSize: 32,
  //                         //     color: AppColor.secondTextColor,
  //                         //   ),
  //                         // ),
  //                         ),
  //                   ),
  //                   // const SizedBox(height: 15),
  //                   // Row(
  //                   //   children: [
  //                   //     WidgetAvatar(
  //                   //       size: 24,
  //                   //       avatar: event.getUserAvatar(),
  //                   //       name: event.getUserName(),
  //                   //     ),
  //                   //     const SizedBox(width: 10),
  //                   //     Flexible(
  //                   //       child: Text(
  //                   //         event.getEventTitle(),
  //                   //         maxLines: 2,
  //                   //         overflow: TextOverflow.ellipsis,
  //                   //         style: AppTextStyle.regular(
  //                   //           fontSize: 16,
  //                   //           color: AppColor.secondTextColor,
  //                   //         ),
  //                   //       ),
  //                   //     ),
  //                   //   ],
  //                   // ),
  //                   Visibility(
  //                     visible: event.task?.referenceId != null &&
  //                         event.task?.referenceId != 0,
  //                     child: WidgetButton(
  //                       onPressed: () => controller.onViewEvent(event),
  //                       width: 150,
  //                       height: 30,
  //                       margin: const EdgeInsets.only(top: 15),
  //                       title: 'home.view.event'.tr,
  //                       fontSize: 14,
  //                       backgroundButtonColor: AppColor.secondButtonColor,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 15),
  //                   Visibility(
  //                     visible: controller.listHomeEvents.length > 1,
  //                     child: Container(
  //                       width: Get.width,
  //                       height: 60,
  //                       child: CarouselSlider.builder(
  //                         carouselController: controller.carouselController,
  //                         itemCount: controller.listHomeEvents.length,
  //                         itemBuilder: (context, index, realIndex) => InkWell(
  //                           onTap: () => controller.onThumbEvent(index),
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(8),
  //                                 border: controller.sliderCurrentIndex.value ==
  //                                         index
  //                                     ? Border.all(
  //                                         width: 6, color: Colors.white)
  //                                     : null),
  //                             alignment: Alignment.center,
  //                             child: CachedNetworkImage(
  //                               height: double.infinity,
  //                               width: double.infinity,
  //                               imageUrl: controller.listHomeEvents[index]
  //                                   .getAttachment(),
  //                               fit: BoxFit.cover,
  //                               placeholder: (context, url) => Container(),
  //                               errorWidget: (context, url, error) =>
  //                                   Container(),
  //                             ),
  //                           ),
  //                         ),
  //                         options: CarouselOptions(
  //                           autoPlay: true,
  //                           enlargeCenterPage: true,
  //                           enableInfiniteScroll: false,
  //                           viewportFraction: 0.35,
  //                           // height: Get.height * 0.1,
  //                           onPageChanged: (index, reason) {
  //                             controller.sliderCurrentIndex.value = index;
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   // Container(
  //                   //   width: Get.width,
  //                   //   height: 60,
  //                   //   child: CarouselSlider(
  //                   //     items: List.generate(
  //                   //       controller.listHomeEvents.length,
  //                   //       (index) => Container(
  //                   //         decoration: BoxDecoration(
  //                   //             borderRadius: BorderRadius.circular(8),
  //                   //             border: controller.sliderCurrentIndex.value ==
  //                   //                     index
  //                   //                 ? Border.all(width: 6, color: Colors.white)
  //                   //                 : null),
  //                   //         alignment: Alignment.center,
  //                   //         child: CachedNetworkImage(
  //                   //           height: double.infinity,
  //                   //           width: double.infinity,
  //                   //           imageUrl: controller.listHomeEvents[index]
  //                   //               .getAttachment(),
  //                   //           fit: BoxFit.cover,
  //                   //           placeholder: (context, url) => Container(),
  //                   //           errorWidget: (context, url, error) => Container(),
  //                   //         ),
  //                   //       ),
  //                   //     ),
  //                   //     options: CarouselOptions(
  //                   //         autoPlay: true,
  //                   //         enlargeCenterPage: true,
  //                   //         viewportFraction: 0.35,
  //                   //         // height: Get.height * 0.1,
  //                   //         onPageChanged: (index, reason) {
  //                   //           controller.sliderCurrentIndex.value = index;
  //                   //         }),
  //                   //   ),
  //                   // )
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget _buildEvent() {
  //   return Obx(
  //     () {
  //       if (controller.listHomeEvents.isEmpty) {
  //         return Container();
  //       }
  //       final event =
  //           controller.listHomeEvents[controller.sliderCurrentIndex.value];
  //       return Container(
  //         color: AppColor.dividerColor.withOpacity(0.5),
  //         width: Get.width,
  //         // height: Get.width * 0.2, //300, //Get.height * 0.25,
  //         child: Column(
  //           children: [
  //             Container(
  //               width: Get.width,
  //               height: Get.width * 0.2, //300, //Get.height * 0.25,
  //               child: Stack(
  //                 children: [
  //                   CachedNetworkImage(
  //                     width: Get.width,
  //                     imageUrl: event.getAttachment(),
  //                     fit: BoxFit.cover,
  //                     placeholder: (context, url) => Container(),
  //                     errorWidget: (context, url, error) => Container(),
  //                   ),
  //                   Positioned(
  //                     left: 15,
  //                     bottom: 15,
  //                     child: Visibility(
  //                       visible: true,
  //                       // visible: event.task?.referenceId != null &&
  //                       //     event.task?.referenceId != 0,
  //                       child: WidgetButton(
  //                         onPressed: () => controller.onViewEvent(event),
  //                         width: 150,
  //                         height: 30,
  //                         margin: const EdgeInsets.only(top: 15),
  //                         title: 'home.view.event'.tr,
  //                         fontSize: 14,
  //                         backgroundButtonColor: AppColor.secondButtonColor,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Visibility(
  //               visible: controller.listHomeEvents.length > 1,
  //               child: Container(
  //                 margin: const EdgeInsets.only(top: 10),
  //                 width: Get.width,
  //                 height: 60,
  //                 child: CarouselSlider.builder(
  //                   carouselController: controller.carouselController,
  //                   itemCount: controller.listHomeEvents.length,
  //                   itemBuilder: (context, index, realIndex) => InkWell(
  //                     onTap: () => controller.onThumbEvent(index),
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(8),
  //                           border: controller.sliderCurrentIndex.value == index
  //                               ? Border.all(width: 6, color: Colors.white)
  //                               : Border.all(
  //                                   width: 6, color: Colors.transparent)),
  //                       alignment: Alignment.center,
  //                       child: CachedNetworkImage(
  //                         height: double.infinity,
  //                         width: double.infinity,
  //                         imageUrl:
  //                             controller.listHomeEvents[index].getAttachment(),
  //                         fit: BoxFit.cover,
  //                         placeholder: (context, url) => Container(),
  //                         errorWidget: (context, url, error) => Container(),
  //                       ),
  //                     ),
  //                   ),
  //                   options: CarouselOptions(
  //                     autoPlay: true,
  //                     enlargeCenterPage: true,
  //                     enableInfiniteScroll: false,
  //                     viewportFraction: 0.35,
  //                     // height: Get.height * 0.1,
  //                     onPageChanged: (index, reason) {
  //                       controller.sliderCurrentIndex.value = index;
  //                     },
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
