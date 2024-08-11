import 'dart:io';

import 'package:dio/dio.dart';
import 'package:trong_tre/services/entity/banking_response.dart';
import 'package:trong_tre/services/entity/base_response.dart';
import 'package:trong_tre/services/entity/chi_tiet_dich_vu_response.dart';
import 'package:trong_tre/services/entity/chi_tiet_giao_vien_response.dart';
import 'package:trong_tre/services/entity/chi_tiet_nx_response.dart';
import 'package:trong_tre/services/entity/chon_hoc_phi_response.dart';
import 'package:trong_tre/services/entity/chuong_trinh_hoc_response.dart';
import 'package:trong_tre/services/entity/don_huy_response.dart';
import 'package:trong_tre/services/entity/get_ca_response.dart';
import 'package:trong_tre/services/entity/history_order_response.dart';
import 'package:trong_tre/services/entity/home_response.dart';
import 'package:trong_tre/services/entity/lich_su_ca_day_response.dart';
import 'package:trong_tre/services/entity/policy_response.dart';
import 'package:trong_tre/services/entity/setting_response.dart';
import 'package:trong_tre/services/entity/so_buoi_hoc_response.dart';
import 'package:trong_tre/services/entity/tao_don_response.dart';
import 'package:trong_tre/services/entity/thong_bao_response.dart';
import 'package:trong_tre/services/entity/thong_tin_giao_vien_response.dart';
import 'package:trong_tre/services/entity/thong_tin_khoa_hoc_response.dart';
import 'package:trong_tre/services/entity/tin_tuc_response.dart';
import '../api/app_rest_client.dart';
import '../entity/danh_sach_dao_tao_response.dart';
import '../entity/find_teacher_response.dart';
import '../entity/hoa_don_response.dart';
import '../entity/login_response.dart';
import '../entity/xem_khao_sat_response.dart';
import 'app_common_repository.dart';

class CommonRepository extends AppCommonRepository {
  final Dio dio;

  CommonRepository(this.dio) : super(dio);

//authentic
  Future<LoginResponse> loginPhone(String phone, String password,String token) async {
    final client = AppRestClient(dio);
    return client.login(phone, password,token);
  }

  Future<LoginResponse> loginEmail(String email, String password,String token) async {
    final client = AppRestClient(dio);
    return client.loginEmail(email, password,token);
  }

  Future<PolicyResponse> getPolicy() async {
    final client = AppRestClient(dio);
    return client.getPolicy();
  }

  Future<BaseResponse> register(String email, String dienThoai, String password,
      String passwordConfirm) async {
    final client = AppRestClient(dio);
    return client.register(email, dienThoai, password, passwordConfirm);
  }

  Future<HomeResponse> getHome() async {
    final client = AppRestClient(dio);
    return client.getHome();
  }

  Future<TinTucResponse> getNews(
      int type, int page, int limit, String tuKhoa, int sort) async {
    final client = AppRestClient(dio);
    return client.getNews(type, page, limit, tuKhoa, sort);
  }

  Future<ChiTietDichVuResponse> getChiTietDichVu(int id) async {
    final client = AppRestClient(dio);
    return client.getChiTietDichVu(id);
  }

  Future<GetCaResponse> getCa() async {
    final client = AppRestClient(dio);
    return client.getCa();
  }

  Future<KhungGioResponse> getKhungGio(int dich_vu_id, int type) async {
    final client = AppRestClient(dio);
    return client.getKhungGio(dich_vu_id, type);
  }

  Future<BaseResponse> getOtpPhone(String dienThoai) async {
    final client = AppRestClient(dio);
    return client.getOtpPhone(dienThoai);
  }

  Future<BaseResponse> getOtpEmail(String email) async {
    final client = AppRestClient(dio);
    return client.getOtpEmail(email);
  }

  Future<LoginResponse> checkOtpPhone(String phone, String code) async {
    final client = AppRestClient(dio);
    return client.checkOtpPhone(phone, code);
  }

  Future<LoginResponse> checkOtpEmail(String email, String code) async {
    final client = AppRestClient(dio);
    return client.checkOtpEmail(email, code);
  }

  Future<BaseResponse> newPass(String password, String rePass) async {
    final client = AppRestClient(dio);
    return client.newPass(password, rePass);
  }

  Future<HeSinhThaiResponse> getHeSinhThai() async {
    final client = AppRestClient(dio);
    return client.getHeSinhThai();
  }

  Future<GioiThieuResponse> getGioiThieu() async {
    final client = AppRestClient(dio);
    return client.getGioiThieu();
  }

  Future<LienHeResponse> getLienHe() async {
    final client = AppRestClient(dio);
    return client.getLienHe();
  }

  Future<LoginResponse> getMyInfo() async {
    final client = AppRestClient(dio);
    return client.getMyInfo();
  }

  Future<BaseResponse> editInfo(String hoten, String dia_chi) async {
    final client = AppRestClient(dio);
    return client.editInfo(hoten, dia_chi);
  }

  Future<BaseResponse> editAvatar(File anh) async {
    final client = AppRestClient(dio);
    return client.editAvatar(anh);
  }

  Future<BaseResponse> khieuNai(String noiDung) async {
    final client = AppRestClient(dio);
    return client.khieuNai(noiDung);
  }

  Future<BaseResponse> logOut() async {
    final client = AppRestClient(dio);
    return client.logOut();
  }

  Future<HistoryOrderResponse> getHistory(
      int page, int limit, String tuKhoa, int sort) async {
    final client = AppRestClient(dio);
    return client.getHistory(page, limit, tuKhoa, sort);
  }

  Future<SoBuoiHocResponse> getSoBuoiHoc(
      int dichVuId, int page, int limit, int sort,int trinhDo,int khungGioId) async {
    final client = AppRestClient(dio);
    return client.getSoBuoiHoc(dichVuId, page, limit, sort,trinhDo,khungGioId);
  }

  Future<ThongBaoResponse> getThongBao(
      String type, int page, int limit, int sort, String tuKhoa) async {
    final client = AppRestClient(dio);
    return client.getThongBao(type, page, limit, sort, tuKhoa);
  }

  Future<ChonHocPhiResponse> getChonHocPhi(int caId, int dich_vu_id) async {
    final client = AppRestClient(dio);
    return client.getChonHocPhi(caId,dich_vu_id);
  }

  Future<HoaDonResponse> addHoaDon(
      String ho_ten,
      String cmnd_cccd,
      String dia_chi,
      String ma_so_thue,
      String email,
      String ho_ten_con,
      String nam_sinh_cua_con,
      String don_dich_vu_id) async {
    final client = AppRestClient(dio);
    return client.addHoaDon(ho_ten, cmnd_cccd, dia_chi, ma_so_thue, email,
        ho_ten_con, nam_sinh_cua_con, don_dich_vu_id);
  }

  Future<BankingResponse> getInfoBanking(String dichVuId) async {
    final client = AppRestClient(dio);
    return client.getInfoBanking(dichVuId);
  }

  Future<TaoDonResponse> taoDon(
    String dich_vu_id,
    String dia_chi,
    String thoi_gian_bat_dau,
    String thu,
    String chon_ca_id,
    String loai_giao_vien,
    String so_luong_be,
    String goi_hoc_phi_id,
    String hoc_phi,
    String phu_cap,
    String tong_tien,
    String hinh_thuc_thanh_toan_id,
    String ghi_chu,
    String an_trua_id,
    String them_gio_id,
    String gio_bat_dau,
    String hoa_don_id,
  ) async {
    final client = AppRestClient(dio);
    return client.taoDon(
        dich_vu_id,
        dia_chi,
        thoi_gian_bat_dau,
        thu,
        chon_ca_id,
        loai_giao_vien,
        so_luong_be,
        goi_hoc_phi_id,
        hoc_phi,
        phu_cap,
        tong_tien,
        hinh_thuc_thanh_toan_id,
        ghi_chu,
        an_trua_id,
        them_gio_id,
        gio_bat_dau,
      hoa_don_id
    );
  }

  Future<BaseResponse> uploadImage(String don_dich_vu_id,File file) async {
    final client = AppRestClient(dio);
    return client.uploadImage(don_dich_vu_id, file);
  }

  Future<ThongTinGiaoVienResponse> getThongTinGiaoVien(String id) async {
    final client = AppRestClient(dio);
    return client.getThongTinGiaoVien(id);
  }

  Future<ChiTietGiaoVienResponse> chiTietGiaoVien(String id) async {
    final client = AppRestClient(dio);
    return client.chiTietGiaoVien(id);
  }

  Future<LichSuCaDayResponse> lichSuCaDay(String id,String page,String limit,String sort) async {
    final client = AppRestClient(dio);
    return client.lichSuCaDay(id, page, limit, sort);
  }

  Future<BaseResponse> checkPass(String password) async {
    final client = AppRestClient(dio);
    return client.checkPass(password);
  }

  Future<ThongTinKhoaHocResponse> getThongTinKhoaHoc(int id,int buoi) async {
    final client = AppRestClient(dio);
    return client.getThongTinKhoaHoc(id, buoi);
  }

  Future<ChuongTrinhHocResponse> getChuongTrinhHoc(int ca_day_id) async {
    final client = AppRestClient(dio);
    return client.getChuongTrinhHoc(ca_day_id);
  }

  Future<DonHuyResponse> getDonHuy(int id) async {
    final client = AppRestClient(dio);
    return client.getDonHuy(id);
  }

  Future<ChiTietNXResponse> getChiTietNX(int id) async {
    final client = AppRestClient(dio);
    return client.getChiTietNX(id);
  }

  Future<BaseResponse> danhGiaGiaoVien(int id,double danhGia,String noiDung) async {
    final client = AppRestClient(dio);
    return client.danhGiaGiaoVien(id, danhGia, noiDung);
  }

  Future<BaseResponse> danhGiaBuoiHoc(int id,double danhGia,String nhanXet) async {
    final client = AppRestClient(dio);
    return client.danhGiaBuoiHoc(id, danhGia, nhanXet);
  }

  Future<DanhSachDaoTaoResponse> danhSachDaoTao(String id,String page,String limit,String sort) async {
    final client = AppRestClient(dio);
    return client.danhSachDaoTao(id, page, limit, sort);
  }

  Future<PolicyResponse> vnpay(int id) async {
    final client = AppRestClient(dio);
    return client.vnpay(id);
  }

  Future<BaseResponse> dongThuan(int id) async {
    final client = AppRestClient(dio);
    return client.dongThuan(id);
  }

  Future<BaseResponse> tuChoi(int id) async {
    final client = AppRestClient(dio);
    return client.tuChoi(id);
  }

  Future<FindTeacherResponse> timGiaoVien(int id) async {
    final client = AppRestClient(dio);
    return client.timGiaoVien(id);
  }

  Future<BaseResponse> huyDon(int id,String li_do_huy) async {
    final client = AppRestClient(dio);
    return client.huyDon(id, li_do_huy);
  }

  Future<XemKhaoSatResponse> xemKhaoSat(int id) async {
    final client = AppRestClient(dio);
    return client.xemKhaoSat(id);
  }
}
