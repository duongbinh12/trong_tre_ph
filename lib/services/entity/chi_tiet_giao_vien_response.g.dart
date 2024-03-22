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
      json['bang_cap'] == null
          ? null
          : BangCapData.fromJson(json['bang_cap'] as Map<String, dynamic>),
      (json['chung_chi'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
      'chung_chi': instance.chung_chi,
    };

BangCapData _$BangCapDataFromJson(Map<String, dynamic> json) => BangCapData(
      json['trinh_do'] as String?,
      json['chuyen_nganh'] as String?,
      json['truong_dao_tao'] as String?,
    );

Map<String, dynamic> _$BangCapDataToJson(BangCapData instance) =>
    <String, dynamic>{
      'trinh_do': instance.trinh_do,
      'chuyen_nganh': instance.chuyen_nganh,
      'truong_dao_tao': instance.truong_dao_tao,
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
