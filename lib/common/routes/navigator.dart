import 'package:get/get.dart';
import 'package:trong_tre/services/entity/thong_tin_giao_vien_response.dart';

import 'app_pages.dart';

class AppNavigator {
  AppNavigator._();

  static navigateBack() async => Get.back();

  static navigateLogin() async => await Get.offAllNamed(Routes.login);
  static navigateSplash() async => await Get.offAllNamed(Routes.splash);
  static navigateHome() async => await Get.offAllNamed(Routes.home);
  static navigateSignUp() async => await Get.toNamed(Routes.signUp);
  static navigateLoginPhone({bool isPhone=true}) async => await Get.toNamed(Routes.login_phone,arguments: isPhone);
  static navigateForgotPass(String phone,{int type=1}) async => await Get.toNamed(Routes.forgot_pass,arguments: [phone,type]);
  static navigateNewPass() async => await Get.toNamed(Routes.new_pass);
  static navigateChangePassSuccess() async => await Get.toNamed(Routes.change_pass_success);
  static navigateNews() async => await Get.toNamed(Routes.news);
  static navigateService(int id) async => await Get.toNamed(Routes.service,arguments: id);
  static navigateSignUpService(int id) async => await Get.toNamed(Routes.signUpService,arguments: id);
  static navigateThongTinHoaDon(int id) async => await Get.toNamed(Routes.thongTinHoaDon,arguments: id);
  static navigatechuyenKhoan(int id) async => await Get.toNamed(Routes.chuyenKhoan,arguments: id);
  static navigateHoanTatDangKy() async => await Get.toNamed(Routes.hoanTatDangKy);
  static navigateThongTinGiaoVien(int id) async => await Get.toNamed(Routes.thongTinGiaoVien,arguments: id);
  static navigateChiTietChuongTrinh(int caId) async => await Get.toNamed(Routes.chiTietChuongTrinh,arguments: caId);
  static navigateNhanXetBuoiHoc(int id) async => await Get.toNamed(Routes.nhanXetBuoiHoc,arguments: id);
  static navigateHoanTatDanhGia() async => await Get.toNamed(Routes.hoanTatDanhGia);
  static navigateDanhGiaGiaoVien(GiaoVien data,int id) async => await Get.toNamed(Routes.danhGiaGiaoVien,arguments: [data,id]);
  static navigateProfile() async => await Get.toNamed(Routes.profile);
  static navigateComplain () async => await Get.toNamed(Routes.complain);
  static navigateHeSinhThai () async => await Get.toNamed(Routes.heSinhThai);
  static navigateGioiThieuApp () async => await Get.toNamed(Routes.gioiThieuApp);
  static navigateLienHe () async => await Get.toNamed(Routes.lienHe);
  static navigateNoiDungKhaoSat (String url) async => await Get.toNamed(Routes.noiDungKhaoSat,arguments: url);
  static navigateVnpay (String url) async => await Get.toNamed(Routes.vnpay,arguments: url);
  static navigateTheoDoiTienTrinh(int index,{bool isHuy=false,ThongTinGiaoVienData? data,int? id}) async => await Get.toNamed(Routes.theoDoiTienTrinh,arguments: [index,isHuy,data,id]);

}
