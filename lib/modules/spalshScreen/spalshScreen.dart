
import 'package:alefakaltawinea_animals_app/modules/ads/provider/ads_slider_provider.dart';
import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/mainCategoriesScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/homeTabsScreen/homeTabsScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/homeTabsScreen/provider/intro_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/login/login_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/login/provider/user_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/registeration/registration_screen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/providers.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_states/provider/app_state_provider.dart';
import 'choce_language_screen.dart';
import 'data/regions_api.dart';
import 'data/regions_api.dart';
import 'data/regions_api.dart';
import 'maintainance_screen.dart';



class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  AdsSliderProviderModel?adsSliderProviderModel;
  SharedPreferences? prefs;
  UtilsProviderModel? utilsProviderModel;
  UserProviderModel?userProviderModel;
  RegionsApi regionsApi=RegionsApi();
  AppStataProviderModel?appStataProviderModel;

  @override
  void initState() {
    super.initState();
    getRegions();
    getAppInfo();
    appStataProviderModel=Provider.of<AppStataProviderModel>(context,listen:false);
    userProviderModel=Provider.of<UserProviderModel>(context,listen: false);
    adsSliderProviderModel=Provider.of<AdsSliderProviderModel>(context,listen: false);
    adsSliderProviderModel!.getAdsSlider();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await appStataProviderModel!.getAppActiveState();
      await appStataProviderModel!.getApplePayState();
      await Future.delayed(Duration(milliseconds: 5000)).then((value) {
        if(appStataProviderModel!.app_active_state){
          MyUtils.navigateAsFirstScreen(context, MaintainanceScreen());
        }else{
          MyUtils.navigateReplaceCurrent(context, ChoceLanguageScreen());
        }
      });
    });


  }
  @override
  Widget build(BuildContext context) {
    appStataProviderModel=Provider.of<AppStataProviderModel>(context,listen:false);
    utilsProviderModel=Provider.of<UtilsProviderModel>(Constants.mainContext!,listen: true);
    Constants.utilsProviderModel=utilsProviderModel;
    adsSliderProviderModel=Provider.of<AdsSliderProviderModel>(context,listen: true);
    userProviderModel=Provider.of<UserProviderModel>(context,listen: true);
    _initPref(context);
    setLocal();

    return BaseScreen(
        tag: "SplashScreen",
      showSettings: false,
        showBottomBar: false,
      showWhatsIcon:false,
        body: Stack(
          alignment:AlignmentDirectional.center,
          children: [
            Container(width: double.infinity,height: double.infinity,color: C.BASE_BLUE,),
            _logoTitleItem(),
            Positioned(child:TransitionImage(
              "assets/images/splash_animals.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitHeight,
            ),bottom: 0.0, )

    ],)
    );
  }
  Widget _logoTitleItem(){
    return TransitionImage(
      "assets/images/logo_with_name.png",
      width: D.default_300*0.9,
      height: D.default_300*0.9,
    );
  }


  initSavedUser(){
    if( Constants.prefs!.get(Constants.SAVED_PHONE_KEY!)!=null&&Constants.prefs!.get(Constants.SAVED_PASSWORD_KEY!)!=null){
      userProviderModel!.login(Constants.prefs!.get(Constants.SAVED_PHONE_KEY!).toString(),Constants.prefs!.get(Constants.SAVED_PASSWORD_KEY!).toString(),context,true);
    }
  }
  void getRegions(){
    regionsApi.getRegions().then((value) {
      Constants.REGIONS=value.data;
      for(int i=0;i<Constants.REGIONS.length;i++){
        Constants.STATES.addAll( Constants.REGIONS[i].getStates!);
      }
    });

  }
  void getAppInfo(){
    regionsApi.getAppInfo().then((value) {
      Constants.APP_INFO=value.data;
    });

  }
  void _initPref(BuildContext ctx)async{
    if(Constants.prefs!.get(Constants.LANGUAGE_KEY!)!=null){
      if(Constants.prefs!.get(Constants.LANGUAGE_KEY!)=="ar"){
        Constants.utilsProviderModel!.setLanguageState("ar");
        Constants.utilsProviderModel!.setCurrentLocal(ctx, Locale('ar','EG'));
      }else{
        Constants.utilsProviderModel!.setLanguageState("en");
        Constants.utilsProviderModel!.setCurrentLocal(ctx, Locale('en','US'));
      }
    }else{
      Constants.utilsProviderModel!.setLanguageState("ar");
      Constants.utilsProviderModel!.setCurrentLocal(ctx, Locale('ar','EG'));

    }

  }
  void setLocal()async{
    if(Constants.utilsProviderModel!.isArabic){
      await context.setLocale(Locale('ar', 'EG'));
      await EasyLocalization.of(context)!.setLocale(Locale('ar', 'EG'));
      Constants.utilsProviderModel!.currentLocalName="العربية";
      Constants.SELECTED_LANGUAGE="ar";
      Constants.utilsProviderModel!.setLanguageState("ar");
      await Constants.prefs!.setString(Constants.LANGUAGE_KEY!, "ar");
    }else{
      await context.setLocale(Locale('en', 'US'));
      await EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));
      Constants.utilsProviderModel!.currentLocalName="English";
      Constants.SELECTED_LANGUAGE="en";
      Constants.utilsProviderModel!.setLanguageState("en");
      await Constants.prefs!.setString(Constants.LANGUAGE_KEY!, "en");
    }
  }
}
