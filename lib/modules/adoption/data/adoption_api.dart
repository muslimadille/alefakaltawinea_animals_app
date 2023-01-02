
import 'dart:convert';
import 'package:alefakaltawinea_animals_app/data/dio/dio_utils.dart';
import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';
import 'package:dio/dio.dart';

import 'adoption_categories_model.dart';
import 'animal_pager_list_model.dart';

class AdaptionApi{

  Future<MyResponse<AnimalPagerListModel>> getAnimals(int categoryId,int page) async {
    final url = "${Apis.GET_ADOPTION_ANIMALS}?category_id=$categoryId&page=$page";
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_GET, url);
    if (response != null && response.statusCode == 200) {
      return MyResponse<AnimalPagerListModel>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<AnimalPagerListModel>.init(Apis.CODE_ERROR, "", null);
    }
  }
  Future<MyResponse<AnimalPagerListModel>> getMyAnimals() async {
    final url = "${Apis.GET_MY_ANIMALS}";
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_GET, url);
    if (response != null && response.statusCode == 200) {
      return MyResponse<AnimalPagerListModel>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<AnimalPagerListModel>.init(Apis.CODE_ERROR, "", null);
    }
  }
  Future<MyResponse<List<AdoptionCategoriesModel>>> getAdoptionCategories() async {
    final url = "${Apis.GET_ADOPTION_CATEGORIES}";
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_GET, url);
    if (response != null && response.statusCode == 200) {
      return MyResponse<List<AdoptionCategoriesModel>>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<List<AdoptionCategoriesModel>>.init(Apis.CODE_ERROR, "", null);
    }
  }
  Future<MyResponse<dynamic>> setAdoptionAnimal(FormData body) async {
    final url = "${Apis.ADD_ADOPTION_ANIMALS}";
    //print("vvvv${jsonEncode(body)}");
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<dynamic>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<dynamic>.init(Apis.CODE_ERROR, "", null);
    }
  }
  Future<MyResponse<dynamic>> editAdoptionAnimal(FormData body,int id) async {
    final url = "${Apis.EDIT_ANIMAL}$id";
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<dynamic>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<dynamic>.init(Apis.CODE_ERROR, "", null);
    }
  }
  Future<MyResponse<dynamic>> deleteAdoptionAnimal(int id) async {
    final url = "${Apis.DELETE_ANIMAL}$id";
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url);
    if (response != null && response.statusCode == 200) {
      return MyResponse<dynamic>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<dynamic>.init(Apis.CODE_ERROR, "", null);
    }
  }


}