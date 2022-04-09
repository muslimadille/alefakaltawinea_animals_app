class OfferCodeModel {
  int? userId;
  String? shopId;
  int? offerId;
  String? code;
  String? updatedAt;
  String? createdAt;
  int? id;

  OfferCodeModel(
      {this.userId,
        this.shopId,
        this.offerId,
        this.code,
        this.updatedAt,
        this.createdAt,
        this.id});

  OfferCodeModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    shopId = json['shop_id'];
    offerId = json['offer_id'];
    code = json['code'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['shop_id'] = this.shopId;
    data['offer_id'] = this.offerId;
    data['code'] = this.code;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}