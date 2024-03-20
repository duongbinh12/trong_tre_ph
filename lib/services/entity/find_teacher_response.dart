import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

import 'history_order_response.dart';
import 'thong_tin_giao_vien_response.dart';

part 'find_teacher_response.g.dart';

@JsonSerializable()
class FindTeacherData {
  int? id;
  String? ma_don_hang,dichVu,soBuoiHoanThanh,tong_tien,trang_thai_thanh_toan,lich_hoc,thoi_gian,chonCa,dia_chi;
  int? so_gio;
  GiaoVien? leaderKD;
  TrangThaiData? trang_thai;

  FindTeacherData(
      this.id,
      this.ma_don_hang,
      this.trang_thai,
      this.dichVu,
      this.soBuoiHoanThanh,
      this.tong_tien,
      this.trang_thai_thanh_toan,
      this.lich_hoc,
      this.thoi_gian,
      this.chonCa,
      this.dia_chi,
      this.so_gio,this.leaderKD);

  factory FindTeacherData.fromJson(Map<String, dynamic> json) =>
      _$FindTeacherDataFromJson(json);

  Map<String, dynamic> toJson() => _$FindTeacherDataToJson(this);
}

@JsonSerializable()
class FindTeacherResponse extends BaseResponse {
  FindTeacherData? data;


  FindTeacherResponse(this.data);

  factory FindTeacherResponse.fromJson(Map<String, dynamic> json) =>
      _$FindTeacherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FindTeacherResponseToJson(this);
}
