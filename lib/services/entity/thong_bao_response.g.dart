// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thong_bao_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemThongBao _$ItemThongBaoFromJson(Map<String, dynamic> json) => ItemThongBao(
      json['id'] as int?,
      json['noi_dung'] as String?,
      json['image'] as String?,
      json['created'] as String?,
      json['tieu_de'] as String?,
    );

Map<String, dynamic> _$ItemThongBaoToJson(ItemThongBao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'noi_dung': instance.noi_dung,
      'image': instance.image,
      'created': instance.created,
      'tieu_de': instance.tieu_de,
    };

ItemTypeThongBao _$ItemTypeThongBaoFromJson(Map<String, dynamic> json) =>
    ItemTypeThongBao(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$ItemTypeThongBaoToJson(ItemTypeThongBao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ItemThongBaoData _$ItemThongBaoDataFromJson(Map<String, dynamic> json) =>
    ItemThongBaoData(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ItemThongBao.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['date'] as String?,
    );

Map<String, dynamic> _$ItemThongBaoDataToJson(ItemThongBaoData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'date': instance.date,
    };

ThongBaoData _$ThongBaoDataFromJson(Map<String, dynamic> json) => ThongBaoData(
      (json['thong_bao'] as List<dynamic>?)
          ?.map((e) => ItemThongBaoData.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['type'] as List<dynamic>?)
          ?.map((e) => ItemTypeThongBao.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ThongBaoDataToJson(ThongBaoData instance) =>
    <String, dynamic>{
      'thong_bao': instance.thong_bao,
      'type': instance.type,
    };

ThongBaoResponse _$ThongBaoResponseFromJson(Map<String, dynamic> json) =>
    ThongBaoResponse(
      json['data'] == null
          ? null
          : ThongBaoData.fromJson(json['data'] as Map<String, dynamic>),
      json['last_page'] as int?,
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ThongBaoResponseToJson(ThongBaoResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'last_page': instance.last_page,
    };
