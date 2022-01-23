
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
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  AnimationController? _controller;
  Animation<double>? _animation;
  Intro? intro;
  IntroProviderModel?introProviderModel;
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
        utilsProviderModel!.setCurrentLocal(ctx, Locale("ar","EG"));
      }else{
        utilsProviderModel!.setCurrentLocal(ctx, Locale("en","US"));
      }
    }
    initSavedUser();
  }

  @override
  void initState() {
    super.initState();
    getRegions();
    userProviderModel=Provider.of<UserProviderModel>(context,listen: false);

    intro=_myIntro();
    _initPref(context);
    introProviderModel =Provider.of<IntroProviderModel>(context, listen: false);
    adsSliderProviderModel=Provider.of<AdsSliderProviderModel>(context,listen: false);
    adsSliderProviderModel!.getAdsSlider();
    _controller=AnimationController(vsync: this,duration:Duration(milliseconds: 2000));
    _animation=Tween<double>(begin:0.0,end: 1.0 ).animate(_controller!)..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        setState(() {
          intro!.start(context);
        });
      }
    })..addListener(() {

    });
    WidgetsBinding.instance!.addPostFrameCallback((_) async {

      await Future.delayed(Duration(milliseconds: 6000)).then((value) {
        setState(() {
          _isLoading=false;
        });
      });
    });


  }
  @override
  Widget build(BuildContext context) {
    adsSliderProviderModel=Provider.of<AdsSliderProviderModel>(context,listen: true);
    introProviderModel =Provider.of<IntroProviderModel>(context, listen: true);
    userProviderModel=Provider.of<UserProviderModel>(context,listen: true);

    return BaseScreen(
        tag: "SplashScreen",
      showSettings: false,
        showBottomBar: false,
        body: AnimatedContainer(duration: Duration(milliseconds: 1000),
      height: double.infinity,
      color:_isLoading?Colors.white: C.BASE_BLUE,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child:_logoTitleItem()),
          _buttonsPart()

        ],),
      onEnd: (){
        setState(() {
          _controller!.forward();
        });
      },
    ));
  }
  Widget _logoTitleItem(){
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 3000),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return  FadeTransition(child: child, opacity: animation);
      },
        child:adsSliderProviderModel!.isLoading&&_isLoading?Center(key: Key("1"),child: Image.asset(Res.APP_LOGO_NAME,width: D.default_200,height: D.default_200),):Center(key:Key("2"),child: Image.asset(Res.APP_LOGO_DARK,width: D.default_150,height: D.default_150)));
  }
  Widget _buttonsPart(){
    return FadeTransition(
        child:Container(
            padding: EdgeInsets.only(bottom:D.default_10,top: D.default_10,left: D.default_5,right: D.default_5),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _browsApp(),
                _loginBtn(),
                _registerBtn(),
              ],)), opacity: _animation!);
  }
  Widget _browsApp(){
    return  Expanded(child: InkWell(
      key: intro!.keys[0],
      onTap:(){
        MyUtils.navigate(context, MainCategoriesScreen());
      },child: Container(
        padding: EdgeInsets.only(bottom:D.default_15,top: D.default_15,left: D.default_5,right: D.default_5),
        margin: EdgeInsets.all(D.default_5),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(D.default_5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        )
        ,child: Center(child: Text(tr("brows_app_btn"),style:S.h4(color:C.BASE_BLUE)),)),));
  }
  Widget _loginBtn(){
    return  Expanded(child: InkWell(
      key: intro!.keys[1],
      onTap:(){
        MyUtils.navigate(context, LoginScreen());
      },child: Container(
        padding: EdgeInsets.only(bottom:D.default_15,top: D.default_15,left: D.default_5,right: D.default_5),
        margin: EdgeInsets.all(D.default_5),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(D.default_5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        )
        ,child: Center(child: Text(tr("login"),style:S.h4(color:C.BASE_BLUE)),)),));
  }
  Widget _registerBtn(){
    return  Expanded(child: InkWell(
      key: intro!.keys[2],
      onTap:(){
        MyUtils.navigate(context, RegistrationScreen());
      },child: Container(
        padding: EdgeInsets.only(bottom:D.default_15,top: D.default_15,left: D.default_5,right: D.default_5),
        margin: EdgeInsets.all(D.default_5),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(D.default_5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        )
        ,child: Center(child: Text(tr("register"),style:S.h4(color:C.BASE_BLUE)),)),),);
  }

Intro _myIntro(){
    List<String>descriptionsList=[
      tr("into_brows_btn"),
      tr("intro_login_btn"),
      tr("intro_register_btn")
    ];
   return MyUtils.myIntro(descriptionsList);
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
}
