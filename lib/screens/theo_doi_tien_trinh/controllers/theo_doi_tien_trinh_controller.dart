import 'package:get/get.dart';
import 'package:trong_tre/common/controllers/base_controller.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/services/entity/base_response.dart';
import 'package:trong_tre/services/entity/chi_tiet_giao_vien_response.dart';
import 'package:trong_tre/services/entity/chi_tiet_nx_response.dart';
import 'package:trong_tre/services/entity/chuong_trinh_hoc_response.dart';
import 'package:trong_tre/services/entity/danh_sach_dao_tao_response.dart';
import 'package:trong_tre/services/entity/don_huy_response.dart';
import 'package:trong_tre/services/entity/lich_su_ca_day_response.dart';
import 'package:trong_tre/services/entity/thong_tin_khoa_hoc_response.dart';
import 'package:trong_tre/services/repo/common_repository.dart';
import 'package:trong_tre/widgets/widget_dialog.dart';

class TheoDoiTienTrinhController extends BaseController {
  CommonRepository commonRepository = Get.find<CommonRepository>();
  Rx<int> indexTab = Rx(2);
  Rx<List<ItemLichSuCaDay>?> listLichSu = Rxn(null);
  Rx<List<ItemDanhSachDaoTao>?> listDaoTao = Rxn(null);
  Rx<ChiTietGiaoVienData?> chiTietGv = Rxn(null);
  Rx<ThongTinKhoaHocData?> thongTinKhoaHoc = Rxn(null);
  Rx<ChiTietNXData?> chiTietNX = Rxn(null);
  Rx<DonHuyData?> donHuy = Rxn(null);
  Rx<List<ChuongTrinhHocData>?> chuongTrinhHocList = Rxn(null);
  Rx<int> maxList = Rx(1);
  Rx<int> maxDaoTao = Rx(1);

  chiTietGiaoVien({
    required String id,
  }) {
    callApi<ChiTietGiaoVienResponse>(
        api: commonRepository.chiTietGiaoVien(id),
        onSuccess: (result) {
          chiTietGv.value = result.data;
        },
        onError: (e) {
          print("error chiTietGiaoVien ${e}");
        });
  }

  lichSuCaDay({
    required String id,
    required String page,
    required String sort,
  }) {
    callApi<LichSuCaDayResponse>(
        api: commonRepository.lichSuCaDay(id, page, "10", sort),
        onSuccess: (result) {
          if (page == "1") {
            listLichSu.value = result.data;
            maxList.value = result.last_page!;
          } else {
            listLichSu.value = [...listLichSu.value!, ...result.data!];
          }
          listLichSu.refresh();
        },
        onError: (e) {
          print("error getSoBuoiHoc ${e}");
        });
  }

  danhSachDaoTao({
    required String id,
    required String page,
    required String sort,
  }) {
    callApi<DanhSachDaoTaoResponse>(
        api: commonRepository.danhSachDaoTao(id, page, "10", sort),
        onSuccess: (result) {
          if (page == "1") {
            listDaoTao.value = result.data;
            maxDaoTao.value = result.last_page!;
          } else {
            listDaoTao.value = [...listDaoTao.value!, ...result.data!];
          }
          listDaoTao.refresh();
        },
        onError: (e) {
          print("error danhSachDaoTao ${e}");
        });
  }

  getThongTinKhoaHoc({required int id, required int buoi}) {
    callApi<ThongTinKhoaHocResponse>(
        api: commonRepository.getThongTinKhoaHoc(id, buoi),
        onSuccess: (res) {
          thongTinKhoaHoc.value = res.data;
        },
        onError: (e) {
          print("error getThongTinKhoaHoc ${e}");
        });
  }

  getDonHuy({required int id}) {
    callApi<DonHuyResponse>(
        api: commonRepository.getDonHuy(id),
        onSuccess: (res) {
          donHuy.value = res.data;
        },
        onError: (e) {
          print("error getDonHuy ${e}");
        });
  }

  getChuongTrinhHoc({
    required int ca_day_id,
  }) {
    callApi<ChuongTrinhHocResponse>(
        api: commonRepository.getChuongTrinhHoc(ca_day_id),
        onSuccess: (res) {
          chuongTrinhHocList.value = res.data;
        },
        onError: (e) {
          print("error getChuongTrinhHoc ${e}");
        });
  }

  getChiTietNX({
    required int id,
  }) {
    callApi<ChiTietNXResponse>(
        api: commonRepository.getChiTietNX(id),
        onSuccess: (res) {
          chiTietNX.value = res.data;
        },
        onError: (e) {
          print("error getChiTietNX ${e}");
        });
  }

  danhGiaGiaoVien({
    required int id,
    required double danhGia,
    required String noiDung,
  }) {
    callApi<BaseResponse>(
        api: commonRepository.danhGiaGiaoVien(id, danhGia, noiDung),
        onSuccess: (res) {
          NotificationDialog.createSimpleDialog(
              context: Get.context!,
              titleButton1: "OK",
              content: "Đánh giá giáo viên thành công!",
              onTap1: (){
                Get.back();
                Get.back();
              },
              numberButton: 1);
        },
        onError: (e) {
          print("error danhGiaGiaoVien ${e}");
        });
  }

  danhGiaBuoiHoc({
    required int id,
    required double danhGia,
    required String noiDung,
  }) {
    callApi<BaseResponse>(
        api: commonRepository.danhGiaBuoiHoc(id, danhGia, noiDung),
        onSuccess: (res) {
          AppNavigator.navigateHoanTatDanhGia();
        },
        onError: (e) {
          print("error danhGiaBuoiHoc ${e}");
        });
  }

  changeIndex(int index) {
    indexTab.value = index;
  }

  nextTab() {
    indexTab.value = indexTab.value + 1;
  }
}
