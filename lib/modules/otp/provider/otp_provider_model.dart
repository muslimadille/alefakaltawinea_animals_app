import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/cart/add_cart_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/mainCategoriesScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/intro/intro_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/login/data/user_data.dart';
import 'package:alefakaltawinea_animals_app/modules/login/provider/user_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/otp/data/otp_api.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/provider/sevice_providers_provicer_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpProviderModel with ChangeNotifier{
  OtpApi otpApi=OtpApi();
  int? activation_code;

  ///.....ui controllers.........
  bool isLoading=false;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
  ///......active account....................
  activeAccount(String phone,String code,BuildContext ctx,{bool fromaddcard=false}) async {
    setIsLoading(true);
    MyResponse<UserData> response =
    await otpApi.activeAccount(phone,code);
    if (response.status == Apis.CODE_SUCCESS&&response.data!=null){
      Constants.currentUser=response.data;
      Apis.TOKEN_VALUE=Constants.currentUser!.token!;
      setIsLoading(false);
      if(Constants.APPLE_PAY_STATE){

          MyUtils.navigateAsFirstScreen(ctx, IntroScreen(fromaddcard:fromaddcard));

      }else{
        MyUtils.navigateAsFirstScreen(ctx, MainCategoriesScreen());
      }
    }else if(response.status == Apis.CODE_SHOW_MESSAGE){
      print("login error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }else{
      await Fluttertoast.showToast(msg: tr("try_again"));
    }
    notifyListeners();

  }
  ///.........get code.....................
  getCode(String phone,BuildContext ctx) async {
    setIsLoading(true);
    MyResponse<dynamic> response =
    await otpApi.getCodeToSetPassword(phone);
    if (response.status == Apis.CODE_SUCCESS){
      setIsLoading(false);
      setActivationCode(response.code!);
    }else if(response.status == Apis.CODE_SHOW_MESSAGE){
      print("login error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }else{
      await Fluttertoast.showToast(msg: tr("try_again"));
    }
    notifyListeners();

  }
///.......update profile phone.....................

void setActivationCode(int value){
  activation_code=value;
  notifyListeners();
}

}