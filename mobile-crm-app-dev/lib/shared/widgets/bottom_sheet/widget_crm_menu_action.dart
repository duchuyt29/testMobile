import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resource/assets_constant/images_constants.dart';
import '../../styles/text_style/text_style.dart';
import '../image_widget/fcore_image.dart';

class WidgetCrmMenuAction extends StatelessWidget {
  final GestureTapCallback? onChangeStatus;
  final GestureTapCallback? onAddActivity;
  final GestureTapCallback? onUpdateTap;
  final GestureTapCallback? onDeleteTap;
  final GestureTapCallback? onConvertTap;
  final GestureTapCallback? onChangeStateActivityTap;
  final GestureTapCallback? onEditActivityTap;
  final GestureTapCallback? onLockTap;
  final GestureTapCallback? onUnLockTap;
  final GestureTapCallback? onCheckIn;

  const WidgetCrmMenuAction({
    Key? key,
    this.onChangeStatus,
    this.onAddActivity,
    this.onUpdateTap,
    this.onDeleteTap,
    this.onConvertTap,
    this.onChangeStateActivityTap,
    this.onEditActivityTap,
    this.onLockTap,
    this.onUnLockTap,
    this.onCheckIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildLeadActivities();
  }

  Widget _buildLeadActivities() {
    return SafeArea(
      child: Column(
        children: [
          if (onChangeStatus != null)
            _buildFunctionCell(
              title: 'crm.activity.change.status'.tr,
              icon: FCoreImage(ImageConstants.crmChangeStatus),
              iconColor: Colors.white,
              iconBackgroundColor: Colors.green,
              ontap: onChangeStatus!,
            ),
          if (onAddActivity != null)
            _buildFunctionCell(
              title: 'crm.lead.add.activity'.tr,
              icon: FCoreImage(ImageConstants.crmAddActivity),
              iconColor: Colors.white,
              iconBackgroundColor: const Color(0xffF3983E),
              ontap: onAddActivity!,
            ),
          if (onUpdateTap != null)
            _buildFunctionCell(
              title: 'crm.update'.tr,
              icon: FCoreImage(ImageConstants.crmCrmUpdate),
              iconColor: Colors.white,
              iconBackgroundColor: Colors.blue,
              ontap: onUpdateTap!,
            ),
          if (onDeleteTap != null)
            _buildFunctionCell(
              title: 'crm.delete'.tr,
              icon: FCoreImage(ImageConstants.crmDeleteBin),
              iconColor: Colors.white,
              iconBackgroundColor: Colors.red,
              ontap: onDeleteTap!,
            ),
          if (onConvertTap != null)
            _buildFunctionCell(
              title: 'crm.lead.convert'.tr,
              icon: FCoreImage(ImageConstants.crmConvert),
              iconColor: Colors.white,
              iconBackgroundColor: Colors.orange,
              ontap: onConvertTap!,
            ),
          if (onChangeStateActivityTap != null)
            _buildFunctionCell(
              title: 'crm.activity.change.status'.tr,
              icon: FCoreImage(ImageConstants.crmConvert),
              iconColor: Colors.white,
              iconBackgroundColor: Colors.orange,
              ontap: onChangeStateActivityTap!,
            ),
          if (onEditActivityTap != null)
            _buildFunctionCell(
              title: 'crm.update'.tr,
              icon: FCoreImage(ImageConstants.crmCrmUpdate),
              iconColor: Colors.white,
              iconBackgroundColor: Colors.blue,
              ontap: onEditActivityTap!,
            ),
          if (onLockTap != null)
            _buildFunctionCell(
              title: 'crm.account.lock'.tr,
              icon: const Icon(
                Icons.lock_open,
                color: Colors.white,
              ),
              iconColor: Colors.white,
              iconBackgroundColor: Colors.green,
              ontap: onLockTap!,
            ),
          if (onUnLockTap != null)
            _buildFunctionCell(
              title: 'crm.account.unlock'.tr,
              icon: const Icon(
                Icons.lock_outlined,
                color: Colors.white,
              ),
              iconColor: Colors.white,
              iconBackgroundColor: Colors.redAccent,
              ontap: onUnLockTap!,
            ),
          if (onCheckIn != null)
            _buildFunctionCell(
              title: 'crm.activity.change.checkin'.tr,
              icon: const Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              iconColor: Colors.white,
              iconBackgroundColor: Colors.redAccent,
              ontap: onCheckIn!,
            ),
        ],
      ),
    );
    // return ListView.separated(
    //   itemCount: 4,
    //   shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   separatorBuilder: (context, index) => const Divider(height: 1),
    //   itemBuilder: (context, index) {
    //     switch (index) {
    //       case 0:
    //         return _buildFunctionCell(
    //           title: 'crm.update'.tr,
    //           icon: Icons.edit,
    //           iconColor: Colors.white,
    //           iconBackgroundColor: Colors.blue,
    //           ontap: onUpdateTap,
    //         );
    //       case 1:
    //         return _buildFunctionCell(
    //           title: 'crm.delete'.tr,
    //           icon: Icons.delete,
    //           iconColor: Colors.white,
    //           iconBackgroundColor: Colors.red,
    //           ontap: onDeleteTap,
    //         );
    //       case 2:
    //         return _buildFunctionCell(
    //           title: 'crm.lead.convert'.tr,
    //           icon: Icons.change_circle,
    //           iconColor: Colors.white,
    //           iconBackgroundColor: Colors.orange,
    //           ontap: onConvertTap,
    //         );
    //       default:
    //         return Container();
    //     }
    //   },
    // );
    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       CrmWidgetButtonAction(
    //           title: 'crm.update'.tr,
    //           bgColor: const Color.fromARGB(255, 0, 235, 223),
    //           icon: const Icon(
    //             Icons.edit,
    //             color: Colors.white,
    //             size: 16,
    //           ),
    //           onTap: () {
    //             Get.toNamed(CRMRoutes.CRM_LEAD_CREATE_FORM_STATUS);
    //           }),
    //       CrmWidgetButtonAction(
    //           title: 'crm.delete'.tr,
    //           bgColor: Colors.red,
    //           icon: const Icon(
    //             Icons.delete,
    //             color: Colors.white,
    //             size: 16,
    //           ),
    //           onTap: controller.showDeleteModalBottomSheet),
    //       CrmWidgetButtonAction(
    //           title: 'crm.lead.convert'.tr,
    //           bgColor: Colors.orange,
    //           icon: const Icon(
    //             Icons.change_circle,
    //             color: Colors.white,
    //             size: 16,
    //           ),
    //           onTap: controller.showStatusModalBottomSheet),
    //       CrmWidgetButtonAction(
    //           title: 'crm.lead.add.activity'.tr,
    //           bgColor: Colors.orange,
    //           icon: const Icon(
    //             Icons.more_horiz,
    //             color: Colors.white,
    //             size: 16,
    //           ),
    //           onTap: () {}),
    //     ],
    //   ),
    // );
  }

  Widget _buildFunctionCell({
    required String title,
    required Widget icon,
    required Color iconColor,
    required Color iconBackgroundColor,
    required GestureTapCallback ontap,
  }) {
    return Column(
      children: [
        ListTile(
          visualDensity: const VisualDensity(vertical: -4),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          title: Text(
            title,
            style: AppTextStyle.heavy(fontSize: 16),
          ),
          leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: icon),
          onTap: () {
            Get.back();
            ontap();
          },
        ),
        const Divider(height: 1),
      ],
    );
  }
}
