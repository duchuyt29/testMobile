import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../routes/workgroup_pages.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';

import '../controllers/dashboard_controller.dart';
import 'widgets/calander_widgets.dart';

class DashboardPage extends GetView<DashboardController> {
  DashboardPage({Key? key}) : super(key: key);

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
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
              size: 18,
            ),
          ),
          title: Text(
            'workplace.workgroup.synthesize.information'.tr,
            style: AppTextStyle.heavy(fontSize: 24),
          ),
          bottom: TabBar(
            isScrollable: true,
            automaticIndicatorColorAdjustment: true,
            indicatorColor: Colors.purple,
            indicatorWeight: 5,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            labelColor: const Color(0xff493083),
            tabs: [
              Tab(
                text: 'workplace.workgroup.overview'.tr,
              ),
              Tab(
                text: 'workplace.workgroup.timesheets'.tr,
              ),
              Tab(
                text: 'workplace.workgroup.personal.calendar'.tr,
              ),
            ],
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
                            'workplace.workgroup.job.statistics'.tr,
                            style: AppTextStyle.regular(fontSize: 20),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FormBuilderDropdown(
                                name: 'name',
                                initialValue: '1',
                                items: [
                                  DropdownMenuItem(
                                    value: '1',
                                    child:
                                        Text('workplace.workgroup.by.week'.tr),
                                  ),
                                  DropdownMenuItem(
                                    value: '2',
                                    child:
                                        Text('workplace.workgroup.by.month'.tr),
                                  ),
                                ],
                                decoration: const InputDecoration(
                                  errorStyle: TextStyle(height: 0),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'crm.validation.required'.tr),
                                ]),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildItemOutOfDate()),
                      Expanded(child: _buildItemProcessing()),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildItemEfficiency()),
                      Expanded(child: _buildItemBusyRate()),
                    ],
                  ),
                  _buildIterm(
                      color: Color.fromRGBO(253, 158, 15, 0.7),
                      image: ImageConstants.workplaceWorkgroupAsignMe,
                      name: 'workplace.workgroup.assignment.me'.tr,
                      number: '01',
                      onTap: () {
                        Get.toNamed(WorkGroupRoutes
                            .WORKPLACE_WORKGROUP_WORK_ASSIGNMENT_ME);
                      }),
                  _buildIterm(
                      color: const Color.fromRGBO(253, 15, 15, 0.38),
                      image: ImageConstants.workplaceWorkgroupMeAsign,
                      name: 'workplace.workgroup.me.assignment'.tr,
                      number: '05',
                      onTap: () {
                        Get.toNamed(WorkGroupRoutes
                            .WORKPLACE_WORKGROUP_WORK_ME_ASSIGNMENT);
                      }),
                  _buildIterm(
                      color: const Color.fromRGBO(15, 82, 253, 0.23),
                      image: ImageConstants.workplaceWorkgroupMySupervision,
                      name: 'workplace.workgroup.me.monitoring'.tr,
                      number: '0',
                      onTap: () {
                        Get.toNamed(WorkGroupRoutes
                            .WORKPLACE_WORKGROUP_WORK_ME_MONITORING);
                      }),
                ],
              ),
            ),
            const CalanderWidget(),
            const CalanderWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildIterm({
    required Color color,
    required String image,
    required String name,
    required String number,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: () {},
                icon: FCoreImage(
                  image,
                  height: 40,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff493083)),
                ),
                Text(
                  number,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff493083)),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildItemOutOfDate() {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 252, 228, 191),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FCoreImage(
              ImageConstants.workplaceWorkgroupOverdueWork,
              height: 30,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'workplace.workgroup.overdue.work'.tr,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff493083)),
              ),
              const Text(
                '05',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff493083)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildItemProcessing() {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xff56D9F5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            width: 45,
            child: FCoreImage(
              ImageConstants.workplaceWorkgroupLoading,
              width: 37,
              height: 37,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'workplace.workgroup.processingss'.tr,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff493083)),
              ),
              const Text(
                '01',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff493083)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildItemEfficiency() {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 44, 249, 126),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FCoreImage(
              ImageConstants.workplaceWorkgroupEfficiency,
              height: 32,
              color: AppColor.primaryColor,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'workplace.workgroup.efficiency'.tr,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff493083)),
              ),
              const Text(
                '100%',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff493083)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildItemBusyRate() {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffFFF849),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            width: 45,
            child: FCoreImage(
              ImageConstants.workplaceWorkgroupBusyRate,
              width: 37,
              height: 37,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Busy Rate',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff493083)),
              ),
              Text(
                '100%',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff493083)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
