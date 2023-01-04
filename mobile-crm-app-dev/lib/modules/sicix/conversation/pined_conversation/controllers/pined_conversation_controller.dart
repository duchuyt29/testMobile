import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation.dart';
import 'package:ui_api/sicix_api/models/chat/message_pin/message_pin.dart';
import 'package:ui_api/sicix_api/models/media_file/media_file.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../base/base_controller.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/constants/arguments.dart';
import '../../../../../shared/utils/dialog_util.dart';

class PinedConversationController extends BaseController {
  final Conversation convesation;
  final RxList<MessagePin> messagePinGroups;
  final RxList<MessagePin> messagePinPrivates;

  PinedConversationController(
      {required this.convesation,
      required this.messagePinGroups,
      required this.messagePinPrivates});

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  /* Action */

  void onPinMessage(MessagePin messagePin) {
    Get.back(result: messagePin);
  }

  Future<void> onDeletePinMessage(MessagePin messagePin, bool isGroup) async {
    await DialogUtil.createDialogConfirm(
        title: 'pined.remove.title'.tr,
        message: 'pined.remove.cap'.tr,
        confirmTitle: 'pined.remove.button'.tr,
        onConfirm: () => _callDeletePined(messagePin, isGroup));
  }

  Future onOpenMediaFile(MediaFile mediaFile) async {
    if (mediaFile.isImage()) {
      await Get.toNamed(SicixRoutes.IMAGE_PREIEW, arguments: {
        NAME_ARGUMENT: mediaFile.name,
        IMAGE_ARGUMENT: mediaFile.getMediaFilePath(),
      });
    } else {
      await launchUrlString(
        mediaFile.getMediaFilePath(),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  /* API */

  Future<void> _callDeletePined(MessagePin messagePin, bool isGroup) async {
    await EasyLoading.show();
    await sicixUIRepository
        .deletePin(messagePin.pinId ?? -1)
        .then((response) async {
      await EasyLoading.dismiss();
      if (response.success) {
        if (isGroup) {
          messagePinGroups
              .removeWhere((element) => element.pinId == messagePin.pinId);
          messagePinGroups.refresh();
        } else {
          messagePinPrivates
              .removeWhere((element) => element.pinId == messagePin.pinId);
          messagePinPrivates.refresh();
        }
      } else {
        await DialogUtil.createDialogMessage(
            title: 'notify.title'.tr,
            message: response.message ?? 'notify.error'.tr);
      }
    }).catchError((onError) {
      EasyLoading.dismiss();
      DialogUtil.createDialogMessage(
          title: 'notify.title'.tr, message: 'notify.error'.tr);
    });
  }
}
