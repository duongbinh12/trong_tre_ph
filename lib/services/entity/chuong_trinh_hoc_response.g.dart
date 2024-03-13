// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chuong_trinh_hoc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemChuongTrinhHoc _$ItemChuongTrinhHocFromJson(Map<String, dynamic> json) =>
    ItemChuongTrinhHoc(
      json['id'] as int?,
      json['buoi'] as int?,
      json['noi_dung'] as String?,
    );

Map<String, dynamic> _$ItemChuongTrinhHocToJson(ItemChuongTrinhHoc instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buoi': instance.buoi,
      'noi_dung': instance.noi_dung,
    };

GiaoCuData _$GiaoCuDataFromJson(Map<String, dynamic> json) => GiaoCuData(
      json['id'] as int?,
      json['code'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$GiaoCuDataToJson(GiaoCuData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'image': instance.image,
    };

ChuongTrinhHocData _$ChuongTrinhHocDataFromJson(Map<String, dynamic> json) =>
    ChuongTrinhHocData(
      json['id'] as int?,
      json['tieu_de'] as String?,
      (json['buoiHoc'] as List<dynamic>?)
          ?.map((e) => ItemChuongTrinhHoc.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['giaoCu'] as List<dynamic>?)
          ?.map((e) => GiaoCuData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChuongTrinhHocDataToJson(ChuongTrinhHocData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tieu_de': instance.tieu_de,
      'buoiHoc': instance.buoiHoc,
      'giaoCu': instance.giaoCu,
    };

GoiHocData _$GoiHocDataFromJson(Map<String, dynamic> json) => GoiHocData(
      (json['goiHoc'] as List<dynamic>?)
          ?.map((e) => ChuongTrinhHocData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as int?,
      json['ten_chuong_trinh'] as String?,
      json['name'] as String?,
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GoiHocDataToJson(GoiHocData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'goiHoc': instance.goiHoc,
      'ten_chuong_trinh': instance.ten_chuong_trinh,
      'name': instance.name,
      'id': instance.id,
    };

ChuongTrinhHocResponse _$ChuongTrinhHocResponseFromJson(
        Map<String, dynamic> json) =>
    ChuongTrinhHocResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => GoiHocData.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChuongTrinhHocResponseToJson(
        ChuongTrinhHocResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
