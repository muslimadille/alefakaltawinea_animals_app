import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/adoption/data/adoption_api.dart';
import 'package:alefakaltawinea_animals_app/modules/adoption/data/adoption_categories_model.dart';
import 'package:alefakaltawinea_animals_app/modules/adoption/data/animal_pager_list_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdoptionProviderModel with ChangeNotifier{

  ///.....ui controllers.........
  bool isLoading=false;
  int selectedCategoryIndex=0;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
  void setSelectedCategoryIndex(int value){
    selectedCategoryIndex=value;
    notifyListeners();
  }
  /// ..........categories...........
  List<AdoptionCategoriesModel> categoriesList=[];
  AnimalPagerListModel? animalPagerListModel;
  AnimalPagerListModel? myAnimalsPagerListModel;

  AdaptionApi adoptionApi=AdaptionApi();
  getCategoriesList() async {
    setIsLoading(true);
    categoriesList.clear();
    MyResponse<List<AdoptionCategoriesModel>> response =
    await adoptionApi.getAdoptionCategories();
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
  getAnimals(int categoryId) async {
    setIsLoading(true);
    MyResponse<AnimalPagerListModel> response =
    await adoptionApi.getAnimals(categoryId);
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null){
      setAnimalsPager(response.data);
      setIsLoading(false);
    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      setIsLoading(false);
    }else{
      setIsLoading(false);
    }
    notifyListeners();

  }
  getMyAnimals() async {
    setIsLoading(true);
    MyResponse<AnimalPagerListModel> response =
    await adoptionApi.getMyAnimals();
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null){
      myAnimalsPagerListModel=response.data;
      setIsLoading(false);
    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      setIsLoading(false);
    }else{
      setIsLoading(false);
    }
    notifyListeners();

  }
  setAnimal(BuildContext ctx,FormData body,int categoryId) async {
    setIsLoading(true);
    MyResponse<dynamic> response =
    await adoptionApi.setAdoptionAnimal(body);
    if (response.status == Apis.CODE_SUCCESS){
      setIsLoading(false);
      getAnimals(categoryId);
      Navigator.of(ctx).pop();
      await Fluttertoast.showToast(msg: "${response.msg}");
    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      setIsLoading(false);
    }else{
      setIsLoading(false);
    }
    notifyListeners();

  }
  editAnimal(BuildContext ctx,FormData body,int animalId) async {
    setIsLoading(true);
    MyResponse<dynamic> response =
    await adoptionApi.editAdoptionAnimal(body,animalId);
    if (response.status == Apis.CODE_SUCCESS){
      getMyAnimals();
      setIsLoading(false);
      Navigator.of(ctx).pop();
      await Fluttertoast.showToast(msg: "${response.msg}");
    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      setIsLoading(false);
    }else{
      setIsLoading(false);
    }
    notifyListeners();

  }

  deleteAnimal(BuildContext ctx,int animalId) async {
    setIsLoading(true);
    MyResponse<dynamic> response =
    await adoptionApi.deleteAdoptionAnimal(animalId);
    if (response.status == Apis.CODE_SUCCESS){
      getMyAnimals();
      setIsLoading(false);
      Navigator.of(ctx).pop();
      await Fluttertoast.showToast(msg: "${response.msg}");
    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      setIsLoading(false);
    }else{
      setIsLoading(false);
    }
    notifyListeners();

  }

  void setCategoriesList(List<AdoptionCategoriesModel> value){
    categoriesList.addAll(value);
    if(categoriesList.isNotEmpty){
      getAnimals(categoriesList[0].id!);
    }
    getMyAnimals();
    notifyListeners();
  }
  void setAnimalsPager(AnimalPagerListModel value){
    animalPagerListModel=value;
    notifyListeners();
  }
}