import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../common/controllers/base_controller.dart';
import '../../services/repo/common_repository.dart';

class AppController extends BaseController {
  CommonRepository commonRepository = Get.find<CommonRepository>();

  RxBool isRememberPassword = RxBool(true);
  @override
  void onReady() async {
    super.onReady();
  }
}
