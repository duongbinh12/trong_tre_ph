import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'common/untils/initializer.dart';
import 'firebase_options.dart';
import 'services/api/dio_provider.dart';
import 'services/repo/common_repository.dart';
import 'widgets/my_app.dart';

void main() {
  Initializer(initServices: () async {
    Get.put<dynamic>(CommonRepository(DioProvider.instance()),
        tag: 'commonRepository');
    // SessionRepository _sessionRepository = Get.find<SessionRepository>();
  }).init(() async{
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = new MyHttpOverrides();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    var initializationSettings;
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings notificationSettings =
        await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (Platform.isAndroid) {

      AndroidNotificationChannel channel = AndroidNotificationChannel(
          'high_importance_channel', 'trongtrepro',
          importance: Importance.max);
      var initializationSettingsAndroid =
      const AndroidInitializationSettings("@mipmap/ic_launcher");
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
          .createNotificationChannel(channel);

      initializationSettings =
          InitializationSettings(android: initializationSettingsAndroid);
    } else {
      var initializationSettingsIOS = new DarwinInitializationSettings();
      initializationSettings =
          InitializationSettings(iOS: initializationSettingsIOS);
    }
    flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        // onDidReceiveNotificationResponse: (NotificationResponse details) {
        //   try{
        //     String payloadData=details.payload!;
        //     String id=payloadData.substring(1,payloadData.length-1).split(",").first.split(":")[1];
        //     AppNavigator.navigateTaskDetail(id.trim());
        //   }catch(e){
        //     print("lỗi hahaha ${e}");
        //   }
        // }
    );

    // FirebaseMessaging.onMessageOpenedApp.listen((event) {
    //   AppNavigator.navigateTaskDetail(event.data['id'].trim());
    // });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification notification = message.notification!;
      if (Platform.isAndroid) {
        AndroidNotification androidNotification =
        message.notification!.android!;
        var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
            'high_importance_channel', 'trongtrepro',
            importance: Importance.max,
            playSound: true,
            showProgress: true,
            priority: Priority.high,
            icon: "@mipmap/ic_launcher",
            ticker: 'test ticker');
        var iOSChannelSpecifics = const DarwinNotificationDetails();
        var platformChannelSpecifics = NotificationDetails(
            android: androidPlatformChannelSpecifics, iOS: iOSChannelSpecifics);
        // Vibration.vibrate(duration: 1000, amplitude: 128);
        await flutterLocalNotificationsPlugin.show(
            0, notification.title, notification.body, platformChannelSpecifics,
            payload: message.data.toString());
      } else if (Platform.isIOS) {
        var iOSChannelSpecifics = const DarwinNotificationDetails();
        var platformChannelSpecifics =
        NotificationDetails(iOS: iOSChannelSpecifics);
        // Vibration.vibrate(duration: 1000, amplitude: 128);
        await flutterLocalNotificationsPlugin.show(
            0, notification.title, notification.body, platformChannelSpecifics,
            payload: 'test');
      }
    });
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
