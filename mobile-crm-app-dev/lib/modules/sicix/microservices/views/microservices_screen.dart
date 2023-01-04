import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/app_data_global.dart';
import '../../../../resource/assets_constant/images_constants.dart';
import '../../../../routes/workgroup_pages.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/constants/common.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../shared/widgets/widget_avatar.dart';
import '../controllers/microservice_controllers.dart';

part 'microservices_extension.dart';

class MicroservicePage extends GetView<MicroserviceController> {
  const MicroservicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text(
          'microservice.title'.tr,
          style: AppTextStyle.heavy(
            fontSize: 20,
            color: AppColor.secondTextColor,
          ),
        ),
        leading: IconButton(
          onPressed: controller.onChangeCompany,
          icon: WidgetAvatar(
            size: 32,
            fit: BoxFit.contain,
            isUrl: true,
            name: controller.companySelected.value?.name ?? '',
            avatar: controller.companySelected.value?.getAvatar(),
          ),
        ),
      ),
      body: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Visibility(
                    visible: AppDataGlobal.env != PROD_ENVIRONMENT,
                    child: _buildListType(title: 'eOffice', children: [
                      Row(
                        children: [
                          _buildItemMicroservice(
                              title: 'Truyền thông',
                              image: ImageConstants.workPlaceNews,
                              onTap: () {}),
                          _buildItemMicroservice(
                              title: 'Nhóm làm việc',
                              image: ImageConstants.workPlaceWorkGroup,
                              onTap: () {
                                Get.toNamed(
                                    WorkGroupRoutes.WORKPLACE_WORKGROUP_MENU);
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          _buildItemMicroservice(
                              title: 'Trao đổi',
                              image: ImageConstants.workPlaceChat,
                              onTap: () {}),
                          _buildItemMicroservice(
                              title: 'Lưu trữ',
                              image: ImageConstants.workPlaceStorage,
                              onTap: () {}),
                        ],
                      ),
                    ]),
                  ),
                  Visibility(
                   visible: AppDataGlobal.env != PROD_ENVIRONMENT,
                    child:
                        _buildListType(title: 'Quản lý công việc', children: [
                      Row(
                        children: [
                          _buildItemMicroservice(
                              title: 'QL dự án',
                              image: ImageConstants.workPlaceProject,
                              onTap: () {}),
                          _buildItemMicroservice(
                              title: 'Hỗ trợ sự cố',
                              image: ImageConstants.crmTicket,
                              onTap: () {}),
                        ],
                      ),
                    ]),
                  ),
                  Visibility(
                    visible: AppDataGlobal.env != PROD_ENVIRONMENT,
                    child: _buildListType(title: 'Quản lý nhân sự', children: [
                      Row(
                        children: [
                          _buildItemMicroservice(
                              title: 'Nhân sự',
                              image: ImageConstants.hcmHrm,
                              onTap: () {}),
                          _buildItemMicroservice(
                              title: 'Công/Lương',
                              image: ImageConstants.hcmTimeSalary,
                              onTap: () {}),
                        ],
                      ),
                    ]),
                  ),
                  _buildListType(
                      title: 'Quản lý quan hệ khách hàng',
                      children: [
                        Row(
                          children: [
                            _buildItemMicroservice(
                                title: 'QL bán hàng',
                                image: ImageConstants.crmCrm,
                                onTap: controller.onViewCrm),
                            Visibility(
                               visible: AppDataGlobal.env == PROD_ENVIRONMENT,
                               child: Expanded(child: Container())),
                            Visibility(
                             visible: AppDataGlobal.env != PROD_ENVIRONMENT,
                              child: _buildItemMicroservice(
                                  title: 'Yêu cầu sự cố',
                                  image: ImageConstants.crmTicket,
                                  onTap: () {}),
                            ),
                          ],
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
