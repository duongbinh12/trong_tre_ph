import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

import 'history_order_response.dart';
import 'thong_tin_giao_vien_response.dart';

part 'thong_tin_khoa_hoc_response.g.dart';

@JsonSerializable()
class TienDo {
  int? id,danh_gia,so_gio,buoi,tong_buoi;
  String? ngay_day,ca_day,nhan_xet_buoi_hoc,image,video,thoi_gian;
  TrangThaiData? trang_thai;

  TienDo(
      this.id,
      this.danh_gia,
      this.so_gio,
      this.buoi,
      this.ngay_day,
      this.ca_day,
      this.nhan_xet_buoi_hoc,
      this.trang_thai,
      this.image,
      this.video,
      this.tong_buoi,
      this.thoi_gian);

  factory TienDo.fromJson(Map<String, dynamic> json) =>
      _$TienDoFromJson(json);

  Map<String, dynamic> toJson() => _$TienDoToJson(this);
}

@JsonSerializable()
class ThongTinKhoaHocData {
  int? id,so_gio;
  String? ma_don_hang,dichVu,soBuoiHoanThanh,tong_tien,trang_thai_thanh_toan,lich_hoc,thoi_gian,chonCa,dia_chi,noi_dung_khao_sat;
  GiaoVien? giaoVien;
  GiaoVien? leaderKD;
  TienDo? tienDo;


  ThongTinKhoaHocData(
      this.id,
      this.ma_don_hang,
      this.dichVu,
      this.soBuoiHoanThanh,
      this.tong_tien,
      this.trang_thai_thanh_toan,
      this.lich_hoc,
      this.thoi_gian,
      this.chonCa,
      this.dia_chi,
      this.noi_dung_khao_sat,
      this.leaderKD,
      this.giaoVien,
      this.tienDo,this.so_gio);

  factory ThongTinKhoaHocData.fromJson(Map<String, dynamic> json) =>
      _$ThongTinKhoaHocDataFromJson(json);

  Map<String, dynamic> toJson() => _$ThongTinKhoaHocDataToJson(this);
}

@JsonSerializable()
class ThongTinKhoaHocResponse extends BaseResponse {
  ThongTinKhoaHocData? data;


  ThongTinKhoaHocResponse(this.data);

  factory ThongTinKhoaHocResponse.fromJson(Map<String, dynamic> json) =>
      _$ThongTinKhoaHocResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ThongTinKhoaHocResponseToJson(this);
}
