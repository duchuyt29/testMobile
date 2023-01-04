import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/form/widget_form_combobox.dart';
import '../../../../../../shared/widgets/form/widget_form_date_field.dart';
import '../../../../../../shared/widgets/form/widget_form_text_field.dart';
import '../../../../../../shared/widgets/form/widget_input_label.dart';
import '../controller/detail_lead_sale_opportunity_info_controller.dart';

class CrmDetailLeadSalesOpportunityInfoScreen
    extends GetView<CrmDetailLeadSalesOpportunityInfoController> {
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
      children: [
        _buildHeaderContent(),
        Container(
          margin: const EdgeInsets.only(top: 4),
          height: 1,
          color: const Color.fromARGB(255, 227, 227, 227),
        ),
        const SizedBox(height: 15),
        _buildFormContent(),
        const SizedBox(
          height: 90,
        ),
        _buildButtonSave(),
      ],
    );
  }

  Row _buildHeaderContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'convert'.tr,
          style: AppTextStyle.regular(fontSize: 19),
        ),
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
                Row(
                  children: [
                    Text(
                      'Thông tin cơ hội bán hàng'.tr,
                      style: AppTextStyle.bold(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                CrmWidgetBuildFormTextField(
                  title: 'Name'.tr,
                  name: 'Name'.tr,
                  isRequired: true,
                  controller: null,
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 20),
                CrmWidgetBuildCombobox(
                  title: 'crm.opportunity.stage'.tr,
                  name: 'crm.opportunity.stage'.tr,
                  items: [],
                  onChanged: (value) {},
                  isRequired: true,
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 24, bottom: 8),
                        child: WidgetInputLabel(
                          label: 'crm.price.currency'.tr,
                          isRequired: true,
                        )),
                    MultiSelectBottomSheetField(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        key: _multiSelectKey,
                        buttonIcon: const Icon(Icons.arrow_drop_down),
                        searchable: true,
                        searchHint: 'search',
                        title: Text('crm.price.currency'.tr),
                        buttonText: Text('crm.price.currency'.tr),
                        items: _items,
                        onConfirm: (value) {}),
                  ],
                ),
                const SizedBox(height: 20),
                CrmWidgetBuildFormDateField(
                  title: 'crm.activity.day.start.come'.tr,
                  controller: controller.dateDoneText,
                  selectDate: () => controller.selectDate(
                      controller.dateDoneText, controller.dateDone, false),
                  isRequired: true,
                ),
                const SizedBox(height: 40),
                CrmWidgetBuildFormTextField(
                  title: 'crm.account.personal.in.charge'.tr,
                  name: 'crm.account.personal.in.charge'.tr,
                  isRequired: true,
                  controller: null,
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 40),
                CrmWidgetBuildCombobox(
                  title: 'crm.lead.convert.status'.tr,
                  name: '',
                  items: [],
                  onChanged: (value) {},
                  isRequired: true,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonSave() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: Get.back,
              child: Text(
                'crm.contact.cancel'.tr,
                style: AppTextStyle.regular(fontSize: 18, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                primary: Colors.blue.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                //controller.onSubmitted();
              },
              child: Text(
                'crm.contact.next'.tr,
                style: AppTextStyle.regular(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

List<Animal> _animals = [
  Animal(id: 1, name: "Lion"),
  Animal(id: 2, name: "Flamingo"),
  Animal(id: 3, name: "Hippo"),
  Animal(id: 4, name: "Horse"),
  Animal(id: 5, name: "Tiger"),
  Animal(id: 6, name: "Penguin"),
  Animal(id: 7, name: "Spider"),
  Animal(id: 8, name: "Snake"),
  Animal(id: 9, name: "Bear"),
  Animal(id: 10, name: "Beaver"),
  Animal(id: 11, name: "Cat"),
  Animal(id: 12, name: "Fish"),
  Animal(id: 13, name: "Rabbit"),
  Animal(id: 14, name: "Mouse"),
  Animal(id: 15, name: "Dog"),
  Animal(id: 16, name: "Zebra"),
  Animal(id: 17, name: "Cow"),
  Animal(id: 18, name: "Frog"),
  Animal(id: 19, name: "Blue Jay"),
  Animal(id: 20, name: "Moose"),
  Animal(id: 21, name: "Gecko"),
  Animal(id: 22, name: "Kangaroo"),
  Animal(id: 23, name: "Shark"),
  Animal(id: 24, name: "Crocodile"),
  Animal(id: 25, name: "Owl"),
  Animal(id: 26, name: "Dragonfly"),
  Animal(id: 27, name: "Dolphin"),
];

final _items = _animals
    .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
    .toList();
//List<Animal> _selectedAnimals = [];
// List<Animal> _selectedAnimals2 = [];
// List<Animal> _selectedAnimals3 = [];
// //List<Animal> _selectedAnimals4 = [];
// List<Animal> _selectedAnimals5 = [];
final _multiSelectKey = GlobalKey<FormFieldState>();
