import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'chi_tiet_dich_vu_response.g.dart';

@JsonSerializable()
class ItemQuyenLoi {
  int? id;
  String? name,link;


  ItemQuyenLoi(this.id, this.name, this.link);

  factory ItemQuyenLoi.fromJson(Map<String, dynamic> json) =>
      _$ItemQuyenLoiFromJson(json);

  Map<String, dynamic> toJson() => _$ItemQuyenLoiToJson(this);
}

@JsonSerializable()
class ChiTietDichVuData {
  int? id,so_tien;
  String? ten_dich_vu,doTuoi,gia_tri,hop_dong_dich_vu;
  List<String>? cam_ket;
  List<ItemQuyenLoi>? quyenLoi;


  ChiTietDichVuData(this.id, this.so_tien, this.ten_dich_vu, this.doTuoi,
      this.gia_tri, this.hop_dong_dich_vu, this.cam_ket, this.quyenLoi);

  factory ChiTietDichVuData.fromJson(Map<String, dynamic> json) =>
      _$ChiTietDichVuDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChiTietDichVuDataToJson(this);
}

@JsonSerializable()
class ChiTietDichVuResponse extends BaseResponse {
  ChiTietDichVuData? data;


  ChiTietDichVuResponse(this.data);

  factory ChiTietDichVuResponse.fromJson(Map<String, dynamic> json) =>
      _$ChiTietDichVuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChiTietDichVuResponseToJson(this);
}
