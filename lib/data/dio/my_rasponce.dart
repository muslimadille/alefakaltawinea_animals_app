
import 'package:alefakaltawinea_animals_app/modules/categories_screen/data/categories_model.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';

class MyResponse<T> extends Object {
  final TAG = "MyResponse";

  String? _status = "";
  String? _msg = "";
  var _data;

  MyResponse.fromJson(Map<String, dynamic> json) {
    print("$TAG: ${json.toString()}");

    if (json.containsKey("status")) {
      _status = json['status'].toString();
    }
    if (json.containsKey("Error")) {
      _msg = json['Error'];
    } else if (json.containsKey("error")) {
      _msg = json['error'];
    }
    if (json.containsKey("message")) {
      _msg = json['message'];
    }
    if (json.containsKey("Data")) {
      _checkType(json['Data']);
    } else if (json.containsKey("data")) {
      _checkType(json['data']);
    }

  }

  MyResponse.init(String status, String msg, dynamic data) {
    _status = status;
    _msg = msg;
    if (data is int) {
      _status = "$data";
    } else {
      _data = data;
    }
  }

  _checkType(json) {
    print("$TAG-T_Type: $T");

    if (json != null) {
      if (!_parseList(json)) {
        _parseSingle(json);
      }
    } else {
      _data = null;
    }
  }

  _parseSingle(json) {
    switch (T) {
      case ServiceProviderModel:
        _data = ServiceProviderModel.fromJson(json) as T;
        break;
      default:
        _data = null;
    }
  }

  bool _parseList(json) {
    if ("$T".contains("List<CategoriesDataModel>")) {
      _data = (json as List)
          .map((item) => CategoriesDataModel.fromJson(item))
          .toList() as T;

    }  else {
      _data = null;
      return false;
    }
    print(_data);
    return true;
  }

  String? get status => _status;

  String? get msg => _msg;

  get data => _data;
  set data(value) => _data = value;
}
