import 'package:dio/dio.dart';
import 'package:trong_tre/services/entity/base_response.dart';
import 'package:trong_tre/services/entity/chi_tiet_dich_vu_response.dart';
import 'package:trong_tre/services/entity/get_ca_response.dart';
import 'package:trong_tre/services/entity/home_response.dart';
import 'package:trong_tre/services/entity/policy_response.dart';
import 'package:trong_tre/services/entity/tin_tuc_response.dart';
import '../api/app_rest_client.dart';
import '../entity/login_response.dart';
import 'app_common_repository.dart';

class CommonRepository extends AppCommonRepository {
  final Dio dio;

  CommonRepository(this.dio) : super(dio);

//authentic
  Future<LoginResponse> loginPhone(String phone,String password) async {
    final client = AppRestClient(dio);
    return client.login(phone, password);
  }

  Future<LoginResponse> loginEmail(String email,String password) async {
    final client = AppRestClient(dio);
    return client.loginEmail(email, password);
  }

  Future<PolicyResponse> getPolicy() async {
    final client = AppRestClient(dio);
    return client.getPolicy();
  }

  Future<BaseResponse> register(String email,String dienThoai,String password,String passwordConfirm) async {
    final client = AppRestClient(dio);
    return client.register(email, dienThoai, password, passwordConfirm);
  }


  Future<HomeResponse> getHome() async {
    final client = AppRestClient(dio);
    return client.getHome();
  }

  Future<TinTucResponse> getNews(int type,int page,int limit,String tuKhoa,int sort) async {
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

  Future<KhungGioResponse> getKhungGio(int dich_vu_id,int type) async {
    final client = AppRestClient(dio);
    return client.getKhungGio(dich_vu_id, type);
  }
}
