import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginData {
  int? id;
  String? anh_nguoi_dung,auth_key,hoten,vai_tro,dien_thoai,dia_chi,email,tai_nguyen,dieu_khoan,chinh_sach_dieu_khoan,chinh_sach_bao_mat,quy_che_hoan_huy,tai_lieu,facebook,youtube,web;


  LoginData(
      this.id,
      this.anh_nguoi_dung,
      this.auth_key,
      this.hoten,
      this.vai_tro,
      this.dien_thoai,
      this.dia_chi,
      this.email,
      this.tai_nguyen,
      this.dieu_khoan,
      this.chinh_sach_dieu_khoan,
      this.chinh_sach_bao_mat,
      this.quy_che_hoan_huy,
      this.tai_lieu,
      this.facebook,
      this.youtube,
      this.web);

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class LoginResponse extends BaseResponse {
  LoginData? data;


  LoginResponse(this.data);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
