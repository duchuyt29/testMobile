import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../controllers/crm_productfamily_edit_controllers.dart';

class CrmProductFamilyEditPage extends GetView<CrmProductFamilyEditController> {
  bool isChecked = false;
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
    return Container(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(
              onPressed: Get.back,
              child: Text(
                'crm.activity.cancel'.tr,
                style: AppTextStyle.regular(fontSize: 18, color: Colors.blue),
              ),
            ),
            Text(
              'crm.product.family.edit'.tr,
              style: AppTextStyle.regular(fontSize: 20),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'crm.activity.save'.tr,
                style: AppTextStyle.regular(fontSize: 18, color: Colors.blue),
              ),
            ),
          ]),
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 1,
            color: const Color.fromARGB(255, 227, 227, 227),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(height: 24),
                _buildInputCode(),
                const SizedBox(height: 24),
                _buildInputNamePrice(),
                const SizedBox(height: 24),
                const SizedBox(height: 24),
                _buildInputDescription(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInputCode() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
          child: RichText(
            text: TextSpan(
              style: AppTextStyle.regular(color: AppColor.thirdTextColor),
              children: [
                TextSpan(
                  text: '*',
                  style: AppTextStyle.heavy(color: AppColor.errorColor),
                ),
                TextSpan(
                    text: 'crm.product.family.code'.tr,
                    style: AppTextStyle.regular()),
              ],
            ),
          ),
        ),
        TextFormField(
          controller: controller.MaPrice,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
          ],
        ),
      ],
    );
  }

  Widget _buildInputNamePrice() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
          child: RichText(
            text: TextSpan(
              style: AppTextStyle.regular(color: AppColor.thirdTextColor),
              children: [
                TextSpan(
                  text: '*',
                  style: AppTextStyle.heavy(color: AppColor.errorColor),
                ),
                TextSpan(
                    text: 'crm.product.family.name'.tr,
                    style: AppTextStyle.regular()),
              ],
            ),
          ),
        ),
        TextFormField(
          controller: controller.TenPrice,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            errorStyle: TextStyle(height: 0),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
          ],
        ),
      ],
    );
  }

  Widget _buildInputDescription() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
          child: RichText(
            text: TextSpan(
              style: AppTextStyle.regular(color: AppColor.thirdTextColor),
              children: [
                TextSpan(text: 'crm.desc'.tr),
              ],
            ),
          ),
        ),
        TextFormField(
          controller: controller.MoTa,
          maxLines: 3,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            errorStyle: TextStyle(height: 0),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
          ],
        ),
      ],
    );
  }
}
