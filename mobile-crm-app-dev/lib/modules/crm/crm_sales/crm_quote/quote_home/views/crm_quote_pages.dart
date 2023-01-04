import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_search_bar.dart';
import '../../../../../../shared/widgets/flutter_back_widget.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/crm_quote_controller.dart';

class CrmQuotePage extends GetView<CrmQuoteController> {
  CrmQuotePage({Key? key}) : super(key: key);

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackPageWidget(
              backText: 'crm.come.back'.tr,
            ),
            Container(
              padding: EdgeInsets.only(right: 5),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: FCoreImage(
                        ImageConstants.crmCrmUpLoad,
                        height: 55,
                        width: 55,
                      )),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'crm.quote'.tr,
                style: AppTextStyle.heavy(fontSize: 20),
              ),
            ),
            TextButton(onPressed: () {}, child: Text('crm.create.new'.tr))
          ],
        ),
        CrmWidgetSearchBar(label: 'Tìm kiếm Báo giá'.tr, onTap: () {}),
        const Divider(
          height: 25,
          color: Colors.blue,
          thickness: 4,
        ),
        Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'crm.list'.tr,
              style: AppTextStyle.heavy(fontSize: 16, color: Colors.black54),
            )),
        Container(
          child: ListTile(
            leading: Icon(
              Icons.list,
              color: Colors.blue.shade900,
              size: 34,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            minLeadingWidth: 0,
            title: Text('crm.quote.all'.tr,
                style: AppTextStyle.regular(fontSize: 18)),
            onTap: controller.onViewAllQuote,
          ),
        ),
        Container(
          height: 10,
          color: Colors.grey.shade200,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'crm.recently.viewed'.tr,
              style: AppTextStyle.heavy(fontSize: 16, color: Colors.black54),
            )),
      ],
    );
  }
}
