import 'package:get/get.dart';
import 'package:trong_tre/common/controllers/base_controller.dart';

class TheoDoiTienTrinhController extends BaseController{
  Rx<int> indexTab=Rx(2);

  changeIndex(int index){
    indexTab.value=index;
  }

  nextTab(){
    indexTab.value=indexTab.value+1;
  }
}