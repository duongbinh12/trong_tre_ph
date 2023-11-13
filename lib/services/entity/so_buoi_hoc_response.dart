import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'so_buoi_hoc_response.g.dart';

@JsonSerializable()
class ItemSoBuoiHoc {
  int? id,so_buoi,khuyen_mai;
  String? tong_tien,thanh_tien;


  ItemSoBuoiHoc(
      this.id, this.so_buoi, this.khuyen_mai, this.tong_tien, this.thanh_tien);

  factory ItemSoBuoiHoc.fromJson(Map<String, dynamic> json) =>
      _$ItemSoBuoiHocFromJson(json);

  Map<String, dynamic> toJson() => _$ItemSoBuoiHocToJson(this);
}

@JsonSerializable()
class SoBuoiHocResponse extends BaseResponse {
  List<ItemSoBuoiHoc>? data;
  int? last_page;


  SoBuoiHocResponse(this.data, this.last_page);

  factory SoBuoiHocResponse.fromJson(Map<String, dynamic> json) =>
      _$SoBuoiHocResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SoBuoiHocResponseToJson(this);
}
