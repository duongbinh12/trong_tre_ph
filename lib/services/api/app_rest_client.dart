import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trong_tre/services/entity/banking_response.dart';
import 'package:trong_tre/services/entity/base_response.dart';
import 'package:trong_tre/services/entity/chi_tiet_dich_vu_response.dart';
import 'package:trong_tre/services/entity/chi_tiet_giao_vien_response.dart';
import 'package:trong_tre/services/entity/chi_tiet_nx_response.dart';
import 'package:trong_tre/services/entity/chon_hoc_phi_response.dart';
import 'package:trong_tre/services/entity/danh_sach_dao_tao_response.dart';
import 'package:trong_tre/services/entity/don_huy_response.dart';
import 'package:trong_tre/services/entity/get_ca_response.dart';
import 'package:trong_tre/services/entity/history_order_response.dart';
import 'package:trong_tre/services/entity/home_response.dart';
import 'package:trong_tre/services/entity/lich_su_ca_day_response.dart';
import 'package:trong_tre/services/entity/login_response.dart';
import 'package:trong_tre/services/entity/policy_response.dart';
import 'package:trong_tre/services/entity/setting_response.dart';
import 'package:trong_tre/services/entity/so_buoi_hoc_response.dart';
import 'package:trong_tre/services/entity/tao_don_response.dart';
import 'package:trong_tre/services/entity/thong_bao_response.dart';
import 'package:trong_tre/services/entity/thong_tin_giao_vien_response.dart';
import 'package:trong_tre/services/entity/thong_tin_khoa_hoc_response.dart';
import 'package:trong_tre/services/entity/tin_tuc_response.dart';
import '../entity/chuong_trinh_hoc_response.dart';
import '../entity/find_teacher_response.dart';
import 'endpoint.dart';
part 'app_rest_client.g.dart';

@RestApi(baseUrl: Endpoint.BASE_URL)
abstract class AppRestClient {
  factory AppRestClient(Dio dio) = _AppRestClient;
// authentication
//
  @POST(Endpoint.login)
  Future<LoginResponse> login(
      @Part(name: 'dien_thoai') String phone,
      @Part(name: 'password') String password,
      @Part(name: 'mobile_token') String mobileToken ,
      );

  @POST(Endpoint.login)
  Future<LoginResponse> loginEmail(
      @Part(name: 'email') String email,
      @Part(name: 'password') String password,
      @Part(name: 'mobile_token') String mobileToken
      );

  @POST(Endpoint.register)
  Future<BaseResponse> register(
      @Part(name: 'email') String email,
      @Part(name: 'dien_thoai') String dienThoai,
      @Part(name: 'password') String password,
      @Part(name: 'password_confirm') String passwordConfirm
      );

  @GET(Endpoint.dieuKhoan)
  Future<PolicyResponse> getPolicy();

  @GET(Endpoint.home)
  Future<HomeResponse> getHome();

  @GET(Endpoint.tinTuc)
  Future<TinTucResponse> getNews(
      @Query('type') int type,
      @Query('page') int page,
      @Query('limit') int limit,
      @Query('tuKhoa') String tuKhoa,
      @Query('sort') int sort,
      );

  @GET(Endpoint.chiTietDichVu)
  Future<ChiTietDichVuResponse> getChiTietDichVu(
      @Query('id') int id,
      );

  @GET(Endpoint.getCa)
  Future<GetCaResponse> getCa();

  @GET(Endpoint.khungGio)
  Future<KhungGioResponse> getKhungGio(
      @Query('dich_vu_id') int dich_vu_id,
      @Query('type') int type
      );

  @POST(Endpoint.forgotPass)
  Future<BaseResponse> getOtpPhone(
      @Part(value: "dien_thoai") String dienThoai
      );

  @POST(Endpoint.forgotPass)
  Future<BaseResponse> getOtpEmail(
      @Part(value: "email") String email
      );

  @POST(Endpoint.checkOtp)
  Future<LoginResponse> checkOtpPhone(
      @Part(value: "dien_thoai") String phone,
      @Part(value: "ma_xac_thuc") String code
      );

  @POST(Endpoint.checkOtp)
  Future<LoginResponse> checkOtpEmail(
      @Part(value: "email") String email,
      @Part(value: "ma_xac_thuc") String code
      );

  @POST(Endpoint.newPass)
  Future<BaseResponse> newPass(
      @Part(value: "password") String password,
      @Part(value: "password_comfirm") String rePass
      );

  @GET(Endpoint.lienHe)
  Future<LienHeResponse> getLienHe();

  @GET(Endpoint.heSinhThai)
  Future<HeSinhThaiResponse> getHeSinhThai();

  @GET(Endpoint.gioiThieu)
  Future<GioiThieuResponse> getGioiThieu();

  @GET(Endpoint.myInfo)
  Future<LoginResponse> getMyInfo();

  @GET(Endpoint.dangXuat)
  Future<BaseResponse> logOut();

  @POST(Endpoint.editInfo)
  Future<BaseResponse> editInfo(
      @Part(value: "hoten") String hoten,
      @Part(value: "dia_chi") String dia_chi,
      );

  @POST(Endpoint.editInfo)
  Future<BaseResponse> editAvatar(
      @Part(value: "anh_nguoi_dung") File anhNguoiDung,
      );

  @POST(Endpoint.khieuNai)
  Future<BaseResponse> khieuNai(
      @Part(value: "noi_dung") String noiDung,
      );

  @GET(Endpoint.danhSachDon)
  Future<HistoryOrderResponse> getHistory(
      @Query('page') int page,
      @Query('limit') int limit,
      @Query('tuKhoa') String tuKhoa,
      @Query('sort') int sort
      );

  @GET(Endpoint.soLuongBuoi)
  Future<SoBuoiHocResponse> getSoBuoiHoc(
      @Query('dich_vu_id') int dichVuId,
      @Query('page') int page,
      @Query('limit') int limit,
      @Query('sort') int sort,
      @Query('trinh_do') int trinhDo
      );

  @GET(Endpoint.thongBao)
  Future<ThongBaoResponse> getThongBao(
      @Query('type') String type,
      @Query('page') int page,
      @Query('limit') int limit,
      @Query('sort') int sort,
      @Query('tuKhoa') String tuKhoa
      );

  @GET(Endpoint.formChonHocPhi)
  Future<ChonHocPhiResponse> getChonHocPhi();

  @POST(Endpoint.addHoaDon)
  Future<BaseResponse> addHoaDon(
      @Part(value: "ho_ten") String ho_ten,
      @Part(value: "cmnd_cccd") String cmnd_cccd,
      @Part(value: "dia_chi") String dia_chi,
      @Part(value: "ma_so_thue") String ma_so_thue,
      @Part(value: "email") String email,
      @Part(value: "ho_ten_con") String ho_ten_con,
      @Part(value: "nam_sinh_cua_con") String nam_sinh_cua_con,
      @Part(value: "don_dich_vu_id") String don_dich_vu_id,
      );

  @POST(Endpoint.taoDon)
  Future<TaoDonResponse> taoDon(
      @Part(value: "dich_vu_id") String dich_vu_id,
      @Part(value: "dia_chi") String dia_chi,
      @Part(value: "thoi_gian_bat_dau") String thoi_gian_bat_dau,
      @Part(value: "thu") String thu,
      @Part(value: "chon_ca_id") String chon_ca_id,
      @Part(value: "loai_giao_vien") String loai_giao_vien,
      @Part(value: "so_luong_be") String so_luong_be,
      @Part(value: "goi_hoc_phi_id") String goi_hoc_phi_id,
      @Part(value: "hoc_phi") String hoc_phi,
      @Part(value: "phu_cap") String phu_cap,
      @Part(value: "tong_tien") String tong_tien,
      @Part(value: "hinh_thuc_thanh_toan_id") String hinh_thuc_thanh_toan_id,
      @Part(value: "ghi_chu") String ghi_chu,
      @Part(value: "an_trua_id") String an_trua_id,
      @Part(value: "them_gio_id") String them_gio_id,
      );

  @GET(Endpoint.infoBanking)
  Future<BankingResponse> getInfoBanking(
      @Query('don_dich_vu_id') String dichVuId,
      );

  @POST(Endpoint.uploadImage)
  Future<BaseResponse> uploadImage(
      @Part(value: "don_dich_vu_id") String don_dich_vu_id,
      @Part(value: "file") File file,
      );

  @GET(Endpoint.thongTinGiaoVien)
  Future<ThongTinGiaoVienResponse> getThongTinGiaoVien(
      @Query('id') String id,
      );

  @GET(Endpoint.chiTietGiaoVien)
  Future<ChiTietGiaoVienResponse> chiTietGiaoVien(
      @Query('giao_vien_id') String id,
      );

  @GET(Endpoint.lichSuCaDay)
  Future<LichSuCaDayResponse> lichSuCaDay(
      @Query('giao_vien_id') String id,
      @Query('page') String page,
      @Query('limit') String limit,
      @Query('sort') String sort,
      );

  @POST(Endpoint.checkPass)
  Future<BaseResponse> checkPass(
      @Part(value: "password") String password,
      );

  @GET(Endpoint.thongTinKhoaHoc)
  Future<ThongTinKhoaHocResponse> getThongTinKhoaHoc(
      @Query('id') int id,
      @Query('buoi') int buoi
      );

  @GET(Endpoint.chuongTrinhHoc)
  Future<ChuongTrinhHocResponse> getChuongTrinhHoc(
      @Query('ca_day_id') int ca_day_id
      );

  @GET(Endpoint.donHuy)
  Future<DonHuyResponse> getDonHuy(
      @Query('id') int id
      );

  @GET(Endpoint.chiTietNhanXet)
  Future<ChiTietNXResponse> getChiTietNX(
      @Query('ca_day_id') int id
      );

  @POST(Endpoint.danhGiaGiaoVien)
  Future<BaseResponse> danhGiaGiaoVien(
      @Part(value: "id") int id,
      @Part(value: "danh_gia") double danhGia,
      @Part(value: "noi_dung_danh_gia") String noiDung
      );

  @POST(Endpoint.danhGiaBuoiHoc)
  Future<BaseResponse> danhGiaBuoiHoc(
      @Part(value: "ca_day_id") int id,
      @Part(value: "danh_gia") double danhGia,
      @Part(value: "nhan_xet") String nhanXet
      );

  @GET(Endpoint.danhSachDaoTao)
  Future<DanhSachDaoTaoResponse> danhSachDaoTao(
      @Query('giao_vien_id') String id,
      @Query('page') String page,
      @Query('limit') String limit,
      @Query('sort') String sort,
      );

  @POST(Endpoint.vnpay)
  Future<PolicyResponse> vnpay(
      @Part(value: "don_dich_vu_id") int id,
      );

  @POST(Endpoint.dongThuan)
  Future<BaseResponse> dongThuan(
      @Part(value: "id") int id,
      );

  @POST(Endpoint.tuChoi)
  Future<BaseResponse> tuChoi(
      @Part(value: "id") int id,
      );

  @GET(Endpoint.timGiaoVien)
  Future<FindTeacherResponse> timGiaoVien(
      @Query('id') int id,
      );

  @POST(Endpoint.huyDon)
  Future<BaseResponse> huyDon(
      @Part(value: "id") int id,
      @Part(value: "li_do_huy") String li_do_huy,
      );
}
