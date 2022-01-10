
import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/homeScreen/homeTabsScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/homeScreen/provider/intro_provider_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:provider/provider.dart';


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

  @override
  void initState() {
    super.initState();
    intro=_myIntro();
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

      Future.delayed(Duration(milliseconds: 3000)).then((value) {
        setState(() {
          _isLoading=false;
        });
      });
    });


  }
  @override
  Widget build(BuildContext context) {
    introProviderModel =Provider.of<IntroProviderModel>(context, listen: true);
    return AnimatedContainer(duration: Duration(milliseconds: 2000),
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
    );
  }
  Widget _logoTitleItem(){
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 1000),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return  FadeTransition(child: child, opacity: animation);
      },
        child:_isLoading?Center(key: Key("1"),child: Image.asset(Res.APP_LOGO_NAME,width: D.default_200,height: D.default_200),):Center(key:Key("2"),child: Image.asset(Res.APP_LOGO_DARK,width: D.default_150,height: D.default_150)));
  }
  Widget _buttonsPart(){
    return FadeTransition(
        child:Container(
            padding: EdgeInsets.only(bottom:D.default_10,top: D.default_10,left: D.default_5,right: D.default_5),
            margin: EdgeInsets.only(bottom:D.default_40,top: D.default_20,left: D.default_80,right: D.default_80),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  key: intro!.keys[0],
                  onTap:(){
                    MyUtils.navigate(context, HomeTabsScreen(introProviderModel));
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
                    ,child: Center(child: Text(tr("brows_app_btn"),style:S.h4(color:C.BASE_BLUE)),)),),
                InkWell(
                  key: intro!.keys[1],
                  onTap:(){
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
                    ,child: Center(child: Text(tr("login"),style:S.h4(color:C.BASE_BLUE)),)),),
                Container(
                  padding: EdgeInsets.only(bottom:D.default_15,top: D.default_15,left: D.default_5,right: D.default_5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(tr("Dont_have_account"),style:S.h2(color:Colors.grey[200])),
                  InkWell(
                  key: intro!.keys[2],
                  onTap:(){

                  },child: Text(tr("register"),style:S.h2(color:Colors.white)),)
                ],),),
                SizedBox(height: D.default_40,),
              ],)), opacity: _animation!);
  }

Intro _myIntro(){
    List<String>descriptionsList=[
      tr("into_brows_btn"),
      tr("intro_login_btn"),
      tr("intro_register_btn")
    ];
   return MyUtils.myIntro(descriptionsList);
}

}
