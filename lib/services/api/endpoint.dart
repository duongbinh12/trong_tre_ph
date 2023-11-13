class Endpoint {
  Endpoint._();

  static const BASE_URL = 'https://trongtre.top';
  static const login = '/parent-api/login';
  static const register = '/parent-api/register';
  static const dieuKhoan = '/parent-api/dieu-khoan';
  static const chiTietDichVu = '/parent-api/chi-tiet-dich-vu';
  static const getCa = '/parent-api/get-ca';
  static const khungGio = '/parent-api/danh-sach-khung-gio';
  static const forgotPass = '/parent-api/quen-mat-khau';
  static const checkOtp = '/parent-api/kiem-tra-ma-xac-thuc';
  static const newPass = '/parent-api/tao-mat-khau-moi';
  static const lienHe = '/parent-api/lien-he-va-tro-giup';
  static const gioiThieu = '/parent-api/gioi-thieu-app';
  static const heSinhThai = '/parent-api/he-sinh-thai-giao-duc';
  static const myInfo = '/parent-api/thong-tin-ca-nhan';
  static const editInfo = '/parent-api/chinh-sua-thong-tin-ca-nhan';
  static const khieuNai = '/parent-api/gui-khieu-nai';
  static const dangXuat = '/parent-api/logout';
  static const danhSachDon = '/parent-api/danh-sach-don';
  static const soLuongBuoi = '/parent-api/danh-sach-gia-buoi-hoc';
  static const thongBao = '/parent-api/danh-sach-thong-bao';
  static const formChonHocPhi = '/parent-api/load-form-goi-hoc-phi';
  static const addHoaDon = '/parent-api/hoa-don';
  static const infoBanking = '/parent-api/info-banking';
  static const taoDon = '/parent-api/tao-don';
  static const uploadImage = '/parent-api/upload-image-banking';
  static const thongTinGiaoVien = '/parent-api/thong-tin-giao-vien';
  static const chiTietGiaoVien = '/parent-api/thong-tin-chi-tiet-giao-vien';
  static const lichSuCaDay = '/parent-api/lich-su-ca-day';
  static const checkPass = '/parent-api/kiem-tra-mat-khau';
  static const thongTinKhoaHoc = '/parent-api/thong-tin-khoa-hoc';
  static const chuongTrinhHoc = '/parent-api/chuong-trinh-hoc';
  static const donHuy = '/parent-api/chi-tiet-don-huy';
  static const chiTietNhanXet = '/parent-api/chi-tiet-nhan-xet';
  static const danhGiaGiaoVien = '/parent-api/danh-gia-giao-vien';
  static const danhGiaBuoiHoc = '/parent-api/danh-gia-buoi-hoc';
  static const danhSachDaoTao = '/parent-api/danh-sach-dao-tao';

  static const home = '/parent-api/home';
  static const tinTuc = '/parent-api/tin-tuc';

  static const int DEFAULT_LIMIT = 20;

  // request failed
  static const int FAILURE = 0;

  // request success
  static const int SUCCESS = 1;

  // request with token expire
  static const int TOKEN_EXPIRE = 2;

  // receiveTimeout
  static const int receiveTimeout = 30000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // method
  static const GET = 'GET';
  static const POST = 'POST';
  static const PUT = 'PUT';
  static const DELETE = 'DELETE';

  // get path
  static String getPath(String path) {
    return '$BASE_URL$path';
  }
}
