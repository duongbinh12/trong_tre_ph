import 'package:get/get.dart';

import 'app_pages.dart';

class AppNavigator {
  AppNavigator._();

  static navigateBack() async => Get.back();

  static navigateLogin() async => await Get.offAllNamed(Routes.login);
  static navigateHome() async => await Get.offAllNamed(Routes.home);
  static navigateSignUp() async => await Get.toNamed(Routes.signUp);
  static navigateLoginPhone({bool isPhone=true}) async => await Get.toNamed(Routes.login_phone,arguments: isPhone);
  static navigateForgotPass() async => await Get.toNamed(Routes.forgot_pass);
  static navigateNewPass() async => await Get.toNamed(Routes.new_pass);
  static navigateChangePassSuccess() async => await Get.toNamed(Routes.change_pass_success);
  static navigateNews() async => await Get.toNamed(Routes.news);
  static navigateService(int id) async => await Get.toNamed(Routes.service,arguments: id);
  static navigateSignUpService(int id) async => await Get.toNamed(Routes.signUpService,arguments: id);
  static navigateThongTinHoaDon() async => await Get.toNamed(Routes.thongTinHoaDon);
  static navigatechuyenKhoan() async => await Get.toNamed(Routes.chuyenKhoan);
  static navigateHoanTatDangKy() async => await Get.toNamed(Routes.hoanTatDangKy);
  static navigateThongTinGiaoVien() async => await Get.toNamed(Routes.thongTinGiaoVien);
  static navigateChiTietChuongTrinh() async => await Get.toNamed(Routes.chiTietChuongTrinh);
  static navigateNhanXetBuoiHoc() async => await Get.toNamed(Routes.nhanXetBuoiHoc);
  static navigateHoanTatDanhGia() async => await Get.toNamed(Routes.hoanTatDanhGia);
  static navigateDanhGiaGiaoVien() async => await Get.toNamed(Routes.danhGiaGiaoVien);
  static navigateProfile() async => await Get.toNamed(Routes.profile);
  static navigateComplain () async => await Get.toNamed(Routes.complain);
  static navigateHeSinhThai () async => await Get.toNamed(Routes.heSinhThai);
  static navigateGioiThieuApp () async => await Get.toNamed(Routes.gioiThieuApp);
  static navigateLienHe () async => await Get.toNamed(Routes.lienHe);
  static navigateNoiDungKhaoSat () async => await Get.toNamed(Routes.noiDungKhaoSat);
  static navigateTheoDoiTienTrinh(int index,{bool isHuy=false}) async => await Get.toNamed(Routes.theoDoiTienTrinh,arguments: [index,isHuy]);

}
