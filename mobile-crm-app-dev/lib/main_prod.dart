import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';

import 'app.dart';
import 'base/di.dart';
import 'firebase_options.dart';
import 'shared/constants/common.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, // Color for Android
      statusBarBrightness: Brightness.light, // for IOS.
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    Get.log(e.toString(), isError: true);
  }
  await DependencyInjection.init(PROD_ENVIRONMENT);

  runApp(App());
  configLoading();
}
