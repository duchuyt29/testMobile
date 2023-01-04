import 'package:get/get.dart';
import '../dialog_manager/services/dialog_service.dart';

class LocateService extends GetxService {
  Future<DialogService> init() async {
    Get.lazyPut<DialogService>(() => DialogService());
    return DialogService();
  }
}
