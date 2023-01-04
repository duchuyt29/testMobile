import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_custom_painter.dart';
import '../../../../../../shared/widgets/flutter_back_widget.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controller/crm_detail_quote_controllers.dart';

class CrmDetailQuotePage extends GetView<CrmDetailQuoteController> {
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
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Stack(children: [
      Column(
        children: [
          _buildHeaderContent(),
          const Divider(
            height: 5,
            color: Color.fromARGB(255, 86, 174, 247),
            thickness: 4,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: FCoreImage(
                          ImageConstants.crmCrmUpdate,
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ),
                    Text('crm.update'.tr),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: controller.showDeleteModalBottomSheet,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                    Text('crm.delete'.tr),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: controller.showCrateActivityModalBottomSheet,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: const Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                    Text('crm.quote.activity'.tr),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 245, 244, 244),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ListTile(
              leading: FCoreImage(
                ImageConstants.crmQuote,
                width: 45,
                height: 45,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'crm.quote'.tr,
                    style: AppTextStyle.heavy(fontSize: 15),
                  ),
                  Text(
                    'Báo giá công ty to đùnggg',
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
          Container(
            padding: EdgeInsets.only(left: 15),
            child: _buildListIems(
                code: 'Mã: ',
                codeText: 'SVVA',
                name: 'Tên: ',
                nameText: 'Công ty tooooo',
                account: 'Khách hàng: ',
                accountText: 'toooo',
                giaiDoan: 'Giai đoạn: ',
                giaiDoanText: 'Nhập',
                tong: 'Tổng: ',
                gtri: '1000'),
          ),
          Container(
            height: 15,
            color: Colors.grey.shade100,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            child: SizedBox(
              height: 50,
              width: 400,
              child: CustomPaint(
                painter: WidgetCustomPainter(),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                          child: Text(
                        'Không xác \nđịnh',
                        textAlign: TextAlign.center,
                        // style: TextStyle(color: Colors.white),
                        style: AppTextStyle.regular(
                            fontSize: 16, color: Colors.white),
                      )),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                          child: Text(
                        'Nháp',
                        style: AppTextStyle.regular(
                            fontSize: 18, color: Colors.white),
                      )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                          child: Text(
                        'Cần đánh \ngiá',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.regular(
                            fontSize: 16, color: Colors.white),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Trạng thái: Nháp',
                    style: AppTextStyle.bold(fontSize: 20),
                  )),
              Container(
                height: 45,
                width: 380,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 248, 94, 47),
                    ),
                    onPressed: () {},
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                          Text(
                            'Xác nhận trạng thái',
                            style: AppTextStyle.regular(
                                color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 15,
            color: Colors.grey.shade100,
          ),
          _buildListView(title: 'crm.quote.detail'.tr, ontap: () {}),
          _buildListView(title: 'crm.quote.relevent.personal'.tr, ontap: () {}),
          _buildListView(title: 'crm.quote.document', ontap: () {}),
          _buildListView(
              title: 'crm.quote.product'.tr,
              ontap: controller.onViewQuoteProduct),
        ],
      ),
      SlidingUpPanel(
          maxHeight: Get.height * 0.89,
          minHeight: Get.height * 0.1,
          panel: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                ),
                Container(
                  width: 45,
                  height: 8,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0))),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'crm.account.recent.activity'.tr,
                    style: AppTextStyle.heavy(fontSize: 20),
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                const Text('This is the sliding Widget'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
                const Text('data'),
              ],
            ),
          ),
          collapsed: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                )),
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                  ),
                  Container(
                    width: 45,
                    height: 8,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0))),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'crm.account.recent.activity'.tr,
                      style: AppTextStyle.heavy(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          )),
    ]);
  }

  Container _buildListView({
    required String title,
    required VoidCallback ontap,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -4),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        title: Text(title),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
        onTap: ontap,
      ),
    );
  }

  Column _buildHeaderContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackPageWidget(
              backText: ''.tr,
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
      ],
    );
  }

  Container _buildListIems({
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
                Expanded(
                    flex: 2,
                    child: Text(nameText, style: TextStyle(color: Colors.blue)))
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
                    child: Text(
                      accountText,
                    ))
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
            padding: const EdgeInsets.only(top: 5, bottom: 10),
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
