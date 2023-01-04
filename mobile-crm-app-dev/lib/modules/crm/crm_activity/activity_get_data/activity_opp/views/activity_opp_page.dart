import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../controllers/activity_opp_controller.dart';

class ActivityOppPage extends GetView<ActivtyOppController> {
  ActivityOppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'crm.activity.opp'.tr,
          style: AppTextStyle.regular(fontSize: 20, color: Colors.white),
        ),
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
        _buildSearchBar(),
        Expanded(
          child: Obx(() => ListView.builder(
                itemCount: controller.filterData.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      controller.onChange(controller.filterData[i]);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.filterData[i].opportunityName ?? ''),
                          // controller.provinces.value?[i].id !=
                          //         controller.initialValue
                          //     ? Container()
                          //     : Padding(
                          //         padding: const EdgeInsets.only(right: 10),
                          //         child: Icon(
                          //           Icons.check,
                          //           color: Colors.red.shade700,
                          //         ),
                          //       ),
                        ],
                      ),
                    ),
                  );
                },
              )),
        ),
      ],
    );
  }

  Container _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onChanged: controller.onSearch,
        decoration: InputDecoration(
          hintText: 'search'.tr,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26,
          ),
        ),
      ),
    );
  }
}
