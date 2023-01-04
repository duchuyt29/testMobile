import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/styles/text_style/text_style.dart';
import '../../../../shared/widgets/button/widget_button.dart';
import '../../../../shared/widgets/widget_error.dart';
import '../controllers/domain_controller.dart';

class DomainScreen extends GetView<DomainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          'domain.title'.tr,
          style: AppTextStyle.heavy(fontSize: 20),
        ),
      ),
      body: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: controller.formGlobalKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                'domain.cap'.tr,
                style: AppTextStyle.regular(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              _buildInputDomain(),
              const SizedBox(height: 24),
              _buildExpandButton(),
              ExpandablePanel(
                controller: controller.expandController,
                collapsed: Container(),
                expanded: _buildConfigPath(),
              ),
              const SizedBox(height: 40),
              WidgetButton(
                title: 'next'.tr,
                onPressed:
                    controller.isEnableButton.value ? controller.onNext : null,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputDomain() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
          child: RichText(
            text: TextSpan(
              style: AppTextStyle.heavy(color: AppColor.thirdTextColor),
              children: [
                TextSpan(text: 'domain.input.title'.tr),
                TextSpan(
                  text: ' *',
                  style: AppTextStyle.heavy(color: AppColor.errorColor),
                ),
              ],
            ),
          ),
        ),
        TextFormField(
          controller: controller.domainPathController,
          keyboardType: TextInputType.url,
          onChanged: controller.onDomainChange,
          decoration: InputDecoration(
            hintText: 'domain.input.hint'.tr,
            errorStyle: const TextStyle(height: 0),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
          ],
          validator: (domain) => controller.validatorDomain(domain),
        ),
        Obx(
          () => (controller.errorDomain.value.isEmpty)
              ? Container()
              : WidgetError(error: controller.errorDomain.value),
        )
      ],
    );
  }

  Widget _buildExpandButton() {
    return Row(
      children: [
        Expanded(child: Container()),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: AppColor.buttonBackgroundColor.withOpacity(0.1),
            padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
            minimumSize: const Size(80, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: controller.onEpandDomain,
          child: Row(
            children: [
              Text(
                'extend'.tr,
                style: AppTextStyle.heavy(
                  fontSize: 13,
                  color: AppColor.buttonBackgroundColor,
                ),
              ),
              Obx(
                () => Icon(
                  controller.isExpanded.value
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.keyboard_arrow_right_rounded,
                  size: 20,
                  color: AppColor.buttonBackgroundColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConfigPath() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
          child: RichText(
            text: TextSpan(
              style: AppTextStyle.heavy(color: AppColor.thirdTextColor),
              children: [
                TextSpan(text: 'domain.connfig.title'.tr),
                TextSpan(
                  text: ' *',
                  style: AppTextStyle.heavy(color: AppColor.errorColor),
                ),
              ],
            ),
          ),
        ),
        TextFormField(
          controller: controller.apiPathController,
          keyboardType: TextInputType.url,
          onChanged: controller.onApiPathChange,
          maxLines: 2,
          minLines: 1,
          decoration: InputDecoration(
            hintText: 'domain.connfig.hint'.tr,
            errorStyle: const TextStyle(height: 0),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
          ],
          validator: (configPath) => controller.validatorApiPath(configPath),
        ),
        Obx(
          () => (controller.errorApiPath.value.isEmpty)
              ? Container()
              : WidgetError(error: controller.errorApiPath.value),
        )
      ],
    );
  }
}
