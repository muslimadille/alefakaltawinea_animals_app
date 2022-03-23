class PhotoModel {
  int? id;
  String? userId;
  String? photo;
  String? createdAt;
  String? updatedAt;

  PhotoModel(
      {this.id, this.userId, this.photo, this.createdAt, this.updatedAt});

  PhotoModel.fromJson(Map<String, dynamic> json) {
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