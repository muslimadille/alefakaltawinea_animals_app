
import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/data/getServiceProvidersApi.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';
import 'package:flutter/cupertino.dart';

class ServiceProvidersProviderModel with ChangeNotifier {
  ///.....ui controllers.........
  bool isLoading=false;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
  /// ..........categories...........
  ServiceProviderModel? serviceProviderModel;
  GetServiceProvidersApi getServiceProvidersApi=GetServiceProvidersApi();
  getCategoriesList(int categoryId,int page) async {
    setIsLoading(true);
    MyResponse<ServiceProviderModel> response =
    await getServiceProvidersApi.getServiceProviders(categoryId, page);

    if (response.status == Apis.CODE_SUCCESS &&response.data!=null){
      setServiceProviderModel(response.data);
      setIsLoading(false);
    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      setIsLoading(false);
    }else{
      setIsLoading(false);
    }
    notifyListeners();

  }
  void setServiceProviderModel(ServiceProviderModel value){
    if(serviceProviderModel==null){
      serviceProviderModel=value;
    }else{
      if(value.data!.isNotEmpty){
        for(int i=0;i<value.data!.length;i++){
          for(int n=0;n<serviceProviderModel!.data!.length;n++){
            if(serviceProviderModel!.data![n].id!=value.data![i].id){
              serviceProviderModel!.data!.add(value.data![i]);
            };
          }

        }
      }
    }
    notifyListeners();
  }

}