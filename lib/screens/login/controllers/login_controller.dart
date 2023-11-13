import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:trong_tre/common/controllers/base_controller.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/res/app_pref.dart';
import 'package:trong_tre/services/entity/base_response.dart';
import 'package:trong_tre/services/entity/login_response.dart';
import 'package:trong_tre/services/entity/policy_response.dart';
import 'package:trong_tre/services/repo/common_repository.dart';

import '../../../widgets/widget_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends BaseController {
  CommonRepository commonRepository = Get.find<CommonRepository>();

  Rx<String> policy = Rx("");
  String? tokenFirebase;
  String? token;

  getToken()async{
    token=await AppPref().getString(AppPref.auth_token);
  }

  Future getTokenFirebase()async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    tokenFirebase = await messaging.getToken();
    print("Token firebase ${tokenFirebase}");
  }

  Future signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? user = await googleSignIn.signIn();
      if (user != null) {
        String? token = (await user.authentication).accessToken;
        print('login gg token $token');
      }
    } catch (error) {
      print('errorrrrrr $error');
    }
  }

  loginPhone(String phone, String pass) {
    callApi<LoginResponse>(
        api: commonRepository.loginPhone(phone, pass,tokenFirebase??''),
        onSuccess: (result) async{
          token=result.data!.auth_key;
          await AppPref().saveString(AppPref.auth_token, result.data!.auth_key!);
          AppNavigator.navigateHome();
        },
        onError: (e) {
          print("error login ${e}");
        });
  }

  loginEmail(String email, String pass) {
    callApi<LoginResponse>(
        api: commonRepository.loginEmail(email, pass,tokenFirebase??''),
        onSuccess: (result) async{
          token=result.data!.auth_key;
          await AppPref().saveString(AppPref.auth_token, result.data!.auth_key!);
          AppNavigator.navigateHome();
        });
  }

  getOtpPhone(String phone) {
    callApi<BaseResponse>(
        api: commonRepository.getOtpPhone(phone),
        onSuccess: (result) {
          NotificationDialog.createSimpleDialog(
              context: Get.context!,
              titleButton1: "OK",
              onTap1: () {
                AppNavigator.navigateForgotPass(phone);
              },
              content: result.message,
              numberButton: 1);
        });
  }

  checkOtpPhone(String phone, String code) {
    callApi<LoginResponse>(
        api: commonRepository.checkOtpPhone(phone, code),
        onSuccess: (result) async {
          await AppPref()
              .saveString(AppPref.auth_token, result.data!.auth_key!);
          AppNavigator.navigateNewPass();
        });
  }

  getOtpEmail(String email) {
    callApi<BaseResponse>(
        api: commonRepository.getOtpEmail(email),
        onSuccess: (result) {
          NotificationDialog.createSimpleDialog(
              context: Get.context!,
              titleButton1: "OK",
              onTap1: () {
                AppNavigator.navigateForgotPass(email, type: 2);
              },
              content: result.message,
              numberButton: 1);
        });
  }

  checkOtpEmail(String email, String code) {
    callApi<LoginResponse>(
        api: commonRepository.checkOtpEmail(email, code),
        onSuccess: (result) async {
          await AppPref()
              .saveString(AppPref.auth_token, result.data!.auth_key!);
          AppNavigator.navigateNewPass();
        });
  }

  newPass(String pass, String rePass) {
    callApi<BaseResponse>(
        api: commonRepository.newPass(pass, rePass),
        onSuccess: (result) async {
          AppNavigator.navigateChangePassSuccess();
        });
  }

  register(
      {required String email,
      required String dienThoai,
      required String password,
      required String passwordConfirm}) {
    callApi<BaseResponse>(
        api: commonRepository.register(
            email, dienThoai, password, passwordConfirm),
        onSuccess: (result) {
          NotificationDialog.createSimpleDialog(
              context: Get.context!,
              titleButton1: 'OK',
              numberButton: 1,
              onTap1: () {
                Get.back();
                Get.back();
                AppNavigator.navigateLoginPhone();
              },
              title: 'Chúc mừng',
              content: 'Bạn đã đăng ký thành công!');
        },
        onError: (e) {
          print("Error Register $e");
        });
  }

  getPolicy() {
    callApi<PolicyResponse>(
        api: commonRepository.getPolicy(),
        onSuccess: (result) {
          policy.value = result.data ?? '';
        },
        onError: (e) {
          print("Error policy $e");
        });
  }
}
