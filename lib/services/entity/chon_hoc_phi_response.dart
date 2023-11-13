import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'chon_hoc_phi_response.g.dart';

@JsonSerializable()
class ItemPhuCap {
  int? id;
  String? tieu_De,ghi_chu,tong_tien;


  ItemPhuCap(this.id, this.tieu_De, this.ghi_chu, this.tong_tien);

  factory ItemPhuCap.fromJson(Map<String, dynamic> json) =>
      _$ItemPhuCapFromJson(json);

  Map<String, dynamic> toJson() => _$ItemPhuCapToJson(this);
}

@JsonSerializable()
class ItemLoaiGiaoVien {
  int? id;
  String? name;


  ItemLoaiGiaoVien(this.id, this.name);

  factory ItemLoaiGiaoVien.fromJson(Map<String, dynamic> json) =>
      _$ItemLoaiGiaoVienFromJson(json);

  Map<String, dynamic> toJson() => _$ItemLoaiGiaoVienToJson(this);
}

@JsonSerializable()
class ChonHocPhiData {
  List<ItemLoaiGiaoVien>? loaiGiaoVien;
  List<ItemPhuCap>? anTrua,themGio;


  ChonHocPhiData(this.loaiGiaoVien, this.anTrua, this.themGio);

  factory ChonHocPhiData.fromJson(Map<String, dynamic> json) =>
      _$ChonHocPhiDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChonHocPhiDataToJson(this);
}

@JsonSerializable()
class ChonHocPhiResponse extends BaseResponse {
  ChonHocPhiData? data;


  ChonHocPhiResponse(this.data);

  factory ChonHocPhiResponse.fromJson(Map<String, dynamic> json) =>
      _$ChonHocPhiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChonHocPhiResponseToJson(this);
}
