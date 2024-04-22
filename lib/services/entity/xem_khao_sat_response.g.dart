// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xem_khao_sat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XemKhaoSatResponse _$XemKhaoSatResponseFromJson(Map<String, dynamic> json) =>
    XemKhaoSatResponse(
      json['data'] as String?,
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$XemKhaoSatResponseToJson(XemKhaoSatResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
