part of 'crm_account_search_page.dart';

extension CrmAccountSearchExtension on CrmAccountSearchPage {
  Widget _buildSearchInput() {
    return Obx(
      () => Row(
        children: [
          IconButton(
              onPressed: Get.back,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
                size: 18,
              )),
          Expanded(
            child: Container(
              height: 50,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                controller: controller.searchController,
                onChanged: (value) {
                  controller.onSearchAccount(value);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 26,
                  ),
                  suffixIcon: controller.accounts.isNotEmpty
                      ? IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 26,
                          ),
                          onPressed: () {
                            controller.onClearSearch();
                          },
                        )
                      : const SizedBox.shrink(),

                  // helperText: "Search your topic",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: 'crm.account.search'.tr,
                  labelStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  contentPadding: const EdgeInsets.only(left: 10, right: 10),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  isDense: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
