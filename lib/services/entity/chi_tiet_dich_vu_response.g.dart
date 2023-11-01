// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chi_tiet_dich_vu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemQuyenLoi _$ItemQuyenLoiFromJson(Map<String, dynamic> json) => ItemQuyenLoi(
      json['id'] as int?,
      json['name'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$ItemQuyenLoiToJson(ItemQuyenLoi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
    };

ChiTietDichVuData _$ChiTietDichVuDataFromJson(Map<String, dynamic> json) =>
    ChiTietDichVuData(
      json['id'] as int?,
      json['so_tien'] as int?,
      json['ten_dich_vu'] as String?,
      json['doTuoi'] as String?,
      json['gia_tri'] as String?,
      json['hop_dong_dich_vu'] as String?,
      (json['cam_ket'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['quyenLoi'] as List<dynamic>?)
          ?.map((e) => ItemQuyenLoi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChiTietDichVuDataToJson(ChiTietDichVuData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'so_tien': instance.so_tien,
      'ten_dich_vu': instance.ten_dich_vu,
      'doTuoi': instance.doTuoi,
      'gia_tri': instance.gia_tri,
      'hop_dong_dich_vu': instance.hop_dong_dich_vu,
      'cam_ket': instance.cam_ket,
      'quyenLoi': instance.quyenLoi,
    };

ChiTietDichVuResponse _$ChiTietDichVuResponseFromJson(
        Map<String, dynamic> json) =>
    ChiTietDichVuResponse(
      json['data'] == null
          ? null
          : ChiTietDichVuData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChiTietDichVuResponseToJson(
        ChiTietDichVuResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
