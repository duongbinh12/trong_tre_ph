import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'setting_response.g.dart';

@JsonSerializable()
class LienHeData {
  String? image,donViChuQuan,truSo,website,hotline,email;


  LienHeData(this.image, this.donViChuQuan, this.truSo,this.website, this.hotline,
      this.email);

  factory LienHeData.fromJson(Map<String, dynamic> json) =>
      _$LienHeDataFromJson(json);

  Map<String, dynamic> toJson() => _$LienHeDataToJson(this);
}

@JsonSerializable()
class LienHeResponse extends BaseResponse{
  LienHeData? data;


  LienHeResponse(this.data);

  factory LienHeResponse.fromJson(Map<String, dynamic> json) =>
      _$LienHeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LienHeResponseToJson(this);
}

@JsonSerializable()
class GioiThieuData {
  String? title,content,image;


  GioiThieuData(this.title, this.content,this.image);

  factory GioiThieuData.fromJson(Map<String, dynamic> json) =>
      _$GioiThieuDataFromJson(json);

  Map<String, dynamic> toJson() => _$GioiThieuDataToJson(this);
}


@JsonSerializable()
class GioiThieuResponse extends BaseResponse{
  GioiThieuData? data;


  GioiThieuResponse(this.data);

  factory GioiThieuResponse.fromJson(Map<String, dynamic> json) =>
      _$GioiThieuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GioiThieuResponseToJson(this);
}


@JsonSerializable()
class HeSinhThaiResponse extends BaseResponse{
  GioiThieuData? data;


  HeSinhThaiResponse(this.data);

  factory HeSinhThaiResponse.fromJson(Map<String, dynamic> json) =>
      _$HeSinhThaiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HeSinhThaiResponseToJson(this);
}