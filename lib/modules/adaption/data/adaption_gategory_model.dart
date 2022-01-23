import 'dart:convert';
AdaptionGategoryModel adaptionGategoryModelFromJson(String str) => AdaptionGategoryModel.fromJson(json.decode(str));
String adaptionGategoryModelToJson(AdaptionGategoryModel data) => json.encode(data.toJson());
class AdaptionGategoryModel {
  AdaptionGategoryModel({
      this.id, 
      this.name, 
      this.photo,});

  AdaptionGategoryModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
  }
  int? id;
  String? name;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['photo'] = photo;
    return map;
  }

}