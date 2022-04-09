
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

import 'choce_language_screen.dart';
import 'data/regions_api.dart';
import 'data/regions_api.dart';
import 'data/regions_api.dart';



class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  bool _isLoading=true;
  //AnimationController? _controller;
  //Animation<double>? _animation;
  //Intro? intro;
  AdsSliderProviderModel?adsSliderProviderModel;
  SharedPreferences? prefs;
  UtilsProviderModel? utilsProviderModel;
  UserProviderModel?userProviderModel;
  RegionsApi regionsApi=RegionsApi();

  void _initPref(BuildContext ctx)async{
    utilsProviderModel=Provider.of<UtilsProviderModel>(ctx,listen: false);
    prefs =  await SharedPreferences.getInstance();
    Constants.prefs=prefs;
    if(prefs!.get(Constants.LANGUAGE_KEY!)!=null){
      if(prefs!.get(Constants.LANGUAGE_KEY!)=="ar"){
        Constants.utilsProviderModel!.setLanguageState("ar");
        utilsProviderModel!.setCurrentLocal(ctx, Locale('ar','EG'));
      }else{
        Constants.utilsProviderModel!.setLanguageState("en");
        utilsProviderModel!.setCurrentLocal(ctx, Locale('en','US'));
      }
    }else{
      Constants.utilsProviderModel!.setLanguageState("ar");
      utilsProviderModel!.setCurrentLocal(ctx, Locale('ar','EG'));

    }
    initSavedUser();
  }

  @override
  void initState() {
    super.initState();
    getRegions();
    getAppInfo();
    userProviderModel=Provider.of<UserProviderModel>(context,listen: false);
    //intro=_myIntro();
    _initPref(context);
    adsSliderProviderModel=Provider.of<AdsSliderProviderModel>(context,listen: false);
    adsSliderProviderModel!.getAdsSlider();
    /*_controller=AnimationController(vsync: this,duration:Duration(milliseconds: 2000));
    _animation=Tween<double>(begin:0.0,end: 1.0 ).animate(_controller!)..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        setState(() {
          intro!.start(context);
        });
      }
    })..addListener(() {

    });*/
    WidgetsBinding.instance!.addPostFrameCallback((_) async {

      await Future.delayed(Duration(milliseconds: 5000)).then((value) {
        MyUtils.navigate(context, ChoceLanguageScreen());
      });
    });


  }
  @override
  Widget build(BuildContext context) {
    adsSliderProviderModel=Provider.of<AdsSliderProviderModel>(context,listen: true);
    userProviderModel=Provider.of<UserProviderModel>(context,listen: true);

    return BaseScreen(
        tag: "SplashScreen",
      showSettings: false,
        showBottomBar: false,
        body: Stack(
          alignment:AlignmentDirectional.center,
          children: [
            TransitionImage(Res.SPLASH_BG,width: double.infinity,height:double.infinity,fit:BoxFit.cover),
            _logoTitleItem()

    ],)
    );
  }
  Widget _logoTitleItem(){
    return TransitionImage(
      "assets/images/logo_name_blue.png",
      width: D.default_300,
      height: D.default_300,
    );
  }


  initSavedUser(){
    if( Constants.prefs!.get(Constants.SAVED_PHONE_KEY!)!=null&&Constants.prefs!.get(Constants.SAVED_PASSWORD_KEY!)!=null){
      userProviderModel!.login(Constants.prefs!.get(Constants.SAVED_PHONE_KEY!).toString(),Constants.prefs!.get(Constants.SAVED_PASSWORD_KEY!).toString(),context);
    }
  }
  void getRegions(){
    regionsApi.getRegions().then((value) {
      Constants.REGIONS=value.data;
    });

  }
  void getAppInfo(){
    regionsApi.getAppInfo().then((value) {
      Constants.APP_INFO=value.data;
    });

  }
}
