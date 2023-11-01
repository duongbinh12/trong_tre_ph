// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tin_tuc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemNews _$ItemNewsFromJson(Map<String, dynamic> json) => ItemNews(
      json['id'] as int?,
      json['tieu_de'] as String?,
      json['noi_dung'] as String?,
      json['anh_dai_dien'] as String?,
      json['date'] as String?,
    );

Map<String, dynamic> _$ItemNewsToJson(ItemNews instance) => <String, dynamic>{
      'id': instance.id,
      'tieu_de': instance.tieu_de,
      'noi_dung': instance.noi_dung,
      'anh_dai_dien': instance.anh_dai_dien,
      'date': instance.date,
    };

TinTucData _$TinTucDataFromJson(Map<String, dynamic> json) => TinTucData(
      (json['tinTuc'] as List<dynamic>?)
          ?.map((e) => ItemNews.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TinTucDataToJson(TinTucData instance) =>
    <String, dynamic>{
      'tinTuc': instance.tinTuc,
    };

TinTucResponse _$TinTucResponseFromJson(Map<String, dynamic> json) =>
    TinTucResponse(
      json['data'] == null
          ? null
          : TinTucData.fromJson(json['data'] as Map<String, dynamic>),
      json['last_page'] as int?,
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$TinTucResponseToJson(TinTucResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'last_page': instance.last_page,
    };
