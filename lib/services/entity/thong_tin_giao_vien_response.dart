import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'thong_tin_giao_vien_response.g.dart';

@JsonSerializable()
class GiaoVien {
  int? id;
  String? anh_nguoi_dung,danh_gia,hoten,trinh_do,dien_thoai;

  GiaoVien(this.id, this.anh_nguoi_dung, this.danh_gia, this.hoten,
      this.trinh_do, this.dien_thoai);

  factory GiaoVien.fromJson(Map<String, dynamic> json) =>
      _$GiaoVienFromJson(json);

  Map<String, dynamic> toJson() => _$GiaoVienToJson(this);
}

@JsonSerializable()
class ThongTinGiaoVienData {
  String? noi_dung_khao_sat;
  GiaoVien? giaoVien;
  GiaoVien? leaderKD;


  ThongTinGiaoVienData(this.noi_dung_khao_sat, this.leaderKD, this.giaoVien);

  factory ThongTinGiaoVienData.fromJson(Map<String, dynamic> json) =>
      _$ThongTinGiaoVienDataFromJson(json);

  Map<String, dynamic> toJson() => _$ThongTinGiaoVienDataToJson(this);
}

@JsonSerializable()
class ThongTinGiaoVienResponse extends BaseResponse{
  ThongTinGiaoVienData? data;


  ThongTinGiaoVienResponse(this.data);

  factory ThongTinGiaoVienResponse.fromJson(Map<String, dynamic> json) =>
      _$ThongTinGiaoVienResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ThongTinGiaoVienResponseToJson(this);
}
