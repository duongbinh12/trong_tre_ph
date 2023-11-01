// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDichVu _$ItemDichVuFromJson(Map<String, dynamic> json) => ItemDichVu(
      json['id'] as int?,
      json['ten_dich_vu'] as String?,
      json['image'] as String?,
      json['khoa_dich_vu'] as int?,
    );

Map<String, dynamic> _$ItemDichVuToJson(ItemDichVu instance) =>
    <String, dynamic>{
      'id': instance.id,
      'khoa_dich_vu': instance.khoa_dich_vu,
      'ten_dich_vu': instance.ten_dich_vu,
      'image': instance.image,
    };

ItemTinTuc _$ItemTinTucFromJson(Map<String, dynamic> json) => ItemTinTuc(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$ItemTinTucToJson(ItemTinTuc instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ItemBanner _$ItemBannerFromJson(Map<String, dynamic> json) => ItemBanner(
      json['id'] as int?,
      json['link'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$ItemBannerToJson(ItemBanner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'image': instance.image,
    };

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
      (json['dichVu'] as List<dynamic>?)
          ?.map((e) => ItemDichVu.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['tinTuc'] as List<dynamic>?)
          ?.map((e) => ItemTinTuc.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['banner'] as List<dynamic>?)
          ?.map((e) => ItemBanner.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'dichVu': instance.dichVu,
      'tinTuc': instance.tinTuc,
      'banner': instance.banner,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      json['data'] == null
          ? null
          : HomeData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
