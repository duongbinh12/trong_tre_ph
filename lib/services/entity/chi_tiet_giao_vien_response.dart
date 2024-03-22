import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'chi_tiet_giao_vien_response.g.dart';

@JsonSerializable()
class ChiTietGiaoVienData {
  int? id;
  String? anh_nguoi_dung,danh_gia,hoten,trinh_do,dien_thoai,ngay_sinh;
  BangCapData? bang_cap;
  List<String>? chung_chi;

  ChiTietGiaoVienData(this.id, this.anh_nguoi_dung, this.danh_gia, this.hoten,
      this.trinh_do, this.dien_thoai, this.ngay_sinh, this.bang_cap,this.chung_chi);

  factory ChiTietGiaoVienData.fromJson(Map<String, dynamic> json) =>
      _$ChiTietGiaoVienDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChiTietGiaoVienDataToJson(this);
}

@JsonSerializable()
class BangCapData {
  String? trinh_do,chuyen_nganh,truong_dao_tao;


  BangCapData(this.trinh_do, this.chuyen_nganh, this.truong_dao_tao);

  factory BangCapData.fromJson(Map<String, dynamic> json) =>
      _$BangCapDataFromJson(json);

  Map<String, dynamic> toJson() => _$BangCapDataToJson(this);
}

@JsonSerializable()
class ChiTietGiaoVienResponse extends BaseResponse {
  ChiTietGiaoVienData? data;


  ChiTietGiaoVienResponse(this.data);

  factory ChiTietGiaoVienResponse.fromJson(Map<String, dynamic> json) =>
      _$ChiTietGiaoVienResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChiTietGiaoVienResponseToJson(this);
}
