import 'dart:convert';
AdoptionCategoriesModel adoptionCategoriesModelFromJson(String str) => AdoptionCategoriesModel.fromJson(json.decode(str));
String adoptionCategoriesModelToJson(AdoptionCategoriesModel data) => json.encode(data.toJson());
class AdoptionCategoriesModel {
  AdoptionCategoriesModel({
      this.id, 
      this.name, 
      this.photo,});

  AdoptionCategoriesModel.fromJson(dynamic json) {
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