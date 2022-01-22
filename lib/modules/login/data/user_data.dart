import 'dart:convert';

import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/offer_model.dart';
/// id : 28
/// name : "user test1"
/// address : ""
/// phone : "551234567"
/// whatsapp : "966551234567"
/// email : "user@test1.com"
/// website : ""
/// photo : ""
/// banner_photo : ""
/// longitude : ""
/// latitude : ""
/// region_id : ""
/// region_name : ""
/// state_id : ""
/// state_name : ""
/// is_online : "0"
/// category_id : "0"
/// offers : []
/// color : ""
/// user_type_id : "5"
/// token : null

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));
String userDataToJson(UserData data) => json.encode(data.toJson());
class UserData {
  UserData({
      this.id, 
      this.name, 
      this.address, 
      this.phone, 
      this.whatsapp, 
      this.email, 
      this.website, 
      this.photo, 
      this.bannerPhoto, 
      this.longitude, 
      this.latitude, 
      this.regionId, 
      this.regionName, 
      this.stateId, 
      this.stateName, 
      this.isOnline, 
      this.categoryId, 
      this.offers, 
      this.color, 
      this.userTypeId, 
      this.token,
    this.isActive
  });

  UserData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    email = json['email'];
    website = json['website'];
    photo = json['photo'];
    bannerPhoto = json['banner_photo'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    regionId = json['region_id'];
    regionName = json['region_name'];
    stateId = json['state_id'];
    stateName = json['state_name'];
    isOnline = json['is_online'];
    categoryId = json['category_id'];
    if (json['offers'] != null) {
      offers = [];
      json['offers'].forEach((v) {
        offers?.add(OfferModel.fromJson(v));
      });
    }
    color = json['color'];
    userTypeId = json['user_type_id'];
    token = json['token'];
    isActive=json['isActive'];
  }
  int? id;
  String? name;
  String? address;
  String? phone;
  String? whatsapp;
  String? email;
  String? website;
  String? photo;
  String? bannerPhoto;
  String? longitude;
  String? latitude;
  String? regionId;
  String? regionName;
  String? stateId;
  String? stateName;
  String? isOnline;
  String? categoryId;
  List<OfferModel>? offers;
  String? color;
  String? userTypeId;
  String? token;
  bool?isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['address'] = address;
    map['phone'] = phone;
    map['whatsapp'] = whatsapp;
    map['email'] = email;
    map['website'] = website;
    map['photo'] = photo;
    map['banner_photo'] = bannerPhoto;
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    map['region_id'] = regionId;
    map['region_name'] = regionName;
    map['state_id'] = stateId;
    map['state_name'] = stateName;
    map['is_online'] = isOnline;
    map['category_id'] = categoryId;
    if (offers != null) {
      map['offers'] = offers?.map((v) => v.toJson()).toList();
    }
    map['color'] = color;
    map['user_type_id'] = userTypeId;
    map['token'] = token;
    map['isActive']=isActive;
    return map;
  }

}