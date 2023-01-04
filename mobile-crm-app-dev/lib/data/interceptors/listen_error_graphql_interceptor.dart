import 'package:get/get.dart';

import '../../shared/dialog_manager/data_models/request/common_dialog_request.dart';
import '../../shared/dialog_manager/data_models/type_dialog.dart';
import '../../shared/network/constants/constants.dart';
import '../common/define_field.dart';

abstract class ListenErrorGraphQL {
  CommonDialogRequest handleErrorGraphQLResponse(Object e) {
    if (e == Unauthorized_Error_Code ||
        e == ErrorExpiredTokenCode ||
        e == ACCESS_DENIED) {
      return CommonDialogRequest(
        title: 'error'.tr,
        description: 'expired_token'.tr,
        typeDialog: DIALOG_ONE_BUTTON,
        defineEvent: ErrorExpiredTokenCode,
      );
    }

    if (e == No_Connect_Network) {
      return CommonDialogRequest(
        title: 'network_error'.tr,
        description: 'network_error_message'.tr,
        defineEvent: NO_CONNECT_NETWORK,
      );
    }

    if (e.toString().isNotEmpty) {
      return CommonDialogRequest(
        title: 'error'.tr,
        description: e.toString(),
        defineEvent: Unknown_Error,
      );
    }

    return CommonDialogRequest(
      title: 'error'.tr,
      description: 'unknown_error'.tr,
      typeDialog: DIALOG_ONE_BUTTON,
      defineEvent: Unknown_Error,
    );
  }
}
