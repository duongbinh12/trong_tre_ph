// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      json['id'] as int?,
      json['anh_nguoi_dung'] as String?,
      json['auth_key'] as String?,
      json['hoten'] as String?,
      json['vai_tro'] as String?,
      json['dien_thoai'] as String?,
      json['dia_chi'] as String?,
      json['email'] as String?,
      json['tai_nguyen'] as String?,
      json['dieu_khoan'] as String?,
      json['tai_lieu'] as String?,
      json['facebook'] as String?,
      json['youtube'] as String?,
      json['web'] as String?,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'id': instance.id,
      'anh_nguoi_dung': instance.anh_nguoi_dung,
      'auth_key': instance.auth_key,
      'hoten': instance.hoten,
      'vai_tro': instance.vai_tro,
      'dien_thoai': instance.dien_thoai,
      'dia_chi': instance.dia_chi,
      'email': instance.email,
      'tai_nguyen': instance.tai_nguyen,
      'dieu_khoan': instance.dieu_khoan,
      'tai_lieu': instance.tai_lieu,
      'facebook': instance.facebook,
      'youtube': instance.youtube,
      'web': instance.web,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
