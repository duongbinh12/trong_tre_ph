import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trong_tre/screens/service/controllers/service_controller.dart';
import 'common_binding.dart';

class ServicesBinding extends CommonBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.put(ServiceController());
  }
}
