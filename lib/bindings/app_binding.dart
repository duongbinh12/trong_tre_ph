import 'package:get/get.dart';
import 'package:trong_tre/screens/login/controllers/login_controller.dart';
import 'package:trong_tre/screens/setting/controllers/setting_controller.dart';
import '../../services/api/api.dart';

import '../../services/repo/respos.dart';
import '../controllers/app_controller.dart';
import 'common_binding.dart';

class AppBinding extends CommonBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.put(CommonRepository(DioProvider.instance()));
    Get.put(AppController());
    Get.put(LoginController());
    Get.put(SettingController());
  }
}
