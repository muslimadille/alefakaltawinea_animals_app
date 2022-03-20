class NotificationModel {
  int? id;
  String? name;
  String? address;
  String? phone;
  String? whatsapp;
  String? email;
  String? website;
  String? photo;
  List<Null>? photos;
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
  List<Offers>? offers;
  String? color;
  String? userTypeId;
  String? token;
  String? activate;
  dynamic distance;

  NotificationModel(
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

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    email = json['email'];
    website = json['website'];
    photo = json['photo'];
    if (json['photos'] != null) {
      photos = <Null>[];
      json['photos'].forEach((v) {
        photos!.add(v);
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
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
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
      data['photos'] = this.photos!.map((v) => v).toList();
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

class Offers {
  int? id;
  String? userId;
  String? price;
  String? discountValue;
  String? expirationDate;
  String? title;
  String? titleEn;
  String? code;
  String? usageTimes;
  List<Features>? features;
  String? createdAt;
  String? updatedAt;
  String? stop;

  Offers(
      {this.id,
        this.userId,
        this.price,
        this.discountValue,
        this.expirationDate,
        this.title,
        this.titleEn,
        this.code,
        this.usageTimes,
        this.features,
        this.createdAt,
        this.updatedAt,
        this.stop});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    price = json['price'];
    discountValue = json['discount_value'];
    expirationDate = json['expiration_date'];
    title = json['title'];
    titleEn = json['title_en'];
    code = json['code'];
    usageTimes = json['usage_times'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stop = json['stop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['price'] = this.price;
    data['discount_value'] = this.discountValue;
    data['expiration_date'] = this.expirationDate;
    data['title'] = this.title;
    data['title_en'] = this.titleEn;
    data['code'] = this.code;
    data['usage_times'] = this.usageTimes;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['stop'] = this.stop;
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