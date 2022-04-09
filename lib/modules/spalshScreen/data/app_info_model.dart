class AppInfoModel {
  String? aboutUs;
  String? conditions;
  String? privacy;
  String? phone;
  String? whatsapp;
  String? email;
  int? firstCardPrice;
  int? secCardPrice;

  AppInfoModel(
      {this.aboutUs,
        this.conditions,
        this.privacy,
        this.phone,
        this.whatsapp,
        this.email,
        this.firstCardPrice,
        this.secCardPrice});

  AppInfoModel.fromJson(Map<String, dynamic> json) {
    aboutUs = json['about-us'];
    conditions = json['conditions'];
    privacy = json['privacy'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    email = json['email'];
    firstCardPrice = json['first_card_price'];
    secCardPrice = json['sec_card_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about-us'] = this.aboutUs;
    data['conditions'] = this.conditions;
    data['privacy'] = this.privacy;
    data['phone'] = this.phone;
    data['whatsapp'] = this.whatsapp;
    data['email'] = this.email;
    data['first_card_price'] = this.firstCardPrice;
    data['sec_card_price'] = this.secCardPrice;
    return data;
  }
}