import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import 'base/app_binding.dart';
import 'resource/lang/translation_service.dart';
import 'routes/common_pages.dart';
import 'routes/crm_pages.dart';
import 'routes/sicix_pages.dart';
import 'routes/workgroup_pages.dart';
import 'shared/constants/colors.dart';
import 'shared/constants/common.dart';
import 'shared/dialog_manager/managers/dialog_manager.dart';
import 'shared/styles/text_style/text_style.dart';
import 'shared/theme/theme_data.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: SicixRoutes.SPLASH,
      defaultTransition: Transition.fade,
      getPages: appPages(),
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      title: APP_NAME,
      theme: ThemeConfig.lightTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      builder: EasyLoading.init(builder: (context, widget) {
        return Navigator(
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(
              child: widget!,
            ),
          ),
        );
      }),
    );
  }
}

List<GetPage<dynamic>> appPages() {
  final appPages = List<GetPage<dynamic>>.empty(growable: true);
  appPages.addAll(sicixPages);
  appPages.addAll(crmPages);
  appPages.addAll(workGroupPages);
  appPages.addAll(commonPages);
  return appPages;
}

void configLoading() {
  EasyLoading.instance
    // ..indicatorType = EasyLoadingIndicatorType.circle
    // ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorWidget = const CircularProgressIndicator()
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..loadingStyle = EasyLoadingStyle.custom
    ..progressColor = AppColor.primaryColor
    ..indicatorColor = AppColor.primaryColor
    ..textColor = AppColor.primaryColor
    ..userInteractions = false
    ..backgroundColor = AppColor.primaryBackgroundColor.withOpacity(0.95)
    ..boxShadow = <BoxShadow>[]
    ..toastPosition = EasyLoadingToastPosition.bottom
    ..textStyle = AppTextStyle.heavy(color: AppColor.primaryHintColor)
    ..successWidget = Icon(
      Icons.done_rounded,
      color: AppColor.primaryHintColor,
      size: 45,
    )
    ..dismissOnTap = false;
}
