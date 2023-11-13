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
class ChuongTrinhHocData {
  int? id;
  String? tieu_de;
  List<ItemChuongTrinhHoc>? buoiHoc;


  ChuongTrinhHocData(this.id, this.tieu_de, this.buoiHoc);

  factory ChuongTrinhHocData.fromJson(Map<String, dynamic> json) =>
      _$ChuongTrinhHocDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChuongTrinhHocDataToJson(this);
}

@JsonSerializable()
class ChuongTrinhHocResponse extends BaseResponse {
  List<ChuongTrinhHocData>? data;


  ChuongTrinhHocResponse(this.data);

  factory ChuongTrinhHocResponse.fromJson(Map<String, dynamic> json) =>
      _$ChuongTrinhHocResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChuongTrinhHocResponseToJson(this);
}
