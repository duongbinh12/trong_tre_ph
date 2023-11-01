import 'package:get/get.dart';
import 'package:trong_tre/common/controllers/base_controller.dart';
import 'package:trong_tre/services/entity/chi_tiet_dich_vu_response.dart';
import 'package:trong_tre/services/entity/get_ca_response.dart';
import 'package:trong_tre/services/repo/common_repository.dart';

class ServiceController extends BaseController{
  CommonRepository commonRepository=Get.find<CommonRepository>();

  Rx<int> tabService=Rx(1);
  Rx<ChiTietDichVuData?> detailService=Rxn(null);
  Rx<List<ItemCa>?> listCa=Rxn(null);
  Rx<List<ItemKhungGio>?> listKhungGio=Rxn(null);

  getDetailService({required int id}) {
    callApi<ChiTietDichVuResponse>(
        api: commonRepository.getChiTietDichVu(id),
        onSuccess: (result) {
          detailService.value=result.data;
        },
        onError: (e) {
          print("error detail dịch vụ ${e}");
        });
  }

  getCa(int dichVuId) {
    callApi<GetCaResponse>(
        api: commonRepository.getCa(),
        onSuccess: (result) {
          listCa.value=result.data;
          getKhungGio(dichVuId, result.data![0].id!);
        },
        onError: (e) {
          print("error getCa ${e}");
        });
  }

  getKhungGio(int dich_vu_id,int type) {
    callApi<KhungGioResponse>(
        api: commonRepository.getKhungGio(dich_vu_id, type),
        onSuccess: (result) {
          listKhungGio.value=result.data;
          listKhungGio.refresh();
        },
        onError: (e) {
          print("error getKhungGio ${e}");
        });
  }


  changeTab(int tab){
    tabService.value=tab;
  }

  nextTab(){
    tabService.value=tabService.value+1;
  }

}