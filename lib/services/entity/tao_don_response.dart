import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'tao_don_response.g.dart';

@JsonSerializable()
class TaoDonData {
  int? id;

  TaoDonData({this.id});

  factory TaoDonData.fromJson(Map<String, dynamic> json) =>
      _$TaoDonDataFromJson(json);

  Map<String, dynamic> toJson() => _$TaoDonDataToJson(this);
}

@JsonSerializable()
class TaoDonResponse extends BaseResponse{
  TaoDonData? data;


  TaoDonResponse(this.data);

  factory TaoDonResponse.fromJson(Map<String, dynamic> json) =>
      _$TaoDonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaoDonResponseToJson(this);
}
