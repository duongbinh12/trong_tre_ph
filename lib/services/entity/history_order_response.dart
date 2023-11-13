import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'history_order_response.g.dart';

@JsonSerializable()
class ItemHistoryOrder {
  int? id;
  String? ma_don_hang,created,soBuoiHoanThanh,dichVu,chonCa,thoi_gian;
  TrangThaiData? trang_thai;

  ItemHistoryOrder(this.id, this.ma_don_hang, this.created, this.trang_thai,
      this.soBuoiHoanThanh, this.dichVu, this.chonCa, this.thoi_gian);

  factory ItemHistoryOrder.fromJson(Map<String, dynamic> json) =>
      _$ItemHistoryOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ItemHistoryOrderToJson(this);
}

@JsonSerializable()
class TrangThaiData {
  int? id;
  String? name;


  TrangThaiData(this.id, this.name);

  factory TrangThaiData.fromJson(Map<String, dynamic> json) =>
      _$TrangThaiDataFromJson(json);

  Map<String, dynamic> toJson() => _$TrangThaiDataToJson(this);
}

@JsonSerializable()
class HistoryOrderResponse extends BaseResponse {
  List<ItemHistoryOrder>? data;
  int? last_page;


  HistoryOrderResponse(this.data, this.last_page);

  factory HistoryOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryOrderResponseToJson(this);
}
