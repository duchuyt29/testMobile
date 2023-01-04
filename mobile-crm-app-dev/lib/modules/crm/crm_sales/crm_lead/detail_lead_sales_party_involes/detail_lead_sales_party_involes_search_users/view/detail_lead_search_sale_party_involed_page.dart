import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../../routes/crm_pages.dart';
import '../../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controller/detail_lead_search_sale_party_involes_controller.dart';

class DetailLeadSearchUsersSalePartyInvolesScreen
    extends GetView<DetailLeadSearchUsersSalesPartyInvolesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
        //toolbarHeight: 0,
        leading: IconButton(
          onPressed: Get.back,
          iconSize: 20,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
        ),
        actions: [
          _buildButtonAdd(
            onTap: () {
              Get.toNamed(CRMRoutes.CRM_CONVERT_LEAD_CREATE_ACCOUNT);
            },
          ),
          const SizedBox(width: 10),
        ],
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
        _buildFormContent(),
        const SizedBox(
          height: 300,
        ),
        //_buildButtonSave(),
      ],
    );
  }

  Container _buildFormContent() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          FormBuilder(
            //key: controller.fbKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FormBuilderTextField(
                      name: 'name',
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'crm.lead.search.users'.tr,
                        suffixIcon: const IconButton(
                          icon: Icon(Icons.search),
                          onPressed: null,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        errorStyle: const TextStyle(height: 0),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(255),
                      ],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'crm.validation.required'.tr),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonAdd({
    required final onTap,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: FCoreImage(
              ImageConstants.crmCreate,
              width: 30,
              height: 30,
            ),
          ),
        ),
      ],
    );
  }
}
