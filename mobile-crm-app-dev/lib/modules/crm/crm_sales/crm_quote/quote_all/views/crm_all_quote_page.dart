import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_button_action.dart';
import '../../../../../../shared/widgets/crm/widget_search_bar.dart';
import '../../../../../../shared/widgets/flutter_back_widget.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controllers/crm_all_quote_controllers.dart';

class CrmAllQuotePage extends GetView<CrmAllQuoteController> {
  CrmAllQuotePage({Key? key}) : super(key: key);

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
        child: _buildBodyContent(context),
      ),
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    return Column(
      children: [
        _buildHeaderContent(context),
        _buildActionContent(),
        _buildMainContent()
      ],
    );
  }

  Widget _buildHeaderContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.blue.shade400,
            width: 3,
          ),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildTopBtnsContent(context),
          CrmWidgetSearchBar(label: 'crm.quote.search'.tr, onTap: () {}),
        ],
      ),
    );
  }

  Row _buildTopBtnsContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackPageWidget(
          backText: 'crm.quote'.tr,
        ),
        Container(
          padding: const EdgeInsets.only(right: 5),
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
    );
  }

  Widget _buildActionContent() {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CrmWidgetButtonAction(
            title: 'crm.filter'.tr,
            bgColor: Color.fromARGB(255, 43, 44, 106),
            icon: Icon(
              Icons.filter_alt,
              color: Colors.white,
              size: 16,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Expanded(
      child: Column(children: [
        ListTile(
          leading: FCoreImage(
            ImageConstants.crmQuote,
            width: 50,
            height: 50,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          title: Text(
            'crm.quote.all'.tr,
            style: AppTextStyle.bold(fontSize: 20),
          ),
        ),
        Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildListItem();
                })),
      ]),
    );
  }

  Widget _buildListItem() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildListIems(
              title: 'Báo giá công ty to đùnggg',
              code: 'Mã: ',
              codeText: 'SVVA',
              name: 'Tên: ',
              nameText: 'Công ty tooooo',
              account: 'Khách hàng: ',
              accountText: 'toooo',
              giaiDoan: 'Giai đoạn: ',
              giaiDoanText: 'Nhập',
              tong: 'Tổng: ',
              gtri: '1000')
        ],
      ),
    );
  }

  Container _buildListIems({
    required String title,
    required String code,
    required String codeText,
    required String name,
    required String nameText,
    required String account,
    required String accountText,
    required String giaiDoan,
    required String giaiDoanText,
    required String tong,
    required String gtri,
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: TextButton(
              onPressed: null,
              child: Text(
                title,
                style: AppTextStyle.heavy(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(code)),
                Expanded(flex: 2, child: Text(codeText))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(name)),
                Expanded(flex: 2, child: Text(nameText))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(account)),
                Expanded(
                    flex: 2,
                    child:
                        Text(accountText, style: TextStyle(color: Colors.blue)))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(giaiDoan)),
                Expanded(flex: 2, child: Text(giaiDoanText))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text(tong)),
                Expanded(flex: 2, child: Text(gtri))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
