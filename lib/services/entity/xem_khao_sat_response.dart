import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'xem_khao_sat_response.g.dart';

@JsonSerializable()
class XemKhaoSatResponse extends BaseResponse{
  String? data;


  XemKhaoSatResponse(this.data);

  factory XemKhaoSatResponse.fromJson(Map<String, dynamic> json) =>
      _$XemKhaoSatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$XemKhaoSatResponseToJson(this);
}
