
import 'package:alefakaltawinea_animals_app/modules/homeScreen/homeTabsScreen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';


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
    return AnimatedContainer(duration: Duration(milliseconds: 2000),
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
    ) ;
  }
  Widget _logoTitleItem(){
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 1000),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return  FadeTransition(child: child, opacity: animation);
      },
        child:_isLoading?Center(key: Key("1"),child: Image.asset(Res.APP_LOGO_NAME,width: D.default_150,height: D.default_150),):Center(key:Key("2"),child: Image.asset(Res.APP_LOGO_DARK,width: D.default_150,height: D.default_150)));
  }
  Widget _buttonsPart(){
    return FadeTransition(
        child:Container(
            padding: EdgeInsets.only(bottom:D.default_10,top: D.default_10,left: D.default_5,right: D.default_5),
            margin: EdgeInsets.only(bottom:D.default_20,top: D.default_20,left: D.default_50,right: D.default_50),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  key: intro!.keys[0],
                  flex: 1,
                  child: InkWell(
                    onTap:(){
                    },child: Container(
                      padding: EdgeInsets.only(bottom:D.default_10,top: D.default_10,left: D.default_5,right: D.default_5),
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
                      ,child: Center(child: Text(tr("login"),style:S.h4(color:Colors.blue)),)),),
                ),
                Expanded(
                    key: intro!.keys[1],
                    flex: 1,child: InkWell(
                  onTap:(){
                  },child: Container(
                    padding: EdgeInsets.only(bottom:D.default_10,top: D.default_10,left: D.default_5,right: D.default_5),
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
                    ,child: Center(child: Text(tr("register"),style:S.h4(color:Colors.blue)),)),)),
                Expanded(
                  key: intro!.keys[2],
                  flex: 1,child: InkWell(
                  onTap:(){
                    MyUtils.navigate(context, HomeTabsScreen());
                  },child: Container(
                    padding: EdgeInsets.only(bottom:D.default_10,top: D.default_10,left: D.default_5,right: D.default_5),
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
                    ,child: Center(child: Text(tr("brows_app_btn"),style:S.h4(color:Colors.blue)),)),),)
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
