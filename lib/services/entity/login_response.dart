import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginData {
  int? id;
  String? anh_nguoi_dung,auth_key,hoten,vai_tro;


  LoginData(
      this.id, this.anh_nguoi_dung, this.auth_key, this.hoten, this.vai_tro);

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
