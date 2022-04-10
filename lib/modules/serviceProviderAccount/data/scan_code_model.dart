class ScanCodeModel {
  UserCobon? userCobon;
  Offer? offer;
  int? userUsageCount;

  ScanCodeModel({this.userCobon, this.offer, this.userUsageCount});

  ScanCodeModel.fromJson(Map<String, dynamic> json) {
    userCobon = json['user_cobon'] != null
        ? new UserCobon.fromJson(json['user_cobon'])
        : null;
    offer = json['offer'] != null ? new Offer.fromJson(json['offer']) : null;
    userUsageCount = json['user_usage_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userCobon != null) {
      data['user_cobon'] = this.userCobon!.toJson();
    }
    if (this.offer != null) {
      data['offer'] = this.offer!.toJson();
    }
    data['user_usage_count'] = this.userUsageCount;
    return data;
  }
}

class UserCobon {
  int? id;
  String? userId;
  String? shopId;
  String? offerId;
  String? status;
  String? code;
  String? createdAt;
  String? updatedAt;

  UserCobon(
      {this.id,
        this.userId,
        this.shopId,
        this.offerId,
        this.status,
        this.code,
        this.createdAt,
        this.updatedAt});

  UserCobon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shopId = json['shop_id'];
    offerId = json['offer_id'];
    status = json['status'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['shop_id'] = this.shopId;
    data['offer_id'] = this.offerId;
    data['status'] = this.status;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Offer {
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
  String? userUsage;

  Offer(
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
        this.stop,
        this.userUsage});

  Offer.fromJson(Map<String, dynamic> json) {
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
    userUsage = json['user_usage'];
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
    data['user_usage'] = this.userUsage;
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