import 'package:get/get.dart';

import '../data/interceptors/auth_interceptor.dart';
import '../resource/config/config_environment.dart';
import '../shared/constants/common.dart';

class BaseProvider extends GetConnect {
  final config = Get.find<EnvConfiguration>();

  @override
  void onInit() {
    // httpClient
    //   ..baseUrl = config.value[GraphQLAuthUrl]
    //   ..addAuthenticator(authInterceptor)
    //   ..addRequestModifier(requestInterceptor);
  }
}
