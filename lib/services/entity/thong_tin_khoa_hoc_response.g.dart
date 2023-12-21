// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thong_tin_khoa_hoc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TienDo _$TienDoFromJson(Map<String, dynamic> json) => TienDo(
      json['id'] as int?,
      json['danh_gia'] as int?,
      json['so_gio'] as int?,
      json['buoi'] as int?,
      json['ngay_day'] as String?,
      json['ca_day'] as String?,
      json['nhan_xet_buoi_hoc'] as String?,
      json['trang_thai'] == null
          ? null
          : TrangThaiData.fromJson(json['trang_thai'] as Map<String, dynamic>),
      json['image'] as String?,
      json['video'] as String?,
      json['tong_buoi'] as int?,
      json['thoi_gian'] as String?,
    );

Map<String, dynamic> _$TienDoToJson(TienDo instance) => <String, dynamic>{
      'id': instance.id,
      'danh_gia': instance.danh_gia,
      'so_gio': instance.so_gio,
      'buoi': instance.buoi,
      'tong_buoi': instance.tong_buoi,
      'ngay_day': instance.ngay_day,
      'ca_day': instance.ca_day,
      'nhan_xet_buoi_hoc': instance.nhan_xet_buoi_hoc,
      'image': instance.image,
      'video': instance.video,
      'thoi_gian': instance.thoi_gian,
      'trang_thai': instance.trang_thai,
    };

ThongTinKhoaHocData _$ThongTinKhoaHocDataFromJson(Map<String, dynamic> json) =>
    ThongTinKhoaHocData(
      json['id'] as int?,
      json['ma_don_hang'] as String?,
      json['dichVu'] as String?,
      json['soBuoiHoanThanh'] as String?,
      json['tong_tien'] as String?,
      json['trang_thai_thanh_toan'] as String?,
      json['lich_hoc'] as String?,
      json['thoi_gian'] as String?,
      json['chonCa'] as String?,
      json['dia_chi'] as String?,
      json['noi_dung_khao_sat'] as String?,
      json['leaderKD'] == null
          ? null
          : GiaoVien.fromJson(json['leaderKD'] as Map<String, dynamic>),
      json['giaoVien'] == null
          ? null
          : GiaoVien.fromJson(json['giaoVien'] as Map<String, dynamic>),
      json['tienDo'] == null
          ? null
          : TienDo.fromJson(json['tienDo'] as Map<String, dynamic>),
      json['so_gio'] as int?,
    );

Map<String, dynamic> _$ThongTinKhoaHocDataToJson(
        ThongTinKhoaHocData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'so_gio': instance.so_gio,
      'ma_don_hang': instance.ma_don_hang,
      'dichVu': instance.dichVu,
      'soBuoiHoanThanh': instance.soBuoiHoanThanh,
      'tong_tien': instance.tong_tien,
      'trang_thai_thanh_toan': instance.trang_thai_thanh_toan,
      'lich_hoc': instance.lich_hoc,
      'thoi_gian': instance.thoi_gian,
      'chonCa': instance.chonCa,
      'dia_chi': instance.dia_chi,
      'noi_dung_khao_sat': instance.noi_dung_khao_sat,
      'giaoVien': instance.giaoVien,
      'leaderKD': instance.leaderKD,
      'tienDo': instance.tienDo,
    };

ThongTinKhoaHocResponse _$ThongTinKhoaHocResponseFromJson(
        Map<String, dynamic> json) =>
    ThongTinKhoaHocResponse(
      json['data'] == null
          ? null
          : ThongTinKhoaHocData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ThongTinKhoaHocResponseToJson(
        ThongTinKhoaHocResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
