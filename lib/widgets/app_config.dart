import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConfiguration {
  final String? title;
  final Translations? translations;
  final Locale? locale;
  final Iterable<Locale>? supportedLocales;
  final Widget? home;
  final String? initialRoute;
  final List<GetPage>? getPages;
  final Bindings? initialBinding;

  AppConfiguration(
      {this.title,
        this.translations,
        this.locale,
        this.supportedLocales,
        this.home,
        this.initialRoute,
        this.getPages,
        this.initialBinding});

  @override
  String toString() {
    return 'AppConfiguration{title: $title, translations: $translations, locale: $locale, supportedLocales: $supportedLocales, home: $home, initialRoute: $initialRoute, getPages: $getPages, initialBinding: $initialBinding}';
  }
}
