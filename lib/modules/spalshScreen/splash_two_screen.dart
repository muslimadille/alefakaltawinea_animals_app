import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/my_utils/baseDimentions.dart';
import '../../utils/my_utils/baseTextStyle.dart';
import '../../utils/my_utils/myColors.dart';
import '../../utils/my_utils/myUtils.dart';
import '../baseScreen/baseScreen.dart';
import '../categories_screen/mainCategoriesScreen.dart';
import '../login/login_screen.dart';
import '../registeration/registration_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  Intro? intro;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        tag: "SplashScreen",
        showSettings: false,
        showBottomBar: false,
        body:Container(
          color:C.BASE_BLUE,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: TransitionImage(Res.ONBOARDING_BG,fit: BoxFit.cover,padding: EdgeInsets.all(D.default_10),),),
            _buttonsPart(),
            _termsPart()

          ],),));
  }
  Widget _termsPart(){
    return Container(
      height: D.default_40,
      margin: EdgeInsets.only(bottom: D.default_30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Checkbox(
          value: rememberMe,
          checkColor: C.BASE_BLUE,
          activeColor: Colors.white,
          onChanged: (value){
            _onRememberMeChanged(value!);
          }
      ),
      Text(tr("terms_text"),style: S.h4(color: Colors.white),)

    ],),);
  }
Widget _buttonsPart(){
    return Container(
        padding: EdgeInsets.only(bottom:D.default_10,top: D.default_10,left: D.default_5,right: D.default_5),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _browsApp(),
            _loginBtn(),
            _registerBtn(),
          ],));
  }
  Widget _browsApp(){
    return  Expanded(child: InkWell(
      onTap:(){
        if(rememberMe){
          MyUtils.navigate(context, MainCategoriesScreen());
        }else{
           Fluttertoast.showToast(msg:tr("accept_terms_toast"));
        }

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
      onTap:(){
        if(rememberMe){
          MyUtils.navigate(context, LoginScreen());
        }else{
          Fluttertoast.showToast(msg:tr("accept_terms_toast"));
        }
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
      onTap:(){
        if(rememberMe){
          MyUtils.navigate(context, RegistrationScreen());
        }else{
          Fluttertoast.showToast(msg:tr("accept_terms_toast"));
        }
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
  void _onRememberMeChanged(bool newValue) => setState(() {
    rememberMe = newValue;

    if (rememberMe) {
      // TODO: Here goes your functionality that remembers the user.
    } else {
      // TODO: Forget the user
    }
  });


  Intro _myIntro(){
    List<String>descriptionsList=[
      tr("into_brows_btn"),
      tr("intro_login_btn"),
      tr("intro_register_btn")
    ];
   return MyUtils.myIntro(descriptionsList);
}
}
