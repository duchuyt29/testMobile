import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../resource/assets_constant/images_constants.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../shared/widgets/crm/widget_button_action.dart';
import '../../../../../../shared/widgets/flutter_back_widget.dart';
import '../../../../../../shared/widgets/image_widget/fcore_image.dart';
import '../controller/crm_quote_product_controller.dart';

class CrmQuoteProductPage extends GetView<CrmQuoteProductController> {
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
    return Column(
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
            children: [
              CrmWidgetButtonAction(
                title: 'crm.quote.view.price'.tr,
                bgColor: Color.fromARGB(255, 43, 44, 106),
                icon: FCoreImage(
                  ImageConstants.crmPriceList,
                ),
                onTap: () {},
              ),
              SizedBox(
                width: 80,
              ),
              CrmWidgetButtonAction(
                  title: 'crm.quote.add.product'.tr,
                  bgColor: Colors.blue,
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                  onTap: () {}),
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
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'crm.quote.product'.tr,
              style: AppTextStyle.bold(fontSize: 25),
            )),
        Container(
          height: 15,
          color: Colors.grey.shade100,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: ExpansionTile(
                  title: Container(
                    padding: EdgeInsets.only(top: 11, bottom: 10),
                    child: Row(children: [
                      Text(
                        'SaleForce',
                        style: AppTextStyle.bold(fontSize: 20),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'SF',
                        style: AppTextStyle.bold(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ]),
                  ),
                  subtitle: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(flex: 1, child: Text('Số lượng: ')),
                              Expanded(flex: 2, child: Text('1'))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(flex: 1, child: Text('Giá bán: ')),
                              Expanded(flex: 2, child: Text('5500 USD'))
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(flex: 1, child: Text('Thành tiền')),
                              Expanded(flex: 2, child: Text('5500 USD'))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // initiallyExpanded: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  children: <Widget>[
                    Container(
                      width: Get.width * .65,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Giá sau triết khấu: ')),
                                SizedBox(width: 29),
                                Expanded(flex: 2, child: Text('10000'))
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(flex: 1, child: Text('Thuế: ')),
                                SizedBox(width: 29),
                                Expanded(flex: 2, child: Text('5%'))
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(flex: 1, child: Text('Tổng: ')),
                                SizedBox(width: 29),
                                Expanded(flex: 2, child: Text('10000'))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: ExpansionTile(
                  title: Container(
                    padding: EdgeInsets.only(top: 11, bottom: 10),
                    child: Row(children: [
                      Text(
                        'SaleForce',
                        style: AppTextStyle.bold(fontSize: 20),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'SF',
                        style: AppTextStyle.bold(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ]),
                  ),
                  subtitle: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(flex: 1, child: Text('Số lượng: ')),
                              Expanded(flex: 2, child: Text('1'))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(flex: 1, child: Text('Giá bán: ')),
                              Expanded(flex: 2, child: Text('5500 USD'))
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(flex: 1, child: Text('Thành tiền')),
                              Expanded(flex: 2, child: Text('5500 USD'))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // initiallyExpanded: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  children: <Widget>[
                    Container(
                      width: Get.width * .65,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Giá sau triết khấu: ')),
                                SizedBox(width: 29),
                                Expanded(flex: 2, child: Text('10000'))
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(flex: 1, child: Text('Thuế: ')),
                                SizedBox(width: 29),
                                Expanded(flex: 2, child: Text('5%'))
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(flex: 1, child: Text('Tổng: ')),
                                SizedBox(width: 29),
                                Expanded(flex: 2, child: Text('10000'))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
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
}
