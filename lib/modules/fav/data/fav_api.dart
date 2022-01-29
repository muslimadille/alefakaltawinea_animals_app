
import 'dart:convert';
import 'package:alefakaltawinea_animals_app/data/dio/dio_utils.dart';
import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';

class FavApi{


  Future<MyResponse<dynamic>> setFav(int shopId) async {
    final url = "${Apis.ADD_FAV}";//keyword=&region_id=&state_id
    Map<String,dynamic>body={
      "shop_id":"$shopId"
    };
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<dynamic>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<dynamic>.init(Apis.CODE_ERROR, "", null);
    }
  }
  Future<MyResponse<List<Data>>> getFavs() async {
    final url = "${Apis.GET_FAV}";
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_GET, url);
    if (response != null && response.statusCode == 200) {
      return MyResponse<List<Data>>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<List<Data>>.init(Apis.CODE_ERROR, "", null);
    }
  }


}