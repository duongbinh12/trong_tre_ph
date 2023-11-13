import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

import 'thong_tin_giao_vien_response.dart';
import 'thong_tin_khoa_hoc_response.dart';

part 'chi_tiet_nx_response.g.dart';

@JsonSerializable()
class ItemDanhGia {
  int? id;
  String? tieu_de,muc_do_da_cho,noi_dung_nhan_xet;
  List<String>? muc_do,goi_y;
  bool? nhan_xet;
  List<ItemCacBuoi>? cac_buoi;


  ItemDanhGia(this.id, this.tieu_de, this.muc_do_da_cho, this.noi_dung_nhan_xet,
      this.muc_do, this.goi_y, this.nhan_xet, this.cac_buoi);

  factory ItemDanhGia.fromJson(Map<String, dynamic> json) =>
      _$ItemDanhGiaFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDanhGiaToJson(this);
}

@JsonSerializable()
class ItemCacBuoi {
  int? id;
  String? tieu_de,muc_do_da_cho,noi_dung_nhan_xet;
  List<String>? muc_do,goi_y;
  bool? nhan_xet;


  ItemCacBuoi(this.id, this.tieu_de, this.muc_do_da_cho, this.noi_dung_nhan_xet,
      this.muc_do, this.goi_y, this.nhan_xet);

  factory ItemCacBuoi.fromJson(Map<String, dynamic> json) =>
      _$ItemCacBuoiFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCacBuoiToJson(this);
}

@JsonSerializable()
class FormDanhGiaData {
  List<ItemDanhGia>? data;
  String? danhMuc;


  FormDanhGiaData(this.data, this.danhMuc);

  factory FormDanhGiaData.fromJson(Map<String, dynamic> json) =>
      _$FormDanhGiaDataFromJson(json);

  Map<String, dynamic> toJson() => _$FormDanhGiaDataToJson(this);
}

@JsonSerializable()
class ChiTietNXData {
  int? id;
  String? ma_don_hang;
  GiaoVien? giaoVien;
  TienDo? tienDo;
  List<FormDanhGiaData>? formDanhGia;


  ChiTietNXData(
      this.id, this.ma_don_hang, this.giaoVien, this.tienDo, this.formDanhGia);

  factory ChiTietNXData.fromJson(Map<String, dynamic> json) =>
      _$ChiTietNXDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChiTietNXDataToJson(this);
}

@JsonSerializable()
class ChiTietNXResponse extends BaseResponse {
  ChiTietNXData? data;


  ChiTietNXResponse(this.data);

  factory ChiTietNXResponse.fromJson(Map<String, dynamic> json) =>
      _$ChiTietNXResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChiTietNXResponseToJson(this);
}
