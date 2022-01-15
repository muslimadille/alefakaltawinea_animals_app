class CategoriesDataModel {
  int? id;
  String? color;
  String? name;
  String? photo;

  CategoriesDataModel({this.id, this.color, this.name, this.photo});

  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    data['name'] = this.name;
    data['photo'] = this.photo;
    return data;
  }
}