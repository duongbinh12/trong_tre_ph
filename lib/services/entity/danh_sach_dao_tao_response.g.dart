// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'danh_sach_dao_tao_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDanhSachDaoTao _$ItemDanhSachDaoTaoFromJson(Map<String, dynamic> json) =>
    ItemDanhSachDaoTao(
      json['id'] as int?,
      json['created'] as String?,
      json['hocPhan'] as String?,
      json['trang_thai'] == null
          ? null
          : TrangThaiData.fromJson(json['trang_thai'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemDanhSachDaoTaoToJson(ItemDanhSachDaoTao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'hocPhan': instance.hocPhan,
      'trang_thai': instance.trang_thai,
    };

DanhSachDaoTaoResponse _$DanhSachDaoTaoResponseFromJson(
        Map<String, dynamic> json) =>
    DanhSachDaoTaoResponse(
      json['last_page'] as int?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => ItemDanhSachDaoTao.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$DanhSachDaoTaoResponseToJson(
        DanhSachDaoTaoResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'last_page': instance.last_page,
      'data': instance.data,
    };
