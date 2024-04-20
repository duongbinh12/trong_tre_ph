// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chi_tiet_nx_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDanhGia _$ItemDanhGiaFromJson(Map<String, dynamic> json) => ItemDanhGia(
      json['id'] as int?,
      json['tieu_de'] as String?,
      json['muc_do_da_cho'] as String?,
      json['noi_dung_nhan_xet'] as String?,
      (json['muc_do'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['goi_y'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['nhan_xet'] as bool?,
      (json['cac_buoi'] as List<dynamic>?)
          ?.map((e) => ItemCacBuoi.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['type'] as int?,
    );

Map<String, dynamic> _$ItemDanhGiaToJson(ItemDanhGia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'tieu_de': instance.tieu_de,
      'muc_do_da_cho': instance.muc_do_da_cho,
      'noi_dung_nhan_xet': instance.noi_dung_nhan_xet,
      'muc_do': instance.muc_do,
      'goi_y': instance.goi_y,
      'nhan_xet': instance.nhan_xet,
      'cac_buoi': instance.cac_buoi,
    };

ItemCacBuoi _$ItemCacBuoiFromJson(Map<String, dynamic> json) => ItemCacBuoi(
      json['id'] as int?,
      json['tieu_de'] as String?,
      json['muc_do_da_cho'] as String?,
      json['noi_dung_nhan_xet'] as String?,
      (json['muc_do'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['goi_y'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['nhan_xet'] as bool?,
    );

Map<String, dynamic> _$ItemCacBuoiToJson(ItemCacBuoi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tieu_de': instance.tieu_de,
      'muc_do_da_cho': instance.muc_do_da_cho,
      'noi_dung_nhan_xet': instance.noi_dung_nhan_xet,
      'muc_do': instance.muc_do,
      'goi_y': instance.goi_y,
      'nhan_xet': instance.nhan_xet,
    };

FormDanhGiaData _$FormDanhGiaDataFromJson(Map<String, dynamic> json) =>
    FormDanhGiaData(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ItemDanhGia.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['danhMuc'] as String?,
    );

Map<String, dynamic> _$FormDanhGiaDataToJson(FormDanhGiaData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'danhMuc': instance.danhMuc,
    };

ChiTietNXData _$ChiTietNXDataFromJson(Map<String, dynamic> json) =>
    ChiTietNXData(
      json['id'] as int?,
      json['ma_don_hang'] as String?,
      json['giaoVien'] == null
          ? null
          : GiaoVien.fromJson(json['giaoVien'] as Map<String, dynamic>),
      json['tienDo'] == null
          ? null
          : TienDo.fromJson(json['tienDo'] as Map<String, dynamic>),
      (json['formDanhGia'] as List<dynamic>?)
          ?.map((e) => FormDanhGiaData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChiTietNXDataToJson(ChiTietNXData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ma_don_hang': instance.ma_don_hang,
      'giaoVien': instance.giaoVien,
      'tienDo': instance.tienDo,
      'formDanhGia': instance.formDanhGia,
    };

ChiTietNXResponse _$ChiTietNXResponseFromJson(Map<String, dynamic> json) =>
    ChiTietNXResponse(
      json['data'] == null
          ? null
          : ChiTietNXData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChiTietNXResponseToJson(ChiTietNXResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
