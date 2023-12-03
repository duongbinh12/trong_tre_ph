import 'package:get/get.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/services/entity/base_response.dart';
import 'package:trong_tre/services/entity/history_order_response.dart';
import 'package:trong_tre/services/entity/thong_tin_giao_vien_response.dart';
import 'package:trong_tre/services/repo/common_repository.dart';

import '../../../common/controllers/base_controller.dart';

class HistoryController extends BaseController{
  CommonRepository commonRepository=Get.find<CommonRepository>();
  Rx<List<ItemHistoryOrder>?> listHistory=Rxn(null);

  getHistory({
    required int page,
    required String tuKhoa,
    required int sort
}) async {
    await callApi<HistoryOrderResponse>(
        api: commonRepository.getHistory(page, 10, tuKhoa, sort),
        onSuccess: (res) {
          if(page==1) {
            listHistory.value=res.data;
          }
          else{
            listHistory.value=[...listHistory.value!,...res.data!];
          }
          listHistory.refresh();
        },
        onError: (e) {
          print("err history ${e}");
        });
  }

  getThongTinGiaoVien({
    required String id
  }) async {
    await callApi<ThongTinGiaoVienResponse>(
        api: commonRepository.getThongTinGiaoVien(id),
        onSuccess: (res) {
          AppNavigator.navigateTheoDoiTienTrinh(2,data: res.data,id: int.parse(id));
        },
        onError: (e) {
          print("err history ${e}");
        });
  }

  checkPass({
    required String pass,
    required int id,
    required int idTrangThai,
  }) async {
    await callApi<BaseResponse>(
        api: commonRepository.checkPass(pass),
        onSuccess: (res) {
          Get.back();
          if(idTrangThai==72)
            AppNavigator.navigateTheoDoiTienTrinh(3,id: id);
          else AppNavigator.navigateTheoDoiTienTrinh(4,id: id);
        },
        onError: (e) {
          print("err checkPass ${e}");
        });
  }
}