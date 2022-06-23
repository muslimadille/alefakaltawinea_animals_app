class AddCartResponseModel {
  String? url;
  dynamic price;



  AddCartResponseModel(
      {this.url,
        this.price,
      });

  AddCartResponseModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    price = json['price'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['price'] = this.price;

    return data;
  }
}
