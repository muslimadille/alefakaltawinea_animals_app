class UserDataModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  bool? isActive;

  UserDataModel({this.id, this.name, this.email, this.phone,this.isActive});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    isActive=json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['isActive']=this.isActive;
    return data;
  }
}