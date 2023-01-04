import 'package:dio/dio.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ui_api/network/dio_client.dart';
import 'package:ui_api/sicix_api/response/domain/domain_info_response.dart';

import '../../../../base/base_controller.dart';
import '../../../../base/di.dart';
import '../../../../data/app_data_global.dart';
import '../../../../routes/sicix_pages.dart';
import '../../../../shared/constants/storage.dart';
import '../../../../shared/services/path_service.dart';
import '../../../../shared/utils/dialog_util.dart';
import '../../../../shared/utils/focus.dart';

class DomainController extends BaseController {
  final formGlobalKey = GlobalKey<FormState>();

  final TextEditingController domainPathController = TextEditingController();
  final errorDomain = RxString('');

  final TextEditingController apiPathController = TextEditingController();
  final errorApiPath = RxString('');

  final expandController = ExpandableController();

  final isEnableButton = RxBool(true);

  final isExpanded = RxBool(false);

  @override
  Future<void> onInit() async {
    final domain = storage.getString(StorageConstants.DOMAIN) ?? '';
    final apiPath = storage.getString(StorageConstants.API_PATH) ?? '';
    domainPathController.text =
        domain.isEmpty ? PathService.domainPath : domain;
    apiPathController.text = apiPath.isEmpty ? PathService.apiPath : apiPath;

    await super.onInit();
  }

  @override
  void onClose() {
    super.onClose();

    domainPathController.dispose();
    apiPathController.dispose();
  }

  /* Action */

  void onEpandDomain() {
    expandController.toggle();
    isExpanded.value = expandController.expanded;
  }

  void onDomainChange(String domain) {
    isEnableButton.value = domain.isNotEmpty;
    // final index = domain.indexOf('://');
    // if (GetUtils.isURL(domain) && index != -1) {
    //   final protocol = domain.substring(0, domain.indexOf('://'));
    //   apiPathController.text =
    //       domain.replaceAll('$protocol://', '$protocol://api.');
    // }

    final uriDomain = Uri.tryParse(domain);
    if (uriDomain == null) {
      return;
    }

    apiPathController.text = Uri(
            scheme: uriDomain.scheme,
            host: 'api.${uriDomain.host}',
            port: uriDomain.port,
            path: 'xdp')
        .toString();
  }

  void onApiPathChange(String apiPath) {
    isEnableButton.value = apiPath.isNotEmpty;
  }

  void onNext() {
    AppFocus.unFocus();

    errorDomain.value = '';
    errorApiPath.value = '';
    if (formGlobalKey.currentState != null &&
        formGlobalKey.currentState!.validate()) {
      _callNext(domainPathController.text, apiPathController.text);
    }
  }

  /* Function */

  String? validatorDomain(String? domain) {
    if (errorDomain.isNotEmpty) {
      return errorDomain.value;
    } else if (domain == null) {
      errorDomain.value = 'domain.input.empty'.tr;
    } else if (!GetUtils.isURL(domain)) {
      errorDomain.value = 'domain.input.valid'.tr;
    } else if (!(domain.contains('http') || domain.contains('https'))) {
      errorDomain.value = 'domain.input.valid.protocol'.tr;
    }
    return errorDomain.value.isEmpty ? null : '';
  }

  String? validatorApiPath(String? apiPath) {
    if (errorApiPath.isNotEmpty) {
      return errorApiPath.value;
    } else if (apiPath == null) {
      errorDomain.value = 'domain.input.empty'.tr;
    } else if (!GetUtils.isURL(apiPath)) {
      errorApiPath.value = 'domain.input.valid'.tr;
    } else if (!(apiPath.contains('http') || apiPath.contains('https'))) {
      errorDomain.value = 'domain.input.valid.protocol'.tr;
    }
    return errorApiPath.value.isEmpty ? null : '';
  }

  /* API */

  Future<void> _callNext(String domainPath, String apiPath) async {
    // await storage.setString(StorageConstants.USERNAME, emailController.text);
    printInfo(info: 'Get domain config ${PathService.getConfigPath(apiPath)}');
    try {
      await EasyLoading.show();
      final dio = Dio(DioClient.optionDomain());

      final uriDomain = Uri.tryParse(domainPath);
      if (uriDomain == null) {
        return;
      }
      final domain = uriDomain.host;
      final headers = {'deviceOs': AppDataGlobal.deviceOS, 'domain': domain};
      final response = await dio.get(PathService.getConfigPath(apiPath),
          options: Options(headers: headers));
      final dataResponse = DomainInfoResponse.fromJson(response.data);
      if (dataResponse.success) {
        printInfo(
            info: 'Get domain config ${dataResponse.toJson().toString()}');
        PathService.initFromDomainInfo(
          domainInfo: dataResponse.data,
          domain: domain,
          domainPath: domainPath,
          apiPath: apiPath,
        );

        await DependencyInjection.initService();
        await EasyLoading.dismiss();
        await Get.offAndToNamed(SicixRoutes.LOGIN);
      } else {
        printError(info: 'get domain config ${dataResponse.message ?? ''}');
        await EasyLoading.dismiss();
        await DialogUtil.createDialogMessage(
          title: 'domain.failure.title'.tr,
          message: 'domain.failure.cap'.tr,
        );
      }
    } on DioError catch (e) {
      printError(info: 'Get domain config DioError ${e.toString()}');
      await EasyLoading.dismiss();
      await DialogUtil.createDialogMessage(
        title: 'domain.failure.title'.tr,
        message: 'domain.failure.cap'.tr,
      );
    } catch (e) {
      printError(info: 'Get domain config ${e.toString()}');
      await EasyLoading.dismiss();
      await DialogUtil.createDialogMessage(
        title: 'domain.failure.title'.tr,
        message: 'domain.failure.cap'.tr,
      );
    }
  }

  // Future<void> _callNextOld(String domainPath, String apiPath) async {
  //   // await storage.setString(StorageConstants.USERNAME, emailController.text);
  //   printInfo(info: 'Get domain config ${PathService.getConfigPath(apiPath)}');
  //   try {
  //     await EasyLoading.show();
  //     final dio = Dio(DioClient.optionDomain());
  //     final request = DomainConfigRequest(domainPath);
  //     final response = await dio.post(PathService.getConfigPath(apiPath),
  //         data: request.toJson());
  //     final dataResponse = DomainResponse.fromJson(response.data);
  //     if (dataResponse.success) {
  //       printInfo(
  //           info: 'Get domain config ${dataResponse.toJson().toString()}');
  //       if (dataResponse.data?.config?.apiUrl == null) {
  //         PathService.initFromDomain(domainPath, apiPath);
  //       } else {
  //         PathService.initFromDomainConfig(
  //             domainPath, apiPath, dataResponse.data!.config!);
  //       }
  //       await DependencyInjection.initService();
  //       await EasyLoading.dismiss();
  //       await Get.offAndToNamed(Routes.LOGIN);
  //     } else {
  //       printError(info: 'get domain config ${dataResponse.message ?? ''}');
  //       await EasyLoading.dismiss();
  //       await DialogUtil.createDialogMessage(
  //         title: 'domain.failure.title'.tr,
  //         message: 'domain.failure.cap'.tr,
  //       );
  //     }
  //   } on DioError catch (e) {
  //     printError(info: 'Get domain config DioError ${e.toString()}');
  //     await EasyLoading.dismiss();
  //     await DialogUtil.createDialogMessage(
  //       title: 'domain.failure.title'.tr,
  //       message: 'domain.failure.cap'.tr,
  //     );
  //   } catch (e) {
  //     printError(info: 'Get domain config ${e.toString()}');
  //     await EasyLoading.dismiss();
  //     await DialogUtil.createDialogMessage(
  //       title: 'domain.failure.title'.tr,
  //       message: 'domain.failure.cap'.tr,
  //     );
  //   }
  // }
}
