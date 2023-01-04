import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

void registerPlugins(Registrar registrar) {
  SharedPreferencesPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
