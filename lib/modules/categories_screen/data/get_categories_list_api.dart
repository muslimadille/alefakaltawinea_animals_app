
import 'dart:convert';
import 'package:alefakaltawinea_animals_app/data/dio/dio_utils.dart';
import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/data/categories_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';

class GetCategoriesListApi{

  Future<MyResponse<List<CategoriesDataModel>>> getCategoriesList() async {
    final url = "${Apis.GET_CATEGORIES_LIST}";

    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_GET, url);
    if (response != null && response.statusCode == 200) {
      return MyResponse<List<CategoriesDataModel>>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<List<CategoriesDataModel>>.init(Apis.CODE_ERROR, "", null);
    }
  }
}