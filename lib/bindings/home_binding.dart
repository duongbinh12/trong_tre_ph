import 'package:get/get.dart';
import 'package:trong_tre/screens/history/controllers/history_controller.dart';
import 'package:trong_tre/screens/home/controllers/home_controller.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/controllers/theo_doi_tien_trinh_controller.dart';
import '../screens/thong_bao/controllers/thong_bao_controller.dart';
import 'common_binding.dart';

class HomeBinding extends CommonBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.put(HomeController());
    Get.put(HistoryController());
    Get.put(ThongBaoController());
  }
}
