
import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/ads/data/ads_slider_api.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';
import 'package:flutter/cupertino.dart';


class AdsSliderProviderModel with ChangeNotifier {
  ///.....ui controllers.........
  bool isLoading=false;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
  /// ..........categories...........
  List<Data> adsSliderModelList=[];
  GetAds_sliderApi getAds_sliderApi=GetAds_sliderApi();
  getAdsSlider() async {
    setIsLoading(true);
    MyResponse<List<Data>> response =
    await getAds_sliderApi.getAdsSlider();

    if (response.status == Apis.CODE_SUCCESS &&response.data!=null){
      setAdsSliderModel(response.data);
      setIsLoading(false);
    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      setIsLoading(false);
    }else{
      setIsLoading(false);
    }
    notifyListeners();
  }
  void setAdsSliderModel(List<Data> value){
    adsSliderModelList.clear();
    adsSliderModelList.addAll(value);
    notifyListeners();
  }

}