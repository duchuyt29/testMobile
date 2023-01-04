import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/sicix_api/models/notification/notification_model.dart';
import 'package:ui_api/sicix_api/repository/sicix_ui_repository.dart';

import '../../../../../data/app_data_global.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/utils/dialog_util.dart';
import '../../../master/controllers/master_controller.dart';

class NotificationController extends GetxController {
  final MasterController masterController;
  final _sicixUIRepository = Get.find<SicixUIRepository>();
  final refreshController = RefreshController();

  final companySelected = Rxn(AppDataGlobal.userConfig?.getLastCompany());

  final notifications = RxList<NotificationModel>.empty();
  final isLoading = RxBool(true);
  final isMore = RxBool(true);
  int _page = 0;

  NotificationController(this.masterController);

  @override
  void onInit() {
    super.onInit();

    _getNotifications();
  }

  @override
  void refresh() {
    super.refresh();

    final company = AppDataGlobal.userConfig?.getLastCompany();
    if (companySelected.value?.id != company?.id) {
      companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
      onRefresh();
    }
  }

  /* Action */

  Future<void> onChangeCompany() async {
    await Get.toNamed(SicixRoutes.CHOOSE_COMPANY)?.then((value) {
      if (value is bool && value) {
        companySelected.value = AppDataGlobal.userConfig?.getLastCompany();
        onRefresh();
      }
    });
  }

  Future<void> onMenuSelected(int itemID) async {
    notifications.removeAt(itemID);
    update();
  }

  Future<void> onReadNotification(NotificationModel notification) async {
    if (notification.id == null || notification.status == 1) {
      return;
    }
    await _callReadedNotidication(notification.id!);
  }

  /* Function */

  void onRefresh() {
    isLoading.value = true;
    _page = 0;
    isMore.value = true;
    notifications.clear();

    _getNotifications();
  }

  void onLoading() {
    if (!isMore.value) {
      return;
    }
    _page++;
    _getNotifications();
  }

  void _updateRefreshController({bool isError = false}) {
    if (isLoading.value) {
      isError
          ? refreshController.refreshFailed()
          : refreshController.refreshCompleted();
    } else {
      isError
          ? refreshController.loadFailed()
          : refreshController.loadComplete();
    }
  }

  /* API */

  Future<void> _getNotifications() async {
    await _sicixUIRepository
        .getNotifications(_page, CommonConstants.defaultSize, 'createDate,desc')
        .then((response) {
      if (response.success) {
        _updateRefreshController();
        masterController.badgeNotification.value = response.data?.unread ?? 0;
        notifications.addAll(response.data?.content ?? []);
        isMore.value = response.data?.isMore() ?? false;
      } else {
        _updateRefreshController(isError: true);
        if (response.message?.isNotEmpty ?? false) {
          DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: response.message!);
        }
      }
      isLoading.value = false;
    }).catchError((onError) {
      _updateRefreshController(isError: true);
      isLoading.value = false;
    });
  }

  Future<void> _callReadedNotidication(String notificationId) async {
    await EasyLoading.show();
    await _sicixUIRepository.readNotification(notificationId).then((response) {
      EasyLoading.dismiss();
      if (response.success) {
        masterController.badgeNotification.value -= 1;
        notifications
            .firstWhere((element) => element.id == notificationId)
            .status = 1;
        notifications.refresh();
      } else if (response.message?.isNotEmpty ?? false) {
        DialogUtil.createDialogMessage(
            title: 'notify.title'.tr, message: response.message!);
      }
    }).catchError((onError) {
      printError(info: onError.toString());
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }
}
