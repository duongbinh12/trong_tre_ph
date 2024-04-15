// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hoa_don_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HoaDonResponse _$HoaDonResponseFromJson(Map<String, dynamic> json) =>
    HoaDonResponse(
      json['data'] as int?,
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HoaDonResponseToJson(HoaDonResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
