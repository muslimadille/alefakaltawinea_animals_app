import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/offer_model.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';

import '../../serviceProviderAccount/data/scan_code_model.dart';

class NotificationModel {
  int? id;
  String? title;
  String? userId;
  String? price;
  String? discountValue;
  String? expirationDate;
  String? code;
  String? usageTimes;
  List<Features>? features;
  String? userUsage;
  String? notificationDate;
  Shop? shop;

  NotificationModel(
      {this.id,
        this.title,
        this.userId,
        this.price,
        this.discountValue,
        this.expirationDate,
        this.code,
        this.usageTimes,
        this.features,
        this.userUsage,
        this.notificationDate,
        this.shop});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    userId = json['user_id'];
    price = json['price'];
    discountValue = json['discount_value'];
    expirationDate = json['expiration_date'];
    code = json['code'];
    usageTimes = json['usage_times'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
    userUsage = json['user_usage'];
    notificationDate = json['notification_date'];
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['user_id'] = this.userId;
    data['price'] = this.price;
    data['discount_value'] = this.discountValue;
    data['expiration_date'] = this.expirationDate;
    data['code'] = this.code;
    data['usage_times'] = this.usageTimes;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    data['user_usage'] = this.userUsage;
    data['notification_date'] = this.notificationDate;
    if (this.shop != null) {
      data['shop'] = this.shop!.toJson();
    }
    return data;
  }
}

class Features {
  String? ar;
  String? en;

  Features({this.ar, this.en});

  Features.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    return data;
  }
}

class Shop {
  int? id;
  String? name;
  String? address;
  String? phone;
  String? whatsapp;
  String? email;
  String? website;
  String? photo;
  List<Photos>? photos;
  String? bannerPhoto;
  String? offerPhoto;
  String? longitude;
  String? latitude;
  String? regionId;
  String? regionName;
  String? stateId;
  String? stateName;
  String? isOnline;
  int? isFav;
  String? categoryId;
  List<OfferModel>? offers;
  String? color;
  String? userTypeId;
  String? token;
  String? activate;
  String? distance;

  Shop(
      {this.id,
        this.name,
        this.address,
        this.phone,
        this.whatsapp,
        this.email,
        this.website,
        this.photo,
        this.photos,
        this.bannerPhoto,
        this.offerPhoto,
        this.longitude,
        this.latitude,
        this.regionId,
        this.regionName,
        this.stateId,
        this.stateName,
        this.isOnline,
        this.isFav,
        this.categoryId,
        this.offers,
        this.color,
        this.userTypeId,
        this.token,
        this.activate,
        this.distance});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    email = json['email'];
    website = json['website'];
    photo = json['photo'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
    bannerPhoto = json['banner_photo'];
    offerPhoto = json['offer_photo'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    regionId = json['region_id'];
    regionName = json['region_name'];
    stateId = json['state_id'];
    stateName = json['state_name'];
    isOnline = json['is_online'];
    isFav = json['is_fav'];
    categoryId = json['category_id'];
    if (json['offers'] != null) {
      offers = <OfferModel>[];
      json['offers'].forEach((v) {
        offers!.add(new OfferModel.fromJson(v));
      });
    }
    color = json['color'];
    userTypeId = json['user_type_id'];
    token = json['token'];
    activate = json['activate'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['whatsapp'] = this.whatsapp;
    data['email'] = this.email;
    data['website'] = this.website;
    data['photo'] = this.photo;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    data['banner_photo'] = this.bannerPhoto;
    data['offer_photo'] = this.offerPhoto;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['region_id'] = this.regionId;
    data['region_name'] = this.regionName;
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    data['is_online'] = this.isOnline;
    data['is_fav'] = this.isFav;
    data['category_id'] = this.categoryId;
    if (this.offers != null) {
      data['offers'] = this.offers!.map((v) => v.toJson()).toList();
    }
    data['color'] = this.color;
    data['user_type_id'] = this.userTypeId;
    data['token'] = this.token;
    data['activate'] = this.activate;
    data['distance'] = this.distance;
    return data;
  }
}

class Photos {
  int? id;
  String? userId;
  String? photo;
  String? createdAt;
  String? updatedAt;

  Photos({this.id, this.userId, this.photo, this.createdAt, this.updatedAt});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

