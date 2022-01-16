
import 'dart:convert';
import 'package:alefakaltawinea_animals_app/data/dio/dio_utils.dart';
import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';

class GetAds_sliderApi{

  Future<MyResponse<List<Data>>> getAdsSlider() async {
    final url = "${Apis.GET_ADS_SLIDER}";
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_GET, url);
    if (response != null && response.statusCode == 200) {
      return MyResponse<List<Data>>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<List<Data>>.init(Apis.CODE_ERROR, "", null);
    }
  }


}