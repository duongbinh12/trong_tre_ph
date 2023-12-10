// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thong_tin_giao_vien_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiaoVien _$GiaoVienFromJson(Map<String, dynamic> json) => GiaoVien(
      json['id'] as int?,
      json['anh_nguoi_dung'] as String?,
      json['danh_gia'] as String?,
      json['hoten'] as String?,
      json['trinh_do'] as String?,
      json['dien_thoai'] as String?,
    );

Map<String, dynamic> _$GiaoVienToJson(GiaoVien instance) => <String, dynamic>{
      'id': instance.id,
      'anh_nguoi_dung': instance.anh_nguoi_dung,
      'danh_gia': instance.danh_gia,
      'hoten': instance.hoten,
      'trinh_do': instance.trinh_do,
      'dien_thoai': instance.dien_thoai,
    };

ThongTinGiaoVienData _$ThongTinGiaoVienDataFromJson(
        Map<String, dynamic> json) =>
    ThongTinGiaoVienData(
      json['noi_dung_khao_sat'] as String?,
      json['leaderKD'] == null
          ? null
          : GiaoVien.fromJson(json['leaderKD'] as Map<String, dynamic>),
      json['giaoVien'] == null
          ? null
          : GiaoVien.fromJson(json['giaoVien'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThongTinGiaoVienDataToJson(
        ThongTinGiaoVienData instance) =>
    <String, dynamic>{
      'noi_dung_khao_sat': instance.noi_dung_khao_sat,
      'giaoVien': instance.giaoVien,
      'leaderKD': instance.leaderKD,
    };

ThongTinGiaoVienResponse _$ThongTinGiaoVienResponseFromJson(
        Map<String, dynamic> json) =>
    ThongTinGiaoVienResponse(
      json['data'] == null
          ? null
          : ThongTinGiaoVienData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ThongTinGiaoVienResponseToJson(
        ThongTinGiaoVienResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
