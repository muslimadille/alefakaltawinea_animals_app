import 'dart:convert';
AnimalPagerListModel animalPagerListModelFromJson(String str) => AnimalPagerListModel.fromJson(json.decode(str));
String animalPagerListModelToJson(AnimalPagerListModel data) => json.encode(data.toJson());
class AnimalPagerListModel {
  AnimalPagerListModel({
      this.currentPage, 
      this.data, 
      this.firstPageUrl, 
      this.from, 
      this.lastPage, 
      this.lastPageUrl, 
      this.links, 
      this.nextPageUrl, 
      this.path, 
      this.perPage, 
      this.prevPageUrl, 
      this.to, 
      this.total,});

  AnimalPagerListModel.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(AnimalData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
  int? currentPage;
  List<AnimalData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = firstPageUrl;
    map['from'] = from;
    map['last_page'] = lastPage;
    map['last_page_url'] = lastPageUrl;
    if (links != null) {
      map['links'] = links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = nextPageUrl;
    map['path'] = path;
    map['per_page'] = perPage;
    map['prev_page_url'] = prevPageUrl;
    map['to'] = to;
    map['total'] = total;
    return map;
  }

}

Links linksFromJson(String str) => Links.fromJson(json.decode(str));
String linksToJson(Links data) => json.encode(data.toJson());
class Links {
  Links({
      this.url, 
      this.label, 
      this.active,});

  Links.fromJson(dynamic json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
  String? url;
  String? label;
  bool? active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['active'] = active;
    return map;
  }

}

AnimalData dataFromJson(String str) => AnimalData.fromJson(json.decode(str));
String dataToJson(AnimalData data) => json.encode(data.toJson());
class AnimalData {
  AnimalData({
      this.id, 
      this.userId, 
      this.age, 
      this.gender, 
      this.type, 
      this.vaccination, 
      this.city, 
      this.reasonToGiveUp, 
      this.healthStatus, 
      this.conditions, 
      this.photo, 
      this.createdAt, 
      this.updatedAt, 
      this.sort, 
      this.thumb, 
      this.categoryId, 
      this.stop, 
      this.user,
    this.phone
  });

  AnimalData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    age = json['age'];
    gender = json['gender'];
    type = json['type'];
    vaccination = json['vaccination'];
    city = json['city'];
    reasonToGiveUp = json['reason_to_give_up'];
    healthStatus = json['health_status'];
    conditions = json['conditions'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sort = json['sort'];
    thumb = json['thumb'];
    categoryId = json['category_id'];
    stop = json['stop'];
    name=json['name'];
    phone=json['phone'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int? id;
  String? userId;
  String? age;
  String? gender;
  String? type;
  String? vaccination;
  String? city;
  String? reasonToGiveUp;
  String? healthStatus;
  String? conditions;
  String? photo;
  String? createdAt;
  String? updatedAt;
  String? sort;
  String? thumb;
  String? categoryId;
  String? stop;
  User? user;
  String?name;
  String?phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['age'] = age;
    map['gender'] = gender;
    map['type'] = type;
    map['vaccination'] = vaccination;
    map['city'] = city;
    map['reason_to_give_up'] = reasonToGiveUp;
    map['health_status'] = healthStatus;
    map['conditions'] = conditions;
    map['photo'] = photo;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['sort'] = sort;
    map['thumb'] = thumb;
    map['category_id'] = categoryId;
    map['stop'] = stop;
    map['name']=name;
    map['phone']=phone;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      this.id, 
      this.username,});

  User.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
  }
  int? id;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    return map;
  }

}