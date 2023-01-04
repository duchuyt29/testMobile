import 'package:get/get.dart';

import '../controller/workplace_dashboard_addmeet_controller.dart';

class WorkPlaceDashBoardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<WorkPlaceDashBoardAddMeetingController>(
        () => WorkPlaceDashBoardAddMeetingController());
  }
}
