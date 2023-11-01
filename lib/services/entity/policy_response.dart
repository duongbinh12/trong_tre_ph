import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'policy_response.g.dart';

@JsonSerializable()
class PolicyResponse extends BaseResponse {
  String? data;


  PolicyResponse(this.data);

  factory PolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PolicyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PolicyResponseToJson(this);
}
