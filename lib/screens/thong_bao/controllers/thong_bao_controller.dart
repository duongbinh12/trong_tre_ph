import 'package:get/get.dart';
import 'package:trong_tre/common/controllers/base_controller.dart';
import 'package:trong_tre/services/entity/thong_bao_response.dart';
import 'package:trong_tre/services/repo/common_repository.dart';

class ThongBaoController extends BaseController{
  CommonRepository commonRepository=Get.find<CommonRepository>();
  Rx<List<ItemThongBaoData>?> listThongBao=Rxn(null);
  Rx<List<ItemTypeThongBao>?> listType=Rxn(null);

  getThongBao({
    required String type,
    required int page,
    required int sort,
    required String tuKhoa,
}) async {
    await callApi<ThongBaoResponse>(
        api: commonRepository.getThongBao(type, page, 10, sort, tuKhoa),
        onSuccess: (res) {
          if(page==1){
            listThongBao.value=res.data!.thong_bao;
            listType.value=[ItemTypeThongBao(-1, "Tất cả")];
            listType.value=[...listType.value!,...res.data!.type!];
          }
          else{
            listThongBao.value=[...listThongBao.value!,...res.data!.thong_bao!];
          }
          listThongBao.refresh();
        },
        onError: (e) {
          print("err thông báo ${e}");
        });
  }
}