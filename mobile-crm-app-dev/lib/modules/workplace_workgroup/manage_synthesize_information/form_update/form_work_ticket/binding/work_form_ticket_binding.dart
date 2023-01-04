import 'package:get/get.dart';

import '../controller/work_form_ticket_controller.dart';

class WorkFormTicketBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkFormTicketController>(() => WorkFormTicketController());
  }
}
