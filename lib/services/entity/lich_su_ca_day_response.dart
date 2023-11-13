import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'lich_su_ca_day_response.g.dart';

@JsonSerializable()
class ItemLichSuCaDay {
  int? id;
  String? ma_don_hang,created,trang_thai,dichVu,soBuoiHoanThanh,noi_dung_danh_gia;


  ItemLichSuCaDay(this.id, this.ma_don_hang, this.created, this.trang_thai,
      this.dichVu, this.soBuoiHoanThanh, this.noi_dung_danh_gia);

  factory ItemLichSuCaDay.fromJson(Map<String, dynamic> json) =>
      _$ItemLichSuCaDayFromJson(json);

  Map<String, dynamic> toJson() => _$ItemLichSuCaDayToJson(this);
}

@JsonSerializable()
class LichSuCaDayResponse extends BaseResponse {
  int? last_page;
  List<ItemLichSuCaDay>? data;


  LichSuCaDayResponse(this.last_page, this.data);

  factory LichSuCaDayResponse.fromJson(Map<String, dynamic> json) =>
      _$LichSuCaDayResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LichSuCaDayResponseToJson(this);
}
