import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart'hide TextDirection;
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
import '../settings/terms_screen.dart';

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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: C.BASE_BLUE,
            child: Stack(
          textDirection:TextDirection.rtl,
          alignment: Alignment.center,
          children: [
            _cartWithAnimalsImage(),
            _blueCart(),
            _textCart(),
            _orangeCart(),
            _navigationPart(),
            _buyCardbutton()
          ],
        )),);
  }
  Widget _orangeCart() {
    return Positioned(child: TransitionImage(
      "assets/images/orange_splash_bg.png",
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    ),bottom: 0,);
  }
  Widget _textCart(){
    return Positioned(child: Container(
        width: MediaQuery.of(context).size.width,
        child:Column(children: [
          Text(tr("alefak_card"),style: S.h1Bold(color: Colors.white,fontSize: D.h1*1.5),textAlign: TextAlign.center),
          Text(tr("Because they deserve your attention"),style: S.h2(color: Colors.white),textAlign: TextAlign.center,)

        ],)),bottom:MediaQuery.of(context).size.height * 0.54 ,);
  }
  Widget _blueCart() {
    return Positioned(child: TransitionImage(
      "assets/images/move_splash_bg.png",
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    ),bottom: 0,);
  }

  Widget _cartWithAnimalsImage() {
    return Positioned(child: TransitionImage(
      "assets/images/cart_with_animals.png",
      height: MediaQuery.of(context).size.height * 0.28,
      fit: BoxFit.fitHeight,
    ),top:D.default_10,);
  }
  Widget _navigationPart(){
    return Positioned(child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buttonsPart(),
        _termsPart()
      ],),),bottom: 0,);
  }
  Widget _termsPart(){
    return Container(
      height: D.default_40,
      margin: EdgeInsets.only(bottom: D.default_30,left: D.default_20,right: D.default_20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Checkbox(
          value: rememberMe,
          side: BorderSide(color: Colors.white),
          checkColor: C.BASE_BLUE,
          activeColor: Colors.white,
          onChanged: (value){
            _onRememberMeChanged(value!);
          }
      ),
      InkWell(onTap: (){
        MyUtils.navigate(context, TermsScreen(hideButtomBar: true,));
      },
        child: Text(tr("terms_text"),style: S.h3(color: Colors.white),),
      )

    ],),);
  }
Widget _buttonsPart(){
    return Container(
        padding: EdgeInsets.only(bottom:D.default_10,top: D.default_10,left: D.default_30,right: D.default_30),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerBtn(),
            _browsApp(),
            _loginBtn(),

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
        padding: EdgeInsets.only(bottom:D.default_10,top: D.default_10,left: D.default_10,right: D.default_10),
        margin: EdgeInsets.all(D.default_5),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(D.default_10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        )
        ,child: Center(child: Text(tr("brows_app_btn"),style:S.h3(color:C.BASE_BLUE)),)),));
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
        padding: EdgeInsets.only(bottom:D.default_10,top: D.default_10,left: D.default_10,right: D.default_10),
        margin: EdgeInsets.all(D.default_5),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(D.default_10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        )
        ,child: Center(child: Text(tr("login"),style:S.h3(color:C.BASE_BLUE)),)),));
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
        padding: EdgeInsets.only(bottom:D.default_10,top: D.default_10,left: D.default_10,right: D.default_10),
        margin: EdgeInsets.all(D.default_5),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(D.default_10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        )
        ,child: Center(child: Text(tr("register"),style:S.h3(color:C.BASE_BLUE)),)),),);
  }
  void _onRememberMeChanged(bool newValue) => setState(() {
    rememberMe = newValue;

    if (rememberMe) {
      // TODO: Here goes your functionality that remembers the user.
    } else {
      // TODO: Forget the user
    }
  });
  Widget _buyCardbutton() {
    return Positioned(child: InkWell(onTap: () {
      MyUtils.navigate(context, LoginScreen());
    }, child: Container(
      padding: EdgeInsets.all(D.default_5),
      height: D.default_60,
      width: D.default_200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(D.default_100),),
      ),
      child: Center(child: Container(
        padding: EdgeInsets.all(D.default_5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(D.default_100),),
          color: Colors.white,
        ),
        child: Center(child: Text(tr("buy_card"), style: S.h1Bold(color: C.BASE_BLUE),
          textAlign: TextAlign.center,),),

      ),),
    )),bottom: MediaQuery.of(context).size.height*0.35,);
  }




}
