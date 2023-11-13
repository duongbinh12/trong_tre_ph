// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemHistoryOrder _$ItemHistoryOrderFromJson(Map<String, dynamic> json) =>
    ItemHistoryOrder(
      json['id'] as int?,
      json['ma_don_hang'] as String?,
      json['created'] as String?,
      json['trang_thai'] == null
          ? null
          : TrangThaiData.fromJson(json['trang_thai'] as Map<String, dynamic>),
      json['soBuoiHoanThanh'] as String?,
      json['dichVu'] as String?,
      json['chonCa'] as String?,
      json['thoi_gian'] as String?,
    );

Map<String, dynamic> _$ItemHistoryOrderToJson(ItemHistoryOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ma_don_hang': instance.ma_don_hang,
      'created': instance.created,
      'soBuoiHoanThanh': instance.soBuoiHoanThanh,
      'dichVu': instance.dichVu,
      'chonCa': instance.chonCa,
      'thoi_gian': instance.thoi_gian,
      'trang_thai': instance.trang_thai,
    };

TrangThaiData _$TrangThaiDataFromJson(Map<String, dynamic> json) =>
    TrangThaiData(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$TrangThaiDataToJson(TrangThaiData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

HistoryOrderResponse _$HistoryOrderResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryOrderResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ItemHistoryOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['last_page'] as int?,
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HistoryOrderResponseToJson(
        HistoryOrderResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'last_page': instance.last_page,
    };
