import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'don_huy_response.g.dart';

@JsonSerializable()
class DonHuyData {
  int? id, so_gio;
  String? ma_don_hang,
      trang_thai,
      dichVu,
      soBuoiHoanThanh,
      tong_tien,
      trang_thai_thanh_toan,
      lich_hoc,
      thoi_gian,
      chonCa,
      dia_chi;


  DonHuyData(
      this.id,
      this.so_gio,
      this.ma_don_hang,
      this.trang_thai,
      this.dichVu,
      this.soBuoiHoanThanh,
      this.tong_tien,
      this.trang_thai_thanh_toan,
      this.lich_hoc,
      this.thoi_gian,
      this.chonCa,
      this.dia_chi);

  factory DonHuyData.fromJson(Map<String, dynamic> json) =>
      _$DonHuyDataFromJson(json);

  Map<String, dynamic> toJson() => _$DonHuyDataToJson(this);
}

@JsonSerializable()
class DonHuyResponse extends BaseResponse {
  DonHuyData? data;


  DonHuyResponse(this.data);

  factory DonHuyResponse.fromJson(Map<String, dynamic> json) =>
      _$DonHuyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DonHuyResponseToJson(this);
}
