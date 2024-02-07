import 'dart:io';

import 'package:get/get.dart';
import 'package:trong_tre/common/controllers/base_controller.dart';
import 'package:trong_tre/common/routes/navigator.dart';
import 'package:trong_tre/services/entity/banking_response.dart';
import 'package:trong_tre/services/entity/base_response.dart';
import 'package:trong_tre/services/entity/chi_tiet_dich_vu_response.dart';
import 'package:trong_tre/services/entity/chon_hoc_phi_response.dart';
import 'package:trong_tre/services/entity/get_ca_response.dart';
import 'package:trong_tre/services/entity/policy_response.dart';
import 'package:trong_tre/services/entity/so_buoi_hoc_response.dart';
import 'package:trong_tre/services/entity/tao_don_response.dart';
import 'package:trong_tre/services/repo/common_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/widget_dialog.dart';

class ServiceController extends BaseController {
  CommonRepository commonRepository = Get.find<CommonRepository>();

  Rx<int> tabService = Rx(1);
  Rx<ChiTietDichVuData?> detailService = Rxn(null);
  Rx<List<ItemCa>?> listCa = Rxn(null);
  Rx<List<ItemKhungGio>?> listKhungGio = Rxn(null);
  Rx<List<ItemSoBuoiHoc>?> listBuoiHoc = Rxn(null);
  Rx<List<ItemLoaiGiaoVien>?> listLoaiGiaoVien = Rxn(null);
  Rx<List<ItemPhuCap>?> listAnTrua = Rxn(null);
  Rx<List<ItemPhuCap>?> listThemGio = Rxn(null);
  Rx<BankingData?> bankingData = Rxn(null);
  Rx<double?> hocPhi = Rxn(null);
  Rx<double> phuCap = Rx(0);
  Rx<double> tienAnTrua = Rx(0);
  Rx<double> tienThemGio = Rx(0);
  Rx<int> soLuongBe = Rx(1);
  String diaDiem = "";
  String ghiChu = "";
  List<int> arrThu = [2,3,4,5,6];
  String thoiGianBatDau = "";
  int giaoVien = 15;
  int indexThemGio = 0;
  int indexCa = 0;
  int indexGio = 0;
  int indexBuoi = 0;
  int idKhungGioCa = -1;
  int idGoiHocPhi = -1;
  int idAnTrua = -1;
  int idThemGio = -1;

  bool xuatHoaDon=false;

  getDetailService({required int id}) {
    callApi<ChiTietDichVuResponse>(
        api: commonRepository.getChiTietDichVu(id),
        onSuccess: (result) {
          detailService.value = result.data;
        },
        onError: (e) {
          print("error detail dịch vụ ${e}");
        });
  }

  getCa(int dichVuId) {
    callApi<GetCaResponse>(
        api: commonRepository.getCa(),
        onSuccess: (result) {
          listCa.value = result.data;
          getKhungGio(dichVuId, result.data![0].id!);
        },
        onError: (e) {
          print("error getCa ${e}");
        });
  }

  getInfoBanking(String dichVuId) {
    callApi<BankingResponse>(
        api: commonRepository.getInfoBanking(dichVuId),
        onSuccess: (result) {
          bankingData.value = result.data;
        },
        onError: (e) {
          print("error getInfoBanking ${e}");
        });
  }

  getKhungGio(int dich_vu_id, int type) {
    callApi<KhungGioResponse>(
        api: commonRepository.getKhungGio(dich_vu_id, type),
        onSuccess: (result) {
          listKhungGio.value = result.data;
          idKhungGioCa=result.data![0].id!;
          listKhungGio.refresh();
        },
        onError: (e) {
          print("error getKhungGio ${e}");
        });
  }

  getChonHocPhi(int dichVuId,{Function? onSuccess}) async{
    await callApi<ChonHocPhiResponse>(
        api: commonRepository.getChonHocPhi(listCa.value![indexCa].id!),
        onSuccess: (result) async{
          listLoaiGiaoVien.value = result.data!.loaiGiaoVien;

          listThemGio.value = result.data!.themGio;
          if(result.data!.anTrua!=null)
          {
            listAnTrua.value = result.data!.anTrua;
            idAnTrua=result.data!.anTrua![0].id!;
          }
          else{
            listAnTrua.value=null;
          }
          listAnTrua.refresh();
          idThemGio=result.data!.themGio![0].id!;
          await getSoBuoiHoc(dichVuId: dichVuId, page: 1, sort: 0, trinhDo: result.data!.loaiGiaoVien![0].id!);
          if(onSuccess!=null){
            onSuccess();
          }
        },
        onError: (e) {
          print("error getChonHocPhi ${e}");
        });
  }

  getSoBuoiHoc({
    required int dichVuId,
    required int page,
    required int sort,
    required int trinhDo
  }) async{
    await callApi<SoBuoiHocResponse>(
        api: commonRepository.getSoBuoiHoc(dichVuId, page, 10, sort,trinhDo,idKhungGioCa),
        onSuccess: (result) {
          if (page == 1) {
            listBuoiHoc.value = result.data;
            if(result.data!.isNotEmpty)
            {
              hocPhi.value = double.parse(result.data![0].thanh_tien!);
              idGoiHocPhi=result.data![0].id!;
            }
          } else {
            listBuoiHoc.value = [...listBuoiHoc.value!, ...result.data!];
          }
          listBuoiHoc.refresh();
        },
        onError: (e) {
          print("error soBuoiHoc ${e}");
        });
  }

  uploadImage({
    required String don_dich_vu_id,
    required File file,
  }) {
    callApi<BaseResponse>(
        api: commonRepository.uploadImage(don_dich_vu_id, file),
        onSuccess: (result) {
          AppNavigator.navigateHoanTatDangKy();
        },
        onError: (e) {
          print("error soBuoiHoc ${e}");
        });
  }

  addHoaDon(
      {required String ho_ten,
      required String cmnd_cccd,
      required String dia_chi,
      required String ma_so_thue,
      required String email,
      required String ho_ten_con,
      required String nam_sinh_cua_con,
      required String don_dich_vu_id}) {
    callApi<BaseResponse>(
        api: commonRepository.addHoaDon(ho_ten, cmnd_cccd, dia_chi, ma_so_thue,
            email, ho_ten_con, nam_sinh_cua_con, don_dich_vu_id),
        onSuccess: (result) {
          Get.back();
          NotificationDialog.createSimpleDialog(
              context: Get.context!,
              titleButton1: '',
              content:
                  'Yêu cầu xuất hợp đồng và hoá đơn dịch vụ của bạn đang được xử lý, xin vui lòng kiểm tra email sau 24h không kể thứ 7, chủ nhật và các ngày nghỉ Lễ, Tết.',
              numberButton: 0);
          xuatHoaDon=true;
        },
        onError: (e) {
          print("error addHoaDon ${e}");
        });
  }

  taoDon(
      {required int dich_vu_id,
      required String hocPhi,
      required String phuCap,
      required String tongTien,
      required String hinh_thuc_thanh_toan_id,
      }) {
    callApi<TaoDonResponse>(
        api: commonRepository.taoDon(
            dich_vu_id.toString(),
            diaDiem,
            thoiGianBatDau,
            arrThu.join(','),
            idKhungGioCa.toString(),
            giaoVien.toString(),
            soLuongBe.value.toString(),
            idGoiHocPhi.toString(),
            hocPhi,
            phuCap,
            tongTien,
            hinh_thuc_thanh_toan_id,
            ghiChu,
            idAnTrua.toString(),
            idThemGio.toString()),
        onSuccess: (result) {
          if(hinh_thuc_thanh_toan_id=="23"){
            vnpay(don_dich_vu_id: result.data!.id!);
          }
          else if(hinh_thuc_thanh_toan_id=="25") {
            AppNavigator.navigatechuyenKhoan(result.data!.id!);
          }
        },
        onError: (e) {
          print("error addHoaDon ${e}");
        });
  }

  vnpay({
    required int don_dich_vu_id,
  }) {
    callApi<PolicyResponse>(
        api: commonRepository.vnpay(don_dich_vu_id),
        onSuccess: (result) async{
          // if (!await launchUrl(Uri.parse(result.data??''))) {
          // throw Exception('Could not launch vnpay');
          // }
          AppNavigator.navigateVnpay(result.data??'');
        },
        onError: (e) {
          print("error vnpay ${e}");
        });
  }

  addThu(int thu) {
    arrThu.add(thu);
  }

  removeThu(int thu) {
    arrThu.remove(thu);
  }

  chooseBuoi(int index) {
    indexBuoi = index;
    idGoiHocPhi=listBuoiHoc.value![index].id!;
    hocPhi.value = double.parse(listBuoiHoc.value![index].thanh_tien!);
  }

  changePhuCap(double money) {
    phuCap.value = phuCap.value + money;
  }

  changeTienAnTrua(double money) {
    tienAnTrua.value = money;
  }

  changeTienThemGio(double money) {
    tienThemGio.value = money;
  }

  changeSoLuongBe(int soLuong) {
    soLuongBe.value = soLuong;
  }

  changeTab(int tab) {
    tabService.value = tab;
  }

  nextTab() {
    tabService.value = tabService.value + 1;
  }

  preTab() {
    tabService.value = tabService.value - 1;
  }
}
