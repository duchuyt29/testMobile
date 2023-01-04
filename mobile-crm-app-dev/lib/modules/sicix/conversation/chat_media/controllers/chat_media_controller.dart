import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_api/sicix_api/models/chat/conversation/conversation.dart';
import 'package:ui_api/sicix_api/models/chat/message_attach_file/message_attach_file.dart';
import 'package:ui_api/sicix_api/models/media_file/media_file.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../base/base_controller.dart';

import '../../../../../routes/sicix_pages.dart';
import '../../../../../shared/constants/arguments.dart';
import '../../../../../shared/constants/common.dart';
import '../../../../../shared/utils/dialog_util.dart';

class ChatMediaController extends BaseController {
  static const int MENU_IMAGE = 0;
  static const int MENU_FILE = 1;

  final Conversation conversation;

  final pageIndex = RxInt(MENU_IMAGE);

  final refreshMediaController = RefreshController();
  final medias = RxList<MediaFile>.empty();
  final isMediaLoading = RxBool(true);
  final isMoreMedia = RxBool(true);
  int _pageMedia = 0;

  final refreshFileController = RefreshController();
  final files = RxList<MediaFile>.empty();
  final isFileLoading = RxBool(true);
  final isMoreFile = RxBool(true);
  int _pageFile = 0;

  ChatMediaController(this.conversation);

  @override
  Future<void> onInit() async {
    await super.onInit();

    onRefreshMedia();
  }

  /* Action */
  Future<void> onSelectionPage(int index) async {
    if (pageIndex.value == index) {
      return;
    }
    pageIndex.value = index;
    if (index == 0 && isMediaLoading.value) {
      onRefreshMedia();
    } else if (index == 1 && isFileLoading.value) {
      onRefreshFile();
    }
  }

  /* Function */

  void onRefreshMedia() => _getMediaAttach(0);
  void onLoadingMedia() => _getMediaAttach(_pageMedia + 1);

  void _updateMediaRefreshController(int page, {bool isError = false}) {
    if (page == 0) {
      isError
          ? refreshMediaController.refreshFailed()
          : refreshMediaController.refreshCompleted();
    } else {
      isError
          ? refreshMediaController.loadFailed()
          : refreshMediaController.loadComplete();
    }
  }

  void onRefreshFile() => _getFileAttach(0);
  void onLoadingFile() => _getFileAttach(_pageFile + 1);

  void _updateFileRefreshController(int page, {bool isError = false}) {
    if (page == 0) {
      isError
          ? refreshFileController.refreshFailed()
          : refreshFileController.refreshCompleted();
    } else {
      isError
          ? refreshFileController.loadFailed()
          : refreshFileController.loadComplete();
    }
  }

  /* API */

  Future<void> _getMediaAttach(int page) async {
    await sicixUIRepository
        .getAttachFile(conversation.id ?? -1, MessageAttachFile.ATTACH_MEDIA,
            _pageMedia, CommonConstants.defaultSize)
        .then((response) async {
      if (response.success) {
        _updateMediaRefreshController(page);
        final attachs = (response.data?.content ?? [])
            .mapMany((item) => item.getContents())
            .toList();

        if (page == 0) {
          medias.value = attachs;
        } else {
          medias.addAll(attachs);
        }
        _pageMedia = page;
        isMoreMedia.value = response.data?.isMore() ?? false;
      } else {
        _updateMediaRefreshController(page, isError: true);
        if (response.message?.isNotEmpty ?? false) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: response.message!);
        }
      }
      isMediaLoading.value = false;
    }).catchError((onError) {
      _updateMediaRefreshController(page, isError: true);
      isMediaLoading.value = false;
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }

  Future<void> _getFileAttach(int page) async {
    await sicixUIRepository
        .getAttachFile(conversation.id ?? -1, MessageAttachFile.ATTACH_FILE,
            _pageFile, CommonConstants.defaultSize)
        .then((response) async {
      if (response.success) {
        _updateFileRefreshController(page);
        final attachs = (response.data?.content ?? [])
            .mapMany((item) => item.getContents())
            .toList();
        if (page == 0) {
          files.value = attachs;
        } else {
          files.addAll(attachs);
        }
        _pageFile = page;
        isMoreFile.value = response.data?.isMore() ?? false;
      } else {
        _updateFileRefreshController(page, isError: true);
        if (response.message?.isNotEmpty ?? false) {
          await DialogUtil.createDialogMessage(
              title: 'notify.title'.tr, message: response.message!);
        }
      }
      isFileLoading.value = false;
    }).catchError((onError) {
      _updateFileRefreshController(page, isError: true);
      isFileLoading.value = false;
      DialogUtil.createDialogMessage(
        title: 'notify.title'.tr,
        message: 'notify.error'.tr,
      );
    });
  }

  Future onMedia(MediaFile mediaFile) async {
    printInfo(info: mediaFile.getMediaFilePath());
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
}
