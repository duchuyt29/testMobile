import '../../shared/constants/common.dart';

import 'environment/Configuration.Debug.dart';
import 'environment/Configuration.PROD.dart';
import 'environment/Configuration.UAT.dart';

class EnvConfiguration {
  final String environment;
  Map<String, String> value = <String, String>{};

  EnvConfiguration({required this.environment}) {
    getValue(environment);
  }

  void getValue(String? environment) {
    switch (environment) {
      case DEV_ENVIRONMENT:
        value = debugAppSettings;
        return;
      case UAT_ENVIRONMENT:
        value = uatAppSettings;
        return;
      case PROD_ENVIRONMENT:
        value = productAppSettings;
        return;
      default:
        value = debugAppSettings;
        return;
    }
  }
}
