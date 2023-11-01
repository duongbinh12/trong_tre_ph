import 'package:get/get.dart';
import 'package:trong_tre/common/controllers/base_controller.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/services/entity/base_response.dart';
import 'package:trong_tre/services/entity/login_response.dart';
import 'package:trong_tre/services/entity/policy_response.dart';
import 'package:trong_tre/services/repo/common_repository.dart';

import '../../../widgets/widget_dialog.dart';

class LoginController extends BaseController {
  CommonRepository commonRepository = Get.find<CommonRepository>();

  Rx<String> policy=Rx("");

  loginPhone(String phone, String pass) {
    callApi<LoginResponse>(
        api: commonRepository.loginPhone(phone, pass),
        onSuccess: (result) {
          AppNavigator.navigateHome();
        },
        onError: (e) {
          print("error login ${e}");
        });
  }

  loginEmail(String email, String pass) {
    callApi<LoginResponse>(
        api: commonRepository.loginEmail(email, pass),
        onSuccess: (result) {
          AppNavigator.navigateHome();
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
            onTap1: (){
                Get.back();
                Get.back();
                AppNavigator.navigateLoginPhone();
            },
            title: 'Chúc mừng',
            content: 'Bạn đã đăng ký thành công!'
          );
        },
        onError: (e) {
          print("Error Register $e");
        });
  }

  getPolicy() {
    callApi<PolicyResponse>(
        api: commonRepository.getPolicy(),
        onSuccess: (result) {
          policy.value=result.data??'';
        },
        onError: (e) {
          print("Error policy $e");
        });
  }
}
