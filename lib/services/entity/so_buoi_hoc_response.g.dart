// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'so_buoi_hoc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemSoBuoiHoc _$ItemSoBuoiHocFromJson(Map<String, dynamic> json) =>
    ItemSoBuoiHoc(
      json['id'] as int?,
      json['so_buoi'] as int?,
      json['khuyen_mai'] as int?,
      json['tong_tien'] as String?,
      json['thanh_tien'] as String?,
    );

Map<String, dynamic> _$ItemSoBuoiHocToJson(ItemSoBuoiHoc instance) =>
    <String, dynamic>{
      'id': instance.id,
      'so_buoi': instance.so_buoi,
      'khuyen_mai': instance.khuyen_mai,
      'tong_tien': instance.tong_tien,
      'thanh_tien': instance.thanh_tien,
    };

SoBuoiHocResponse _$SoBuoiHocResponseFromJson(Map<String, dynamic> json) =>
    SoBuoiHocResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ItemSoBuoiHoc.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['last_page'] as int?,
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SoBuoiHocResponseToJson(SoBuoiHocResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'last_page': instance.last_page,
    };
