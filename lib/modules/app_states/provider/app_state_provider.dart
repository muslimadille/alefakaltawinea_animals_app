

import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../spalshScreen/maintainance_screen.dart';
import '../data/app_state_api.dart';
import 'dart:io' as IO;


class AppStataProviderModel with ChangeNotifier{

  ///.....ui controllers.........
  bool isLoading=false;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
  /// ...........login............
  bool app_active_state=true;
  bool apple_pay_state=true;

  AppStatesApi appStatesApi=AppStatesApi();
  getAppActiveState() async {
    setIsLoading(true);
    bool response =
    await appStatesApi.getActiveState();
    app_active_state=response;
    notifyListeners();

  }
  getApplePayState() async {
    setIsLoading(true);
    bool response =
    await appStatesApi.getApplePayState();

    if (IO.Platform.isIOS) {
      Constants.APPLE_PAY_STATE=response;
    }else{
      Constants.APPLE_PAY_STATE=true;
    }
    notifyListeners();

  }

}