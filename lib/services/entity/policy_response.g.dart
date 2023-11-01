// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolicyResponse _$PolicyResponseFromJson(Map<String, dynamic> json) =>
    PolicyResponse(
      json['data'] as String?,
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$PolicyResponseToJson(PolicyResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
