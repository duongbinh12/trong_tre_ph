// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ca_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemCa _$ItemCaFromJson(Map<String, dynamic> json) => ItemCa(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$ItemCaToJson(ItemCa instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ItemKhungGio _$ItemKhungGioFromJson(Map<String, dynamic> json) => ItemKhungGio(
      json['id'] as int?,
      json['khung_gio'] as String?,
      json['noi_dung'] as String?,
    );

Map<String, dynamic> _$ItemKhungGioToJson(ItemKhungGio instance) =>
    <String, dynamic>{
      'id': instance.id,
      'khung_gio': instance.khung_gio,
      'noi_dung': instance.noi_dung,
    };

GetCaResponse _$GetCaResponseFromJson(Map<String, dynamic> json) =>
    GetCaResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ItemCa.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetCaResponseToJson(GetCaResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

KhungGioResponse _$KhungGioResponseFromJson(Map<String, dynamic> json) =>
    KhungGioResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ItemKhungGio.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$KhungGioResponseToJson(KhungGioResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
