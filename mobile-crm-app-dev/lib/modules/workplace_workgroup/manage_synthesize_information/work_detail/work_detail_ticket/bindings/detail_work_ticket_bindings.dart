import 'package:get/get.dart';

import '../controllers/detail_work_ticket_controller.dart';

class DetailWorkTicketBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailWorkTicketController>(
      () => DetailWorkTicketController(),
    );
  }
}
