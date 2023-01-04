import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../routes/crm_pages.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../../../../../shared/widgets/widget_notification.dart';
import '../../../crm_master_menu/controllers/crm_master_menu_controller.dart';
import '../controllers/crm_crm_controller.dart';

part 'crm_crm_extension.dart';

class CrmCrmPage extends GetView<CrmCrmController> {
  CrmCrmPage({Key? key}) : super(key: key);

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
          child: _buildBodyContent(),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        _buildHeaderContent(),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ListTile(
              leading: const Align(
                alignment: Alignment.centerLeft,
                widthFactor: 1,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                ),
              ),
              minLeadingWidth: 0,
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              title: Text('back.to.main.menu'.tr),
              onTap: Get.back,
            ),
            Container(
              height: 5,
              color: Colors.grey.shade200,
            ),
            // ListTile(
            //   leading: const SizedBox(
            //     width: 0,
            //   ),
            //   contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            //   title: Text('overview'.tr),
            //   onTap: () {},
            // ),
            // const Divider(height: 0, indent: 10, endIndent: 10),
            _buildListTile(
              title: 'crm.account.title'.tr,
              onTap: () {
                Get.toNamed(CRMRoutes.CRM_ACCOUNT_ALL);
              },
              image: ImageConstants.crmLead,
            ),
            const Divider(height: 0, indent: 10, endIndent: 10),
            _buildListTile(
                title: 'crm.contact.title'.tr,
                image: ImageConstants.crmContact,
                onTap: () {
                  Get.toNamed(CRMRoutes.CRM_CONTACT_ALL);
                }),
            const Divider(height: 0, indent: 10, endIndent: 10),
            _buildListTile(
                title: 'crm.lead.title'.tr,
                image: ImageConstants.crmAccount,
                onTap: () {
                  Get.toNamed(CRMRoutes.CRM_LEAD_ALL);
                }),
            const Divider(height: 0, indent: 10, endIndent: 10),
            _buildListTile(
                title: 'crm.opportunity.title'.tr,
                image: ImageConstants.crmOpp,
                onTap: () {
                  Get.toNamed(CRMRoutes.CRM_OPPORTUNITY);
                }),
            const Divider(height: 0, indent: 10, endIndent: 10),
            // _buildListTile(
            //     title: 'crm.quote.title'.tr,
            //     onTap: () {
            //       Get.toNamed(CRMRoutes.CRM_QUOTE);
            //     },
            //     image: ImageConstants.crmQuote),
            // const Divider(height: 0, indent: 10, endIndent: 10),
            // _buildListTile(
            //     title: 'crm.contract.title'.tr,
            //     image: ImageConstants.crmContract),
            // const Divider(height: 0, indent: 10, endIndent: 10),
            // _buildListTile(
            //     title: 'crm.order.title'.tr, image: ImageConstants.crmOrder),
            // const Divider(height: 0, indent: 10, endIndent: 10),
            _buildListTile(
                title: 'crm.activity'.tr,
                image: ImageConstants.crmActivity,
                onTap: () => Get.toNamed(CRMRoutes.CRM_ALL_ACTIVITY)),
            const Divider(height: 0, indent: 10, endIndent: 10),
          ],
        ),
      ],
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
              Visibility(
                visible: false,
                child: Row(
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
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 24,
                right: 24,
              ),
              child: Text(
                'crm.crm'.tr,
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
                  onPressed: _masterController.onViewDetail,
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
                      style: AppTextStyle.regular(fontSize: 14),
                    ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
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
}
