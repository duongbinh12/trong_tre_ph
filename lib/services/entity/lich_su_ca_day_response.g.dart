// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lich_su_ca_day_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemLichSuCaDay _$ItemLichSuCaDayFromJson(Map<String, dynamic> json) =>
    ItemLichSuCaDay(
      json['id'] as int?,
      json['ma_don_hang'] as String?,
      json['created'] as String?,
      json['trang_thai'] as String?,
      json['dichVu'] as String?,
      json['soBuoiHoanThanh'] as String?,
      json['noi_dung_danh_gia'] as String?,
    );

Map<String, dynamic> _$ItemLichSuCaDayToJson(ItemLichSuCaDay instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ma_don_hang': instance.ma_don_hang,
      'created': instance.created,
      'trang_thai': instance.trang_thai,
      'dichVu': instance.dichVu,
      'soBuoiHoanThanh': instance.soBuoiHoanThanh,
      'noi_dung_danh_gia': instance.noi_dung_danh_gia,
    };

LichSuCaDayResponse _$LichSuCaDayResponseFromJson(Map<String, dynamic> json) =>
    LichSuCaDayResponse(
      json['last_page'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => ItemLichSuCaDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LichSuCaDayResponseToJson(
        LichSuCaDayResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'last_page': instance.last_page,
      'data': instance.data,
    };
