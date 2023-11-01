import 'package:dio/dio.dart';

import '../../res/app_pref.dart';

class AppDioInterceptor extends Interceptor {
  final String tokenPrefix;

  AppDioInterceptor({this.tokenPrefix = ''});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.onSendProgress = (progress, total) {};
    var data = options.data;
    if (data is FormData) {
      print("Form data send ${data.fields}");
    }

    var prefs = AppPref();
    var token = await prefs.getString(AppPref.auth_token);
    if (token != null) {
      options.headers.putIfAbsent('Authorization', () => '$tokenPrefix$token');
    } else {
      print('-----Auth token is null-----');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Response: ${response}');
    super.onResponse(response, handler);
  }
}
