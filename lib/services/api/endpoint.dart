class Endpoint {
  Endpoint._();

  static const BASE_URL = 'https://trongtre.top';
  static const login = '/parent-api/login';
  static const register = '/parent-api/register';
  static const dieuKhoan = '/parent-api/dieu-khoan';
  static const chiTietDichVu = '/parent-api/chi-tiet-dich-vu';
  static const getCa = '/parent-api/get-ca';
  static const khungGio = '/parent-api/danh-sach-khung-gio';

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
