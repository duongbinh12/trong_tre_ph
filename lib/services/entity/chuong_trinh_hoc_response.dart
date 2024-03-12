import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'chuong_trinh_hoc_response.g.dart';

@JsonSerializable()
class ItemChuongTrinhHoc {
  int? id,buoi;
  String? noi_dung;


  ItemChuongTrinhHoc(this.id, this.buoi, this.noi_dung);

  factory ItemChuongTrinhHoc.fromJson(Map<String, dynamic> json) =>
      _$ItemChuongTrinhHocFromJson(json);

  Map<String, dynamic> toJson() => _$ItemChuongTrinhHocToJson(this);
}

@JsonSerializable()
class GiaoCuData {
  int? id;
  String? code,image;


  GiaoCuData(this.id, this.code, this.image);

  factory GiaoCuData.fromJson(Map<String, dynamic> json) =>
      _$GiaoCuDataFromJson(json);

  Map<String, dynamic> toJson() => _$GiaoCuDataToJson(this);
}

@JsonSerializable()
class ChuongTrinhHocData {
  int? id;
  String? tieu_de;
  List<ItemChuongTrinhHoc>? buoiHoc;
  List<GiaoCuData>? giaoCu;

  ChuongTrinhHocData(this.id, this.tieu_de, this.buoiHoc,this.giaoCu);

  factory ChuongTrinhHocData.fromJson(Map<String, dynamic> json) =>
      _$ChuongTrinhHocDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChuongTrinhHocDataToJson(this);
}

@JsonSerializable()
class GoiHocData extends BaseResponse {
  List<ChuongTrinhHocData>? goiHoc;
  String? ten_chuong_trinh,name;
  int? id;


  GoiHocData(this.goiHoc,this.id,this.ten_chuong_trinh,this.name);

  factory GoiHocData.fromJson(Map<String, dynamic> json) =>
      _$GoiHocDataFromJson(json);

  Map<String, dynamic> toJson() => _$GoiHocDataToJson(this);
}

@JsonSerializable()
class ChuongTrinhHocResponse extends BaseResponse {
  List<GoiHocData>? data;


  ChuongTrinhHocResponse(this.data);

  factory ChuongTrinhHocResponse.fromJson(Map<String, dynamic> json) =>
      _$ChuongTrinhHocResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChuongTrinhHocResponseToJson(this);
}
