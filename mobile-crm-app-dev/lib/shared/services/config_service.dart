import 'package:get/get.dart';
import '../../data/app_data_global.dart';
import '../../resource/config/config_environment.dart';

class ConfigService {
  Future<EnvConfiguration> init(String environment) async {
    AppDataGlobal.env = environment;
    final envConfiguration = EnvConfiguration(environment: environment);
    Get.put(envConfiguration, permanent: true);
    return envConfiguration;
  }
}
