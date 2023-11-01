import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'get_ca_response.g.dart';

@JsonSerializable()
class ItemCa {
  int? id;
  String? name;


  ItemCa(this.id, this.name);

  factory ItemCa.fromJson(Map<String, dynamic> json) =>
      _$ItemCaFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCaToJson(this);
}

@JsonSerializable()
class ItemKhungGio {
  int? id;
  String? khung_gio,noi_dung;


  ItemKhungGio(this.id, this.khung_gio, this.noi_dung);

  factory ItemKhungGio.fromJson(Map<String, dynamic> json) =>
      _$ItemKhungGioFromJson(json);

  Map<String, dynamic> toJson() => _$ItemKhungGioToJson(this);
}

@JsonSerializable()
class GetCaResponse extends BaseResponse {
  List<ItemCa>? data;


  GetCaResponse(this.data);

  factory GetCaResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCaResponseToJson(this);
}

@JsonSerializable()
class KhungGioResponse extends BaseResponse {
  List<ItemKhungGio>? data;


  KhungGioResponse(this.data);

  factory KhungGioResponse.fromJson(Map<String, dynamic> json) =>
      _$KhungGioResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KhungGioResponseToJson(this);
}
