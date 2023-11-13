// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tao_don_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaoDonData _$TaoDonDataFromJson(Map<String, dynamic> json) => TaoDonData(
      id: json['id'] as int?,
    );

Map<String, dynamic> _$TaoDonDataToJson(TaoDonData instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

TaoDonResponse _$TaoDonResponseFromJson(Map<String, dynamic> json) =>
    TaoDonResponse(
      json['data'] == null
          ? null
          : TaoDonData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$TaoDonResponseToJson(TaoDonResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
