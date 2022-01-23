import 'dart:convert';
RegionsModel regionsModelFromJson(String str) => RegionsModel.fromJson(json.decode(str));
String regionsModelToJson(RegionsModel data) => json.encode(data.toJson());
class RegionsModel {
  RegionsModel({
      this.id, 
      this.name, 
      this.getStates,});

  RegionsModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    if (json['get_states'] != null) {
      getStates = [];
      json['get_states'].forEach((v) {
        getStates?.add(Get_states.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  List<Get_states>? getStates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (getStates != null) {
      map['get_states'] = getStates?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Get_states get_statesFromJson(String str) => Get_states.fromJson(json.decode(str));
String get_statesToJson(Get_states data) => json.encode(data.toJson());
class Get_states {
  Get_states({
      this.id, 
      this.regionId, 
      this.name,});

  Get_states.fromJson(dynamic json) {
    id = json['id'];
    regionId = json['region_id'];
    name = json['name'];
  }
  int? id;
  String? regionId;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['region_id'] = regionId;
    map['name'] = name;
    return map;
  }

}