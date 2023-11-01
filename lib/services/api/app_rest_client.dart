import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trong_tre/services/entity/base_response.dart';
import 'package:trong_tre/services/entity/chi_tiet_dich_vu_response.dart';
import 'package:trong_tre/services/entity/get_ca_response.dart';
import 'package:trong_tre/services/entity/home_response.dart';
import 'package:trong_tre/services/entity/login_response.dart';
import 'package:trong_tre/services/entity/policy_response.dart';
import 'package:trong_tre/services/entity/tin_tuc_response.dart';
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
      @Part(name: 'password') String password
      );

  @POST(Endpoint.login)
  Future<LoginResponse> loginEmail(
      @Part(name: 'email') String email,
      @Part(name: 'password') String password
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
}
