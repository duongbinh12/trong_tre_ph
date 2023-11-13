import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

import 'history_order_response.dart';

part 'danh_sach_dao_tao_response.g.dart';

@JsonSerializable()
class ItemDanhSachDaoTao {
  int? id;
  String? created,hocPhan;
  TrangThaiData? trang_thai;


  ItemDanhSachDaoTao(this.id, this.created, this.hocPhan, this.trang_thai);

  factory ItemDanhSachDaoTao.fromJson(Map<String, dynamic> json) =>
      _$ItemDanhSachDaoTaoFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDanhSachDaoTaoToJson(this);
}

@JsonSerializable()
class DanhSachDaoTaoResponse extends BaseResponse {
  int? last_page;
  List<ItemDanhSachDaoTao>? data;


  DanhSachDaoTaoResponse(this.last_page, this.data);

  factory DanhSachDaoTaoResponse.fromJson(Map<String, dynamic> json) =>
      _$DanhSachDaoTaoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DanhSachDaoTaoResponseToJson(this);
}
