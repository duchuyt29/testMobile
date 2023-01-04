part of 'crm_account_related_infomation_page.dart';

extension CrmAccountRelatedExtension on CrmAccountRelatedInformationPage {
  Column _buildHeaderContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Divider(
          height: 5,
          color: Color.fromARGB(255, 86, 174, 247),
          thickness: 4,
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CrmWidgetButtonAction(
                  title: 'crm.update'.tr,
                  bgColor: const Color(0xff59CCBF),
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 16,
                  ),
                  onTap: () {}),
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
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
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
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: const Icon(
                        Icons.phone_callback_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  Text('crm.account.create.activity'.tr),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          height: 0,
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }

  ListTile _buildListTile({
    required String title,
    required String image,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: FCoreImage(
        image,
        width: 40,
        height: 40,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
      title: Text(
        title,
        style: AppTextStyle.regular(fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
