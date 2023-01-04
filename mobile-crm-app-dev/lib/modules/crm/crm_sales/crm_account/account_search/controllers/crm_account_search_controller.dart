import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ui_api/crm_api/models/account/account.dart';

import '../../../../../../base/base_controller.dart';

class CrmAccountSearchController extends BaseController {
  final recentAccounts = RxList([]);
  final accounts = RxList([]);
  final searchController = TextEditingController();
  final isSearch = RxBool(false);

  @override
  Future<void> onInit() async {
    await super.onInit();
    // generate recent accounts fake data
    for (var i = 0; i < 20; i++) {
      recentAccounts.add(Account(
        id: i,
        accountName: 'Account $i',
        accountCode: 'ACC$i',
      ));
    }
  }

  Future<void> onSearchAccount(String value) async {
    // search account fake data here
    if (value.isEmpty) {
      isSearch.value = false;
      accounts.clear();
    } else {
      isSearch.value = true;
      accounts.clear();
      for (var i = 0; i < 10; i++) {
        accounts.add(Account(
          id: i,
          accountName: 'Account search $i',
          accountCode: 'ACC searcg $i',
        ));
      }
    }
  }

  Future<void> onClearSearch() async {
    searchController.clear();
    accounts.clear();
    isSearch.value = false;
  }
}
