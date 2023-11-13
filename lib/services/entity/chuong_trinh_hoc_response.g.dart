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

ChuongTrinhHocData _$ChuongTrinhHocDataFromJson(Map<String, dynamic> json) =>
    ChuongTrinhHocData(
      json['id'] as int?,
      json['tieu_de'] as String?,
      (json['buoiHoc'] as List<dynamic>?)
          ?.map((e) => ItemChuongTrinhHoc.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChuongTrinhHocDataToJson(ChuongTrinhHocData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tieu_de': instance.tieu_de,
      'buoiHoc': instance.buoiHoc,
    };

ChuongTrinhHocResponse _$ChuongTrinhHocResponseFromJson(
        Map<String, dynamic> json) =>
    ChuongTrinhHocResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ChuongTrinhHocData.fromJson(e as Map<String, dynamic>))
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
