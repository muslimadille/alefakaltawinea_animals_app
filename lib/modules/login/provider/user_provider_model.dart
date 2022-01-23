import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/mainCategoriesScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/login/data/login_api.dart';
import 'package:alefakaltawinea_animals_app/modules/login/data/user_data.dart';
import 'package:alefakaltawinea_animals_app/modules/login/login_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/otp/otp_screem.dart';
import 'package:alefakaltawinea_animals_app/modules/otp/phone_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/registeration/data/registeration_api.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserProviderModel with ChangeNotifier{

  ///.....ui controllers.........
  bool isLoading=false;
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
  /// ...........login............
  UserData? currentUser;
  LoginApi loginApi=LoginApi();
  login(String phone,String password,BuildContext ctx) async {
    setIsLoading(true);
    MyResponse<UserData> response =
    await loginApi.login(phone, password);

    if (response.status == Apis.CODE_SUCCESS &&response.data!=null){
      UserData user=response.data;
       if(user.activate=="1"){
         setCurrentUserData(user);
         setIsLoading(false);
         await Constants.prefs!.setString(Constants.SAVED_PHONE_KEY!,phone);
         await Constants.prefs!.setString(Constants.SAVED_PASSWORD_KEY!,password);
         MyUtils.navigateAsFirstScreen(ctx, MainCategoriesScreen());
       }else{
         setIsLoading(false);
         /// NAVIGATE TO SMS SCREEN
         MyUtils.navigate(ctx, PhoneScreen(tr("login"), tr("register_otp")));
       }

          }else if(response.status == Apis.CODE_ACTIVE_USER){
      setIsLoading(false);
      /// NAVIGATE TO SMS SCREEN
      MyUtils.navigate(ctx, PhoneScreen(tr("login"), tr("register_otp")));
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("login error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();

  }
setCurrentUserData(UserData user){
  currentUser=user;
  Constants.currentUser=user;
  Apis.TOKEN_VALUE=user.token!;
  notifyListeners();
}
/// ............REGISTER...............
  RegisterationApi registerationApi=RegisterationApi();
  register(BuildContext ctx,String name,String email,String phone,String password,String confirmPass,{int regionId=1,int stateId=1}) async {
    setIsLoading(true);
    MyResponse<UserData> response =
    await registerationApi.register( name, email, phone, password, confirmPass, regionId:1, stateId:1);

    if (response.status == Apis.CODE_SUCCESS &&response.data!=null){
      UserData user=response.data;
      setCurrentUserData(user);
      setIsLoading(false);
      MyUtils.navigateReplaceCurrent(ctx, OtpScreen("register",tr('register_otp'),code:response.code.toString(),));
    }else if(response.status == Apis.CODE_ACTIVE_USER &&response.data!=null){
      UserData user=response.data;
      setCurrentUserData(user);
      setIsLoading(false);
      MyUtils.navigateReplaceCurrent(ctx, OtpScreen("register",tr('register_otp'),code:response.code.toString(),));
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("login error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();

  }
/// ...........update profile............
  updateProfile(BuildContext ctx,String name,String email,String phone,String password,String confirmPass,{int regionId=1,int stateId=1}) async {
    setIsLoading(true);
    MyResponse<UserData> response =
    await registerationApi.register( name, email, phone, password, confirmPass, regionId:1, stateId:1);

    if (response.status == Apis.CODE_SUCCESS &&response.data!=null){
      UserData user=response.data;
      setCurrentUserData(user);
      setIsLoading(false);
      if(user.activate=="0"){
        MyUtils.navigateAsFirstScreen(ctx, OtpScreen("register",tr('register_otp'),code:response.code.toString(),));
      }
    }else if(response.status == Apis.CODE_ACTIVE_USER &&response.data!=null){
      UserData user=response.data;
      setCurrentUserData(user);
      setIsLoading(false);
      MyUtils.navigateReplaceCurrent(ctx, OtpScreen("register",tr('register_otp'),code:response.code.toString(),));
    }else if(response.status == Apis.CODE_SHOW_MESSAGE ){
      print("login error: ${response.msg}");
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();

  }


}