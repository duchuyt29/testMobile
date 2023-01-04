import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/auth/user_config/company.dart';

import '../../../../../resource/assets_constant/icon_constants.dart';
import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../shared/widgets/button/widget_button.dart';
import '../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../../../../../shared/widgets/widget_avatar.dart';
import '../controllers/choose_company_controller.dart';

class ChooseCompanyScreen extends GetView<ChooseCompanyController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBodyContent(),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      children: [
        _buildTitle(),
        Expanded(
          child: Obx(
            () => ListView.builder(
              itemCount: controller.companies.length,
              itemBuilder: (context, index) =>
                  _buildCompanyCell(controller.companies[index]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    final companySelected = controller.companySelected.value;
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
      child: Column(
        children: [
          WidgetAvatar(
            size: 100,
            fit: BoxFit.contain,
            isUrl: true,
            name: companySelected?.name ?? '',
            avatar: companySelected?.getAvatar(),
          ),
          const SizedBox(height: 20),
          Text(
            companySelected?.name ?? '',
            style: AppTextStyle.heavy(fontSize: 29),
          ),
          const SizedBox(height: 8),
          Text(
            'choose.company.selected'.trArgs([companySelected?.name ?? '']),
            style: AppTextStyle.regular(color: AppColor.fourthTextColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'choose.company.cap'.tr,
              style: AppTextStyle.regular(color: AppColor.fourthTextColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyCell(Company company) {
    return InkWell(
      onTap: () => controller.onChooseCompany(company),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Row(
          children: [
            WidgetAvatar(
              size: 46,
              fit: BoxFit.contain,
              isUrl: true,
              name: company.name ?? '',
              avatar: company.getAvatar(),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    company.name ?? '',
                    style: AppTextStyle.heavy(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Text(
                      company.internationalName ?? '',
                      style: AppTextStyle.regular(
                          color: AppColor.fourthTextColor, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Obx(
              () => FCoreImage(
                controller.companySelected.value == company
                    ? IconConstants.icRadioOn
                    : IconConstants.icRadioOff,
                width: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: WidgetButton(
              title: 'confirm'.tr,
              onPressed: controller.onComplete,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 55,
              child: TextButton(
                onPressed: controller.onCancel,
                child: Text(
                  'back'.tr,
                  style: AppTextStyle.heavy(
                    color: AppColor.primaryButtonColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
