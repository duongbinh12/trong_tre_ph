import 'package:get/get.dart';
import 'package:trong_tre/bindings/home_binding.dart';
import 'package:trong_tre/bindings/service_binding.dart';
import 'package:trong_tre/screens/home/news.dart';
import 'package:trong_tre/screens/loading/splash.dart';
import 'package:trong_tre/screens/login/change_pass_success.dart';
import 'package:trong_tre/screens/login/forgot_pass.dart';
import 'package:trong_tre/screens/login/login.dart';
import 'package:trong_tre/screens/login/login_phone.dart';
import 'package:trong_tre/screens/login/new_pass.dart';
import 'package:trong_tre/screens/login/sign_up.dart';
import 'package:trong_tre/screens/menu/he_sinh_thai.dart';
import 'package:trong_tre/screens/menu/lien_he.dart';
import 'package:trong_tre/screens/service/chon_hoc_phi.dart';
import 'package:trong_tre/screens/service/chuyen_khoan.dart';
import 'package:trong_tre/screens/service/detail_service.dart';
import 'package:trong_tre/screens/service/hoan_tat_dang_ky.dart';
import 'package:trong_tre/screens/service/main_sign_up_service.dart';
import 'package:trong_tre/screens/service/sign_up_service.dart';
import 'package:trong_tre/screens/service/thong_tin_hoa_don.dart';
import 'package:trong_tre/screens/service/vnpay.dart';
import 'package:trong_tre/screens/service/xac_nhan_lich_hoc.dart';
import 'package:trong_tre/screens/setting/complain.dart';
import 'package:trong_tre/screens/setting/profile.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/chi_tiet_chuong_trinh.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/danh_gia_giao_vien.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/detail_teacher.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/nhan_xet_buoi_hoc.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/nhan_xet_thanh_cong.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/noi_dung_khao_sat.dart';
import 'package:trong_tre/screens/theo_doi_tien_trinh/theo_doi_tien_trinh.dart';
import '../../bindings/tien_trinh_binding.dart';
import '../../screens/menu/gioi_thieu_app.dart';
import '../../screens/theo_doi_tien_trinh/servey.dart';
import '/screens/app_no_internet_page.dart';
import '/screens/home/home.dart';

import 'common_pages.dart';

part 'app_routes.dart';

class AppPages extends CommonPages {
  AppPages();

  @override
  List<GetPage> onConfig() {
    return [
        GetPage(name: Routes.splash, page: () => const Splash()),
        GetPage(name: Routes.home, page: () => const HomePage(),binding: HomeBinding()),
        GetPage(name: Routes.login, page: () => const Login()),
        GetPage(name: Routes.signUp, page: () => const SignUp()),
        GetPage(name: Routes.login_phone, page: () => const LoginPhone()),
        GetPage(name: Routes.forgot_pass, page: () => const ForgotPass()),
        GetPage(name: Routes.new_pass, page: () => const NewPass()),
        GetPage(name: Routes.change_pass_success, page: () => const ChangePassSuccess()),
        GetPage(name: Routes.news, page: () => const News()),
        GetPage(name: Routes.service, page: () => const DetailService(),binding: ServicesBinding()),
        GetPage(name: Routes.signUpService, page: () => const MainSignUpService()),
        // GetPage(name: Routes.chonHocPhi, page: () => ChonHocPhi()),
        // GetPage(name: Routes.xacNhanLichHoc, page: () => const XacNhanLichHoc()),
        GetPage(name: Routes.thongTinHoaDon, page: () => const ThongTinHoaDon()),
        GetPage(name: Routes.chuyenKhoan, page: () => const ChuyenKhoan()),
        GetPage(name: Routes.hoanTatDangKy, page: () => const HoanTatDangKy()),
        GetPage(name: Routes.thongTinGiaoVien, page: () => const DetailTeacher()),
        GetPage(name: Routes.chiTietChuongTrinh, page: () => const ChiTietChuongTrinh()),
        GetPage(name: Routes.nhanXetBuoiHoc, page: () => const NhanXetBuoiHoc()),
        GetPage(name: Routes.hoanTatDanhGia, page: () => const NhanXetThanhCong()),
        GetPage(name: Routes.danhGiaGiaoVien, page: () => const DanhGiaGiaoVien()),
        GetPage(name: Routes.profile, page: () => const Profile()),
        GetPage(name: Routes.complain, page: () => const Complain()),
        GetPage(name: Routes.heSinhThai, page: () => const HeSinhThai()),
        GetPage(name: Routes.heSinhThai, page: () => const HeSinhThai()),
        GetPage(name: Routes.gioiThieuApp, page: () => const GioiThieuApp()),
        GetPage(name: Routes.lienHe, page: () => const LienHe()),
        GetPage(name: Routes.noiDungKhaoSat, page: () => const NoiDungKhaoSat()),
        GetPage(name: Routes.vnpay, page: () => const VnpayScreen()),
        GetPage(name: Routes.theoDoiTienTrinh, page: () => const TheoDoiTienTrinh(),binding: TienTrinhBinding()),
     ];
  }
}
