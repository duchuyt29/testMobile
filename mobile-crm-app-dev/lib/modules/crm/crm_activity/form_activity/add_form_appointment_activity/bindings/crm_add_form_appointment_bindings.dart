import 'package:get/get.dart';

import '../controllers/crm_add_form_appointment_controller.dart';

class CrmAddFormAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    final crmAddFormJobController = CrmAddFormAppointmentController();
    Get.lazyPut<CrmAddFormAppointmentController>(() => crmAddFormJobController);
  }
}
