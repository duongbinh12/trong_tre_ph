import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'thong_bao_response.g.dart';

@JsonSerializable()
class ItemThongBao {
  int? id;
  String? noi_dung,image,created,tieu_de;


  ItemThongBao(this.id, this.noi_dung, this.image, this.created, this.tieu_de);

  factory ItemThongBao.fromJson(Map<String, dynamic> json) =>
      _$ItemThongBaoFromJson(json);

  Map<String, dynamic> toJson() => _$ItemThongBaoToJson(this);
}

@JsonSerializable()
class ItemTypeThongBao {
  int? id;
  String? name;


  ItemTypeThongBao(this.id, this.name);

  factory ItemTypeThongBao.fromJson(Map<String, dynamic> json) =>
      _$ItemTypeThongBaoFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTypeThongBaoToJson(this);
}

@JsonSerializable()
class ItemThongBaoData {
  List<ItemThongBao>? data;
  String? date;


  ItemThongBaoData(this.data, this.date);

  factory ItemThongBaoData.fromJson(Map<String, dynamic> json) =>
      _$ItemThongBaoDataFromJson(json);

  Map<String, dynamic> toJson() => _$ItemThongBaoDataToJson(this);
}

@JsonSerializable()
class ThongBaoData {
  List<ItemThongBaoData>? thong_bao;
  List<ItemTypeThongBao>? type;


  ThongBaoData(this.thong_bao, this.type);

  factory ThongBaoData.fromJson(Map<String, dynamic> json) =>
      _$ThongBaoDataFromJson(json);

  Map<String, dynamic> toJson() => _$ThongBaoDataToJson(this);
}

@JsonSerializable()
class ThongBaoResponse extends BaseResponse{
  ThongBaoData? data;
  int? last_page;


  ThongBaoResponse(this.data, this.last_page);

  factory ThongBaoResponse.fromJson(Map<String, dynamic> json) =>
      _$ThongBaoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ThongBaoResponseToJson(this);
}
