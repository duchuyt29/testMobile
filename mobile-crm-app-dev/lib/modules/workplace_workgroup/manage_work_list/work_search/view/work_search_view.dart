import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../routes/workgroup_pages.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controller/work_search_controller.dart';

class WorkSearchPage extends GetView<WorkSearchController> {
  const WorkSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return DefaultTabController(
      length: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight * 1.2),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: Get.back,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xff493083),
                          size: 23,
                        ),
                      ),
                      Expanded(child: _buildSearchBar()),
                    ],
                  ),
                  TabBar(
                    indicatorColor: Colors.purple,
                    indicatorWeight: 5,
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    labelColor: const Color(0xff493083),
                    tabs: [
                      Tab(
                        text: 'workplace.workgroup.work'.tr,
                      ),
                      Tab(
                        text: 'workplace.workgroup.approve'.tr,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text(
                                'Kết quả tìm kiếm'.tr,
                                style: AppTextStyle.bold(fontSize: 16),
                              )),
                          Flexible(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.filter_alt_outlined,
                                  color: Color(0xff493083),
                                ),
                                Text(
                                  'Lọc dữ liệu',
                                  style: AppTextStyle.bold(
                                    color: Color(0xff493083),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(WorkGroupRoutes
                                .WORKPLACE_WORKGROUP_DETAIL_WORK);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff2A874A),
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FCoreImage(
                                              ImageConstants
                                                  .workplaceWorkgroupCheck,
                                              height: 20,
                                              width: 20,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              'Hoàn thành',
                                              style: AppTextStyle.bold(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Design UI',
                                          style: AppTextStyle.heavy(
                                              fontSize: 22,
                                              color: const Color(0xff172B4D)),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Nhóm làm việc 1',
                                          style: AppTextStyle.regular(),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Hạn hoàn thành: 11/11/2020 15:00',
                                          style: AppTextStyle.regular(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 2,
                          thickness: 3,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(WorkGroupRoutes
                                .WORKPLACE_WORKGROUP_DETAIL_WORK);
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFD9E0F),
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FCoreImage(
                                                ImageConstants
                                                    .workplaceWorkgroupCheck,
                                                height: 20,
                                                width: 20,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                'Đang thực hiện',
                                                style: AppTextStyle.bold(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Test Screen 1',
                                            style: AppTextStyle.heavy(
                                                fontSize: 22,
                                                color: const Color(0xff172B4D)),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Dự án A',
                                            style: AppTextStyle.regular(),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Hạn hoàn thành:',
                                                style: AppTextStyle.regular(),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '11/11/2020 15:00',
                                                style: AppTextStyle.regular(
                                                    color: Colors.red),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                )
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 2,
                          thickness: 3,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.only(left: 1, right: 10, top: 5),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26,
          ),
          // helperText: "Search your topic",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: 'workplace.workgroup.search.work'.tr,
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          isDense: true,
        ),
      ),
    );
  }
}
