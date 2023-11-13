// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LienHeData _$LienHeDataFromJson(Map<String, dynamic> json) => LienHeData(
      json['image'] as String?,
      json['donViChuQuan'] as String?,
      json['truSo'] as String?,
      json['website'] as String?,
      json['hotline'] as String?,
      json['email'] as String?,
    );

Map<String, dynamic> _$LienHeDataToJson(LienHeData instance) =>
    <String, dynamic>{
      'image': instance.image,
      'donViChuQuan': instance.donViChuQuan,
      'truSo': instance.truSo,
      'website': instance.website,
      'hotline': instance.hotline,
      'email': instance.email,
    };

LienHeResponse _$LienHeResponseFromJson(Map<String, dynamic> json) =>
    LienHeResponse(
      json['data'] == null
          ? null
          : LienHeData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LienHeResponseToJson(LienHeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

GioiThieuData _$GioiThieuDataFromJson(Map<String, dynamic> json) =>
    GioiThieuData(
      json['title'] as String?,
      json['content'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$GioiThieuDataToJson(GioiThieuData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
    };

GioiThieuResponse _$GioiThieuResponseFromJson(Map<String, dynamic> json) =>
    GioiThieuResponse(
      json['data'] == null
          ? null
          : GioiThieuData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GioiThieuResponseToJson(GioiThieuResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

HeSinhThaiResponse _$HeSinhThaiResponseFromJson(Map<String, dynamic> json) =>
    HeSinhThaiResponse(
      json['data'] == null
          ? null
          : GioiThieuData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HeSinhThaiResponseToJson(HeSinhThaiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
