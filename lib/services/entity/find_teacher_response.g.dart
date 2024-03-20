// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_teacher_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindTeacherData _$FindTeacherDataFromJson(Map<String, dynamic> json) =>
    FindTeacherData(
      json['id'] as int?,
      json['ma_don_hang'] as String?,
      json['trang_thai'] == null
          ? null
          : TrangThaiData.fromJson(json['trang_thai'] as Map<String, dynamic>),
      json['dichVu'] as String?,
      json['soBuoiHoanThanh'] as String?,
      json['tong_tien'] as String?,
      json['trang_thai_thanh_toan'] as String?,
      json['lich_hoc'] as String?,
      json['thoi_gian'] as String?,
      json['chonCa'] as String?,
      json['dia_chi'] as String?,
      json['so_gio'] as int?,
      json['leaderKD'] == null
          ? null
          : GiaoVien.fromJson(json['leaderKD'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FindTeacherDataToJson(FindTeacherData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ma_don_hang': instance.ma_don_hang,
      'dichVu': instance.dichVu,
      'soBuoiHoanThanh': instance.soBuoiHoanThanh,
      'tong_tien': instance.tong_tien,
      'trang_thai_thanh_toan': instance.trang_thai_thanh_toan,
      'lich_hoc': instance.lich_hoc,
      'thoi_gian': instance.thoi_gian,
      'chonCa': instance.chonCa,
      'dia_chi': instance.dia_chi,
      'so_gio': instance.so_gio,
      'leaderKD': instance.leaderKD,
      'trang_thai': instance.trang_thai,
    };

FindTeacherResponse _$FindTeacherResponseFromJson(Map<String, dynamic> json) =>
    FindTeacherResponse(
      json['data'] == null
          ? null
          : FindTeacherData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$FindTeacherResponseToJson(
        FindTeacherResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
