import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';
part 'hoa_don_response.g.dart';

@JsonSerializable()
class HoaDonResponse extends BaseResponse {
  int? data;


  HoaDonResponse(this.data);

  factory HoaDonResponse.fromJson(Map<String, dynamic> json) =>
      _$HoaDonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HoaDonResponseToJson(this);
}