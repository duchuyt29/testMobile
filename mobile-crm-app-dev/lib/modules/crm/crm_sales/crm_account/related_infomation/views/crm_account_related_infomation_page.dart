import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_button_action.dart';
import '../../../../../../shared/widgets/crm/widget_crm_drawer.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/crm_account_related_infomation.dart';

part 'crm_account_related_extension.dart';

class CrmAccountRelatedInformationPage
    extends GetView<CrmAccountRelatedInformationController> {
  const CrmAccountRelatedInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.infor.related'.tr,
          style: AppTextStyle.heavy(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SafeArea(top: false, child: _buildBodyContent()),
    );
  }

  Container _buildBodyContent() {
    return Container(
      padding: EdgeInsets.only(bottom: Get.height * 0.2),
      child: Column(
        children: [
          _buildHeaderContent(),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 245, 244, 244),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: ListTile(
                        leading: SvgPicture.asset(
                          ImageConstants.crmLead,
                          width: 50,
                          height: 50,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Khách hàng',
                              style: AppTextStyle.heavy(fontSize: 15),
                            ),
                            Text(
                              'Công ty TNHH AVVCCC',
                              style: AppTextStyle.bold(fontSize: 20),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                _buildListInfor(),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildListInfor() {
    return Column(
      children: [
        _buildListTile(
          title: 'crm.lead.title'.tr,
          image: ImageConstants.crmAccount,
          onTap: () {},
        ),
        const Divider(height: 0, indent: 10, endIndent: 10),
        _buildListTile(
            title: 'crm.opportunity.title'.tr, image: ImageConstants.crmOpp),
        const Divider(height: 0, indent: 10, endIndent: 10),
        _buildListTile(
            title: 'crm.quote.title'.tr,
            onTap: () {},
            image: ImageConstants.crmQuote),
        const Divider(height: 0, indent: 10, endIndent: 10),
        _buildListTile(
            title: 'crm.contract.title'.tr, image: ImageConstants.crmContract),
        const Divider(height: 0, indent: 10, endIndent: 10),
        _buildListTile(
            title: 'crm.order.title'.tr, image: ImageConstants.crmOrder),
        _buildListTile(
            title: 'crm.lead.product'.tr, image: ImageConstants.crmProduct),
      ],
    );
  }
}
