// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chon_hoc_phi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemPhuCap _$ItemPhuCapFromJson(Map<String, dynamic> json) => ItemPhuCap(
      json['id'] as int?,
      json['tieu_De'] as String?,
      json['ghi_chu'] as String?,
      json['tong_tien'] as String?,
    );

Map<String, dynamic> _$ItemPhuCapToJson(ItemPhuCap instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tieu_De': instance.tieu_De,
      'ghi_chu': instance.ghi_chu,
      'tong_tien': instance.tong_tien,
    };

ItemLoaiGiaoVien _$ItemLoaiGiaoVienFromJson(Map<String, dynamic> json) =>
    ItemLoaiGiaoVien(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$ItemLoaiGiaoVienToJson(ItemLoaiGiaoVien instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ChonHocPhiData _$ChonHocPhiDataFromJson(Map<String, dynamic> json) =>
    ChonHocPhiData(
      (json['loaiGiaoVien'] as List<dynamic>?)
          ?.map((e) => ItemLoaiGiaoVien.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['anTrua'] as List<dynamic>?)
          ?.map((e) => ItemPhuCap.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['themGio'] as List<dynamic>?)
          ?.map((e) => ItemPhuCap.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChonHocPhiDataToJson(ChonHocPhiData instance) =>
    <String, dynamic>{
      'loaiGiaoVien': instance.loaiGiaoVien,
      'anTrua': instance.anTrua,
      'themGio': instance.themGio,
    };

ChonHocPhiResponse _$ChonHocPhiResponseFromJson(Map<String, dynamic> json) =>
    ChonHocPhiResponse(
      json['data'] == null
          ? null
          : ChonHocPhiData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChonHocPhiResponseToJson(ChonHocPhiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
