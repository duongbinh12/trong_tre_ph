import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/res/app_pref.dart';
import 'package:trong_tre/screens/login/controllers/login_controller.dart';
import 'package:trong_tre/screens/setting/controllers/setting_controller.dart';
import '../../res/app_styles.dart';
import '../../widgets/widget_dialog.dart';
import '/common/controllers/web_service_state_controller.dart';

class BaseController extends GetxController implements WebServiceAPICallback {
  WebServiceStateController webServiceStateController =
  Get.find<WebServiceStateController>();
  // var lhCommonRepository = Get.find(tag: 'commonRepository');
  // SettingController _settingController =Get.find<SettingController>();
  // LoginController _loginController =Get.find<LoginController>();

  RxInt loading = RxInt(0);

  _pushLoading() {
    loading.value++;
  }

  _popLoading() {
    loading.value > 0 ? loading.value-- : loading.value = 0;
  }

  bool isLoading() {
    return loading.value > 0;
  }

  Future<void> callApi<T>(
      {required Future<T> api,
        required Function(T) onSuccess,
        Widget? childLoading,
        Widget? widgetTimeOut,
        Function(Object)? onError}) async {
    webServiceStateController.pushLoading(childLoading: childLoading);
    try {
      var result = await api;
      int code = jsonDecode(jsonEncode(result))['code'];
      if (code == 200) {
        webServiceStateController.popLoading();
        onSuccess(result);
        onAPISuccess(result);
      }
      else if(code==401) {
        webServiceStateController.popLoading();
        String message = jsonDecode(jsonEncode(result))['message'];
        await NotificationDialog.createSimpleDialog(
            context: Get.context!,
            titleButton1: "OK",
            content: message,
            onTap1: () async{
              // _settingController.logOut((){
              //   _loginController.token=null;
                await AppPref().removeString(AppPref.auth_token);
                AppNavigator.navigateSplash();
              // });
            },
            type: 2,
            numberButton: 1,
            textStyle1:
            AppStyle.DEFAULT_14_BOLD.copyWith(color: Color(0xffEB5757)));
      }
      else {
        webServiceStateController.popLoading();
        String message = jsonDecode(jsonEncode(result))['message'];
        await NotificationDialog.createSimpleDialog(
            context: Get.context!,
            titleButton1: "OK",
            content: message,
            onTap1: () {
              Get.back();
            },
            type: 2,
            numberButton: 1,
            textStyle1:
            AppStyle.DEFAULT_14_BOLD.copyWith(color: Color(0xffEB5757)));
      }
    } catch (e) {
      webServiceStateController.popLoading();
      if (onError != null) onError(e);
      onAPIError(e as DioError, e.requestOptions.path, e.requestOptions.method, timeout :widgetTimeOut);
    }
    return;
  }

  Future<void> callApiNotLoading<T>(
      {required Future<T> api,
        required Function(T) onSuccess,
        Widget? widgetTimeOut,
        Function(Object)? onError}) async {
    try {
      var result = await api;
      onSuccess(result);
      onAPISuccess(result);
    } catch (e) {
      if (onError != null) onError(e);
      onAPIError(e as DioError, e.requestOptions.path, e.requestOptions.method, timeout :widgetTimeOut);
    }
    return;
  }

  callApiLocalLoading<T>(
      {required Future<T> api,
        required Function(T) onSuccess,
        Function(Object)? onError}) async {
    _pushLoading();
    try {
      var result = await api;
      _popLoading();
      onSuccess(result);
    } catch (e) {
      _popLoading();
      if (onError != null) onError(e);
    }
  }

  @override
  void onAPISuccess(Object? object) {}

  @override
  void onAPIError(DioError e, String path, String method, {Widget? timeout}) {
    if(e.type == DioErrorType.connectionTimeout){
      webServiceStateController.pushTimeout(timeout: timeout);
    }
  }
}

abstract class WebServiceAPICallback {
  void onAPISuccess(Object? object);
  void onAPIError(DioError e, String path, String method);
}
