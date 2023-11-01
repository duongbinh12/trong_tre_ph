import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/untils/initializer.dart';
import 'services/api/dio_provider.dart';
import 'services/repo/common_repository.dart';
import 'widgets/my_app.dart';

void main() {
  Initializer(initServices: () async {
    Get.put<dynamic>(CommonRepository(DioProvider.instance()),
        tag: 'commonRepository');
    // SessionRepository _sessionRepository = Get.find<SessionRepository>();
  }).init(() {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = new MyHttpOverrides();
    runApp(const MyApp());
  });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
