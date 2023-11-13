// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankingData _$BankingDataFromJson(Map<String, dynamic> json) => BankingData(
      json['img'] as String?,
      json['ghiChu'] as String?,
    );

Map<String, dynamic> _$BankingDataToJson(BankingData instance) =>
    <String, dynamic>{
      'img': instance.img,
      'ghiChu': instance.ghiChu,
    };

BankingResponse _$BankingResponseFromJson(Map<String, dynamic> json) =>
    BankingResponse(
      json['data'] == null
          ? null
          : BankingData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$BankingResponseToJson(BankingResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
