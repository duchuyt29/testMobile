import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../shared/styles/text_style/text_style.dart';
import '../controllers/scan_qr_code_controller.dart';

class ScanQrCodeScreen extends GetView<ScanQrCodeController> {
  const ScanQrCodeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: controller.qrKey,
            onQRViewCreated: controller.onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: Get.width * 0.8,
            ),
            onPermissionSet: (ctrl, p) => controller.onPermissionSet(ctrl, p),
          ),
          Positioned(
            left: 10,
            top: 20,
            child: TextButton(
              onPressed: controller.onCancel,
              child: Text(
                'cancel'.tr,
                style: AppTextStyle.regular(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 20,
            child: Obx(() {
              return IconButton(
                onPressed: () => controller.onOffFlash(),
                icon: controller.isFlash.value
                    ? const Icon(Icons.flash_on)
                    : const Icon(Icons.flash_off),
                color: Colors.white,
              );
            }),
          ),
          Positioned(
            right: 10,
            bottom: 20,
            child: IconButton(
              onPressed: () => controller.onSwitchCamera(),
              icon: const Icon(Icons.switch_camera),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
