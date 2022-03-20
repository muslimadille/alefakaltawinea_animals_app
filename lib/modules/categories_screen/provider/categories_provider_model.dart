import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/data/categories_model.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/data/get_categories_list_api.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class CategoriesProviderModel with ChangeNotifier {
  ///.....ui controllers.........
  bool isLoading=false;
  bool showHadeth=false;

  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
  /// ..........categories...........
  List<CategoriesDataModel> categoriesList=[];
  GetCategoriesListApi getCategoriesListApi=GetCategoriesListApi();
  getCategoriesList() async {
    setIsLoading(true);
    categoriesList.clear();
    MyResponse<List<CategoriesDataModel>> response =
        await getCategoriesListApi.getCategoriesList();
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null){
      setCategoriesList(response.data);
      setIsLoading(false);
    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      setIsLoading(false);
    }else{
      setIsLoading(false);
    }
    notifyListeners();

  }
  void setCategoriesList(List<CategoriesDataModel> value){
    categoriesList.addAll(value);
    notifyListeners();
  }

}