import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account_address.dart';
import '../../../../../../../shared/styles/text_style/text_style.dart';
import '../../../../../../../shared/widgets/crm/widget_button.dart';
import '../../../../../../../shared/widgets/crm/widget_slidable.dart';
import '../controllers/account_address_view_controllers.dart';

class AccountAddressViewPage extends GetView<AccountAddressViewController> {
  AccountAddressViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('crm.account.address.title'.tr,
            style: AppTextStyle.heavy(fontSize: 20, color: Colors.white)),
        actions: [
          CrmWidgetButton(
            bgColor: const Color.fromARGB(255, 85, 176, 249),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 18,
            ),
            onTap: controller.create,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        top: false,
        child: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return Container(
      child: Obx(
        () => Container(
          child: controller.accountAddress.value != null
              ? _buildItemAddress(items: controller.accountAddress.value!)
              : Container(),
        ),
      ),
    );
  }

  Container _buildItemAddress({required List<AccountAddress> items}) {
    return Container(
        child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i) {
        return CrmWidgetSlidable(
          endActions: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  controller.edit(items[i].id ?? 0);
                },
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
              if (items[i].isMain != 1)
                SlidableAction(
                  onPressed: (context) {
                    controller.onDeleteAddress(items[i].id ?? 0);
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
            ],
          ),
          child: _buildItem(item: items[i], index: i),
        );
      },
    ));
  }

  Container _buildItem({required AccountAddress item, required int index}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey.shade300))),
      child: InkWell(
        onTap: () {
          controller.edit(item.id ?? 0);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.orangeAccent,
                  size: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    item.isMain == 1 ? 'Địa chỉ mặc định' : 'Địa chỉ bổ sung',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                item.getFullAddress(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
