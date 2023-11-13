// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chi_tiet_giao_vien_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChiTietGiaoVienData _$ChiTietGiaoVienDataFromJson(Map<String, dynamic> json) =>
    ChiTietGiaoVienData(
      json['id'] as int?,
      json['anh_nguoi_dung'] as String?,
      json['danh_gia'] as String?,
      json['hoten'] as String?,
      json['trinh_do'] as String?,
      json['dien_thoai'] as String?,
      json['ngay_sinh'] as String?,
      json['bang_cap'] as String?,
    );

Map<String, dynamic> _$ChiTietGiaoVienDataToJson(
        ChiTietGiaoVienData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'anh_nguoi_dung': instance.anh_nguoi_dung,
      'danh_gia': instance.danh_gia,
      'hoten': instance.hoten,
      'trinh_do': instance.trinh_do,
      'dien_thoai': instance.dien_thoai,
      'ngay_sinh': instance.ngay_sinh,
      'bang_cap': instance.bang_cap,
    };

ChiTietGiaoVienResponse _$ChiTietGiaoVienResponseFromJson(
        Map<String, dynamic> json) =>
    ChiTietGiaoVienResponse(
      json['data'] == null
          ? null
          : ChiTietGiaoVienData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChiTietGiaoVienResponseToJson(
        ChiTietGiaoVienResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
