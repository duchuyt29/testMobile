import 'package:get/get.dart';

import '../../modules/common/scan_qr_code/bindings/scan_qr_code_binding.dart';
import '../../modules/common/scan_qr_code/views/scan_qr_code_screen.dart';

part 'common_routes.dart';

final commonPages = [
  GetPage(
    name: CommonRoutes.SCAN_QR_CODE,
    page: () => const ScanQrCodeScreen(),
    binding: ScanQrCodeBinding(),
  ),
];
