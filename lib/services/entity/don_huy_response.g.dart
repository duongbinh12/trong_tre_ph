// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'don_huy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonHuyData _$DonHuyDataFromJson(Map<String, dynamic> json) => DonHuyData(
      json['id'] as int?,
      json['so_gio'] as int?,
      json['ma_don_hang'] as String?,
      json['trang_thai'] as String?,
      json['dichVu'] as String?,
      json['soBuoiHoanThanh'] as String?,
      json['tong_tien'] as String?,
      json['trang_thai_thanh_toan'] as String?,
      json['lich_hoc'] as String?,
      json['thoi_gian'] as String?,
      json['chonCa'] as String?,
      json['dia_chi'] as String?,
    );

Map<String, dynamic> _$DonHuyDataToJson(DonHuyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'so_gio': instance.so_gio,
      'ma_don_hang': instance.ma_don_hang,
      'trang_thai': instance.trang_thai,
      'dichVu': instance.dichVu,
      'soBuoiHoanThanh': instance.soBuoiHoanThanh,
      'tong_tien': instance.tong_tien,
      'trang_thai_thanh_toan': instance.trang_thai_thanh_toan,
      'lich_hoc': instance.lich_hoc,
      'thoi_gian': instance.thoi_gian,
      'chonCa': instance.chonCa,
      'dia_chi': instance.dia_chi,
    };

DonHuyResponse _$DonHuyResponseFromJson(Map<String, dynamic> json) =>
    DonHuyResponse(
      json['data'] == null
          ? null
          : DonHuyData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$DonHuyResponseToJson(DonHuyResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
