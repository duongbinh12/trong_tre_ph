import 'package:json_annotation/json_annotation.dart';
import 'package:trong_tre/services/entity/base_response.dart';

part 'home_response.g.dart';

@JsonSerializable()
class ItemDichVu {
  int? id,khoa_dich_vu;
  String? ten_dich_vu,image;


  ItemDichVu(this.id, this.ten_dich_vu, this.image,this.khoa_dich_vu);

  factory ItemDichVu.fromJson(Map<String, dynamic> json) =>
      _$ItemDichVuFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDichVuToJson(this);
}

@JsonSerializable()
class ItemTinTuc {
  int? id;
  String? name;


  ItemTinTuc(this.id, this.name);

  factory ItemTinTuc.fromJson(Map<String, dynamic> json) =>
      _$ItemTinTucFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTinTucToJson(this);
}

@JsonSerializable()
class ItemBanner {
  int? id;
  String? link,image;


  ItemBanner(this.id, this.link, this.image);

  factory ItemBanner.fromJson(Map<String, dynamic> json) =>
      _$ItemBannerFromJson(json);

  Map<String, dynamic> toJson() => _$ItemBannerToJson(this);
}

@JsonSerializable()
class HomeData {
  List<ItemDichVu>? dichVu;
  List<ItemTinTuc>? tinTuc;
  List<ItemBanner>? banner;

  HomeData(this.dichVu, this.tinTuc,this.banner);

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}

@JsonSerializable()
class HomeResponse extends BaseResponse {
  HomeData? data;


  HomeResponse(this.data);

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
