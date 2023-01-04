import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/utils/app_util.dart';
import '../../../../../shared/utils/date_util.dart';
import '../controllers/crm_detail_activity_controllers.dart';

class CrmDetailActivityPage extends GetView<CrmDetailActivityController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => Get.back(result: controller.isUpdate),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                )),
            title: Text(
              controller.getTitleText(),
              style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
            ),
            actions: [
              CrmWidgetButton(
                bgColor: const Color(0xff797979),
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 18,
                ),
                onTap: controller.onMenuAction,
              ),
              const SizedBox(width: 10),
            ],
          ),
          body: Obx(
            () => SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [_buildHeader(), controller.check()],
                ),
              ),
            ),
          ),
        ));
  }

  Container _buildHeader() {
    return controller.item.value.task?.activityTypeId != null
        ? Container(
            color: const Color.fromARGB(255, 245, 244, 244),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ListTile(
              leading: FCoreImage(
                AppUtil.getIconActivity(
                    controller.item.value.task?.activityTypeId ?? 0),
                width: 45,
                height: 45,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'crm.activity'.tr,
                    style: AppTextStyle.heavy(fontSize: 15),
                  ),
                  Text(
                    controller.item.value.task?.name ?? '',
                    style: AppTextStyle.bold(fontSize: 20),
                  ),
                ],
              ),
              onTap: () {},
            ),
          )
        : Container();
  }
}
