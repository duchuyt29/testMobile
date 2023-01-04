import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../base/base_controller.dart';
import '../../../../shared/utils/dialog_util.dart';

class ScanQrCodeController extends BaseController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'ScanQrCode');

  final isFlash = RxBool(false);
  bool isResult = false;
  QRViewController? qrViewController;

  /* Init */

  ScanQrCodeController();

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    qrViewController?.scannedDataStream.listen((scanData) {
      if (!isResult) {
        isResult = true;
        Get.back(result: scanData.code ?? '');
      }
    });
  }

  void onPermissionSet(QRViewController controller, bool isPermission) {
    printInfo(
        info:
            '${DateTime.now().toIso8601String()}_onPermissionSet $isPermission');

    if (!isPermission) {
      DialogUtil.createDialogMessage(message: 'No Permission');
    }
  }

  @override
  Future onInit() async {
    await super.onInit();
  }

  @override
  Future dispose() async {
    qrViewController?.dispose();
    super.dispose();
  }

  @override
  Future onResumed() async {
    await super.onResumed();
    if (Platform.isAndroid) {
      await qrViewController!.pauseCamera();
    }
    await qrViewController!.resumeCamera();
  }

  /* Action */
  void onCancel() {
    Get.back();
  }

  Future onOffFlash() async {
    await qrViewController?.toggleFlash();
    await qrViewController?.getFlashStatus().then((value) {
      isFlash.value = value ?? false;
    });
  }

  Future onSwitchCamera() async {
    await qrViewController?.flipCamera();
  }
}
