import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/base_controller.dart';
import '../../../data/app_data_global.dart';
import '../../../resource/assets_constant/icon_constants.dart';
import '../../../resource/assets_constant/images_constants.dart';
import '../../../routes/crm_pages.dart';
import '../../../routes/sicix_pages.dart';
import '../../constants/colors.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';
import '../widget_avatar.dart';

class CrmDrawerController extends BaseController {
  final companySelected = Rxn(AppDataGlobal.userConfig?.getLastCompany());
  final name = RxString(AppDataGlobal.userInfo?.getName() ?? '');
  final avatar = RxString(AppDataGlobal.userInfo?.getAvatar() ?? '');
  final phone = RxString(AppDataGlobal.userInfo?.getPhone() ?? '');

  final isNotification = RxBool(false);
  final isBlueNotification = RxBool(false);
  RxString notificationMessage = RxString('');

  @override
  void refresh() {
    super.refresh();

    final company = AppDataGlobal.userConfig?.getLastCompany();
    if (companySelected.value?.id != company?.id) {
      companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
    }
  }

  /* Action */

  Future<void> onViewDetail() async {
    await Get.toNamed(SicixRoutes.PROFILE_DETAIL,
            arguments: AppDataGlobal.userInfo)
        ?.then((value) async {
      name.value = AppDataGlobal.userInfo?.getName() ?? '';
      avatar.value = AppDataGlobal.userInfo?.getAvatar() ?? '';
      phone.value = AppDataGlobal.userInfo?.getPhone() ?? '';
      if (value is bool && value) {
        isNotification.value = true;
        isBlueNotification.value = false;
        notificationMessage.value = 'notification.update.profile.success'.tr;
        await Future.delayed(const Duration(milliseconds: 3000)).then((value) {
          isNotification.value = false;
          notificationMessage.value = '';
        });
      }
    });
  }

  Future<void> onEdit() async {
    await Get.toNamed(SicixRoutes.EDIT_PROFILE,
            arguments: AppDataGlobal.userInfo)
        ?.then((value) async {
      name.value = AppDataGlobal.userInfo?.getName() ?? '';
      avatar.value = AppDataGlobal.userInfo?.getAvatar() ?? '';
      phone.value = AppDataGlobal.userInfo?.getPhone() ?? '';
      if (value is bool && value) {
        isNotification.value = true;
        isBlueNotification.value = false;
        notificationMessage.value = 'notification.update.profile.success'.tr;
        await Future.delayed(const Duration(milliseconds: 3000)).then((value) {
          isNotification.value = false;
          notificationMessage.value = '';
        });
      }
    });
  }
}

class CrmDrawer extends StatelessWidget {
  CrmDrawer({
    Key? key,
  }) : super(key: key);

  final CrmDrawerController controller = Get.put(CrmDrawerController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width * 0.8,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: Get.mediaQuery.padding.top + 10),
            child: Column(
              children: [
                _buildUserInfo(),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'crm.crm'.tr,
                      style: AppTextStyle.heavy(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.menu,
              size: 32,
            ),
            title: Text(
              'main.menu'.tr,
              style: AppTextStyle.regular(fontSize: 16),
            ),
            onTap: () {
              Get.back();
              Get.toNamed(CRMRoutes.CRM_MASTER_MENU);
            },
          ),
          Container(
            height: 5,
            color: Colors.grey.shade200,
          ),
          ListTile(
            leading: const SizedBox(),
            title: Text(
              'overview'.tr,
              style: AppTextStyle.regular(fontSize: 16),
            ),
            onTap: () {},
          ),
          const Divider(height: 0, indent: 10, endIndent: 10),
          _buildListTile(
              title: 'crm.account.title'.tr,
              onTap: () {
                Get.back();
                Get.toNamed(CRMRoutes.CRM_ACCOUNT_ALL);
              },
              image: ImageConstants.crmAccount),
          const Divider(height: 0, indent: 10, endIndent: 10),
          _buildListTile(
              title: 'crm.contact.title'.tr,
              image: ImageConstants.crmContact,
              onTap: () {
                Get.back();
                Get.toNamed(CRMRoutes.CRM_CONTACT_ALL);
              }),
          const Divider(height: 0, indent: 10, endIndent: 10),
          _buildListTile(
              title: 'crm.lead.title'.tr,
              image: ImageConstants.crmCrmLead,
              onTap: () {
                Get.back();
                Get.toNamed(CRMRoutes.CRM_LEAD);
              }),
          const Divider(height: 0, indent: 10, endIndent: 10),
          _buildListTile(
              title: 'crm.opportunity.title'.tr, image: ImageConstants.crmOpp),
          const Divider(height: 0, indent: 10, endIndent: 10),
          _buildListTile(
              title: 'crm.quote.title'.tr,
              onTap: () {
                Get.back();
                Get.toNamed(CRMRoutes.CRM_QUOTE);
              },
              image: ImageConstants.crmQuote),
          const Divider(height: 0, indent: 10, endIndent: 10),
          _buildListTile(
              title: 'crm.contract.title'.tr,
              image: ImageConstants.crmContract),
          const Divider(height: 0, indent: 10, endIndent: 10),
          _buildListTile(
              title: 'crm.order.title'.tr, image: ImageConstants.crmOrder),
          const Divider(height: 0, indent: 10, endIndent: 10),
          _buildListTile(
            title: 'crm.activity'.tr,
            image: ImageConstants.crmActivity,
            onTap: () {
              Get.back();
              Get.toNamed(CRMRoutes.CRM_ACTIVITY);
            },
          ),
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
                    avatar: controller.avatar.value,
                    name: controller.name.value,
                  ),
                ),
              ),
              Positioned(
                right: 5,
                bottom: 5,
                child: IconButton(
                  onPressed: controller.onViewDetail,
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
                    controller.name.value,
                    style: AppTextStyle.heavy(fontSize: 20),
                  ),
                  if (controller.phone.value.isNotEmpty)
                    Text(
                      controller.phone.value,
                      style: AppTextStyle.regular(fontSize: 14),
                    ),
                  const SizedBox(height: 5),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    decoration: BoxDecoration(
                      color: AppColor.buttonBackgroundColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      controller.companySelected.value?.name ?? '',
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

  ListTile _buildListTile({
    required String title,
    required String image,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: FCoreImage(
        image,
        width: 40,
        height: 40,
      ),
      // contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      title: Text(
        title,
        style: AppTextStyle.regular(fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
