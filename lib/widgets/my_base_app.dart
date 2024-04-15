import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import '/widgets/app_config.dart';

abstract class MyBaseApp extends StatefulWidget {
  const MyBaseApp({Key? key}) : super(key: key);

  @override
  _MyBaseAppState createState() => _MyBaseAppState();

  AppConfiguration onConfig();
}

class _MyBaseAppState extends State<MyBaseApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: widget.onConfig().title ?? '',
            translations: widget.onConfig().translations,
            locale: widget.onConfig().locale,
            supportedLocales: widget.onConfig().supportedLocales ?? [],
            initialRoute: widget.onConfig().initialRoute,
            getPages: widget.onConfig().getPages,
            initialBinding: widget.onConfig().initialBinding,
            home: widget.onConfig().home,
            theme: ThemeData(
            useMaterial3: false,
          ),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        });
  }
}
