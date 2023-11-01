import 'package:flutter/material.dart';
import '/widgets/my_base_app.dart';

import '../../common/routes/app_pages.dart';
import '../../res/strings.dart';
import '../bindings/app_binding.dart';
import 'app_config.dart';


class MyApp extends MyBaseApp {

  const MyApp({Key? key}) : super(key: key);

  @override
  AppConfiguration onConfig() {
    return AppConfiguration(
      title: AppStrings.appName,
      locale: Locale('vi', 'VN'),
      supportedLocales: [
        const Locale('vi', 'VN'),
        const Locale('en', 'US'),
      ],
      translations: AppStrings(),
      initialBinding: AppBinding(),
      initialRoute: Routes.initial,
      getPages: AppPages().routes,
      // home: SplashLoadingPage()
    );
  }
}
