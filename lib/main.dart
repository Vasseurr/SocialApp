import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_app/core/init/network/network_build.dart';
import 'package:social_app/view/main/bindings/main_binding.dart';

import 'core/init/init.dart';
import 'core/init/lang/localization_manager.dart';
import 'core/init/theme/app_theme_light.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';

Future<void> main() async {
  await ProjectInit.init();
  //await Hive.initFlutter();
  runApp(
    EasyLocalization(
        supportedLocales: LocalizationManager.instance.supportedLocales,
        path: LocalizationManager.instance.localizationPath,
        startLocale: LocalizationManager.instance.getStartLocale(),
        fallbackLocale: LocalizationManager.instance.getFallbackLocale(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        builder: (context, child) =>
            NetworkBuild(child: child ?? const SizedBox()),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.INITIAL,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppThemeLight.instance.theme,
        getPages: AppPages.pages,
        initialBinding: MainBinding(),
      );
    });
  }
}
