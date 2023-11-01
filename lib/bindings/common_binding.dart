import 'package:get/get.dart';

import '../../common/controllers/connectivity_controller.dart';

abstract class CommonBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ConnectivityController());
  }
}
