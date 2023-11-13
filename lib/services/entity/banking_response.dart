import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'banking_response.g.dart';

@JsonSerializable()
class BankingData {
  String? img,ghiChu;


  BankingData(this.img, this.ghiChu);

  factory BankingData.fromJson(Map<String, dynamic> json) =>
      _$BankingDataFromJson(json);

  Map<String, dynamic> toJson() => _$BankingDataToJson(this);
}

@JsonSerializable()
class BankingResponse extends BaseResponse{
  BankingData? data;


  BankingResponse(this.data);

  factory BankingResponse.fromJson(Map<String, dynamic> json) =>
      _$BankingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BankingResponseToJson(this);
}
