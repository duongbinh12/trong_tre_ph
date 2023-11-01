import 'package:get/get.dart';
import 'package:trong_tre/common/controllers/base_controller.dart';
import 'package:trong_tre/screens/home/gioi_thieu/tin_tuc.dart';
import 'package:trong_tre/services/entity/home_response.dart';
import 'package:trong_tre/services/entity/tin_tuc_response.dart';
import 'package:trong_tre/services/repo/common_repository.dart';

class HomeController extends BaseController {
  CommonRepository commonRepository = Get.find<CommonRepository>();

  Rx<List<ItemDichVu>?> listDichVu=Rxn(null);
  Rx<List<ItemNews>?> listTinTuc=Rxn(null);
  Rx<List<ItemTinTuc>?> listTabTinTuc=Rxn(null);
  Rx<List<ItemBanner>?> listBanner=Rxn(null);

  getHome() {
    callApi<HomeResponse>(
        api: commonRepository.getHome(),
        onSuccess: (result) {
          listDichVu.value=result.data!.dichVu;
          listTabTinTuc.value=result.data!.tinTuc;
          listBanner.value=result.data!.banner;
          getNews(
              type: result.data!.tinTuc![0].id!,
              page: 1,
              limit: 10,
              tuKhoa: '',
              sort: 1);
        },
        onError: (e) {
          print("error home ${e}");
        });
  }

  getNews({
    required int type,
    required int page,
    required int limit,
    required String tuKhoa,
    required int sort,
  }) {
    callApi<TinTucResponse>(
        api: commonRepository.getNews(type, page, limit, tuKhoa, sort),
        onSuccess: (result) {
          listTinTuc.value=result.data!.tinTuc;
        },
        onError: (e) {
          print("error tinTuc ${e}");
        });
  }
}
