import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_notification.dart';
import '../../../crm_master_menu/controllers/crm_master_menu_controller.dart';
import '../controllers/crm_md_controller.dart';

class CrmMdPage extends GetView<CrmMdController> {
  CrmMdPage({Key? key}) : super(key: key);

  final CrmMasterMenuController _masterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: _buildBodyContent(context),
        ),
      ),
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    return Column(
      children: [
        _buildHeaderContent(),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ListTile(
              leading: Container(
                width: 35,
                child: const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              title: Text('back.to.main.menu'.tr),
              onTap: Get.back,
            )
          ],
        ),
        Container(
          height: 5,
          color: Colors.grey.shade200,
        ),
        // _buildListTile(
        //     leading: FCoreImage(
        //       ImageConstants.crmCrm,
        //       width: 24,
        //       height: 24,
        //     ),
        //     title: 'settings'.tr,
        //     trailing: const Icon(
        //       Icons.arrow_forward_ios,
        //       size: 16,
        //     ),
        //     onTap: () {
        //       controller.onViewSettings(context);
        //     }),
        _buildListTile(
            leading: FCoreImage(
              ImageConstants.crmCrm,
              width: 24,
              height: 24,
            ),
            title: 'crm.activity'.tr,
            onTap: () {
              controller.onViewActivity();
            }),
        // _buildListTile(
        //     leading: const Icon(Icons.list),
        //     trailing: const Icon(
        //       Icons.arrow_forward_ios,
        //       size: 16,
        //     ),
        //     title: 'Tổ chức bán hàng',
        //     onTap: () {}),
        // _buildListTile(
        //     leading: const Icon(Icons.list),
        //     title: 'Nhân lực bán hàng',
        //     onTap: () {}),
        // _buildListTile(
        //     leading: FCoreImage(
        //       ImageConstants.crmLead,
        //       width: 24,
        //       height: 24,
        //     ),
        //     title: 'Quản lý sản phẩm',
        //     trailing: const Icon(
        //       Icons.arrow_forward_ios,
        //       size: 16,
        //     ),
        //     onTap: () {
        //       controller.onViewMangeProduct(context);
        //     }),
        // _buildListTile(
        //     leading: FCoreImage(
        //       ImageConstants.crmLead,
        //       width: 24,
        //       height: 24,
        //     ),
        //     title: 'crm.exchange.title'.tr,
        //     onTap: () {
        //       controller.onViewCurrncyExchangeRate(context);
        //     }),
        // _buildListTile(
        //     leading: const Icon(Icons.list), title: 'Quy trình', onTap: () {}),
        // _buildListTile(
        //   leading: const Icon(Icons.list),
        //   title: 'Phân quyền',
        //   onTap: () {},
        // ),
      ],
    );
  }

  Widget _buildListTile({
    required Widget leading,
    required String title,
    required Function onTap,
    Widget? trailing,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: ListTile(
        leading: leading,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        title: Text(title),
        trailing: trailing ?? const SizedBox(),
        onTap: () {
          onTap();
        },
      ),
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Obx(
                () => Container(
                  padding: const EdgeInsets.only(right: 20, bottom: 20),
                  child: WidgetAvatar(
                    size: 50,
                    isUrl: true,
                    border: 0.5,
                    avatar: _masterController.avatar.value,
                    name: _masterController.name.value,
                  ),
                ),
              ),
              Positioned(
                right: 5,
                bottom: 5,
                child: IconButton(
                  onPressed: () {},
                  icon: FCoreImage(IconConstants.icSettingEdit,
                      width: 20, height: 20),
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _masterController.name.value,
                    style: AppTextStyle.heavy(fontSize: 20),
                  ),
                  if (_masterController.phone.value.isNotEmpty)
                    Text(
                      _masterController.phone.value,
                      style: AppTextStyle.regular(),
                    ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 6),
                    decoration: BoxDecoration(
                      color: AppColor.buttonBackgroundColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      _masterController.companySelected.value?.name ?? '',
                      style: AppTextStyle.heavy(
                          color: AppColor.secondTextColor, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildHeaderContent() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.blue.shade600,
            width: 2,
          ),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Obx(() => _masterController.isNotification.value
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: WidgetNotification(
                    content: _masterController.notificationMessage.value,
                    marginBottom: 0.0,
                    backgroundColor: _masterController.isBlueNotification.value
                        ? AppColor.pollBackgroundColor
                        : null,
                    iconColor: _masterController.isBlueNotification.value
                        ? AppColor.stateInfoColor
                        : null,
                    textColor: _masterController.isBlueNotification.value
                        ? AppColor.stateInfoColor
                        : null,
                  ),
                )
              : Container()),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildUserInfo(),
              ),
              const SizedBox(width: 16),
              Row(
                children: [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.search,
                        color: Colors.blue.shade700,
                      )),
                  IconButton(
                      onPressed: null,
                      icon: Icon(Icons.notifications,
                          color: Colors.blue.shade700)),
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Dữ liệu dùng chung'.tr,
                style: AppTextStyle.bold(
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
