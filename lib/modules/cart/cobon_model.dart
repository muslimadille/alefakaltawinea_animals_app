class CobonModel {
  int? id;
  String? code;
  String? used;
  String? orderId;
  String? percent;
  String? maxMoney;
  String? days;
  String? usageQuota;
  String? userId;
  String? type;
  String? markterName;
  String? expirationDate;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? linkType;

  CobonModel(
      {this.id,
        this.code,
        this.used,
        this.orderId,
        this.percent,
        this.maxMoney,
        this.days,
        this.usageQuota,
        this.userId,
        this.type,
        this.markterName,
        this.expirationDate,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.linkType});

  CobonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    used = json['used'];
    orderId = json['order_id'];
    percent = json['percent'];
    maxMoney = json['max_money'];
    days = json['days'];
    usageQuota = json['usage_quota'];
    userId = json['user_id'];
    type = json['type'];
    markterName = json['markter_name'];
    expirationDate = json['expiration_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    linkType = json['link_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['used'] = this.used;
    data['order_id'] = this.orderId;
    data['percent'] = this.percent;
    data['max_money'] = this.maxMoney;
    data['days'] = this.days;
    data['usage_quota'] = this.usageQuota;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['markter_name'] = this.markterName;
    data['expiration_date'] = this.expirationDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['link_type'] = this.linkType;
    return data;
  }
}