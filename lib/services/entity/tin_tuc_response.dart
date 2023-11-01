import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'tin_tuc_response.g.dart';

@JsonSerializable()
class ItemNews {
  int? id;
  String? tieu_de,noi_dung,anh_dai_dien,date;


  ItemNews(this.id, this.tieu_de, this.noi_dung, this.anh_dai_dien, this.date);

  factory ItemNews.fromJson(Map<String, dynamic> json) =>
      _$ItemNewsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemNewsToJson(this);
}

@JsonSerializable()
class TinTucData {
  List<ItemNews>? tinTuc;


  TinTucData(this.tinTuc);

  factory TinTucData.fromJson(Map<String, dynamic> json) =>
      _$TinTucDataFromJson(json);

  Map<String, dynamic> toJson() => _$TinTucDataToJson(this);
}

@JsonSerializable()
class TinTucResponse extends BaseResponse{
  TinTucData? data;
  int? last_page;


  TinTucResponse(this.data, this.last_page);

  factory TinTucResponse.fromJson(Map<String, dynamic> json) =>
      _$TinTucResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TinTucResponseToJson(this);
}
