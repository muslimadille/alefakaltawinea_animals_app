import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/login/login_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/otp/otp_screem.dart';
import 'package:alefakaltawinea_animals_app/modules/registeration/registration_screen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/input%20_validation_mixing.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PhoneScreen extends StatefulWidget {
  String otpFalge;
  String title;
   PhoneScreen(this.title,this.otpFalge) ;

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> with InputValidationMixin{
  TextEditingController _phoneController = TextEditingController();
  final _registerFormGlobalKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showSettings: false,
      showBottomBar: false,
      tag: "OtpScreen",
      body:  Container(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.35,),
              _header(),
              //_operationMessage(),
              SizedBox(height: D.default_20,),
              _phone(),
              SizedBox(height: D.default_30,),
              _nextBtn(),
              SizedBox(height: D.default_80,),
              _loginPart()

            ],)
      ),);
  }
  Widget _phone() {
    return Container(
      margin: EdgeInsets.only(left:D.default_50,right: D.default_50),
        width: double.infinity,
        child: Form(
          key: _registerFormGlobalKey,
          child: TextFormField(
          controller: _phoneController,
          validator: (phone) {
            if (isFieldNotEmpty(phone!)) {
              if (isPhoneValide(phone)) {
              } else {
                return tr("enter_10_numbers");
              }
            } else {
              return tr("enter_phone");
            }
          },
          decoration: InputDecoration(
              hintText: tr("enter_phone"),
              hintStyle: S.h4(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: C.BASE_BLUE),
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: C.BASE_BLUE),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorStyle: S.h4(color: Colors.red),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),

          ),
          keyboardType: TextInputType.phone,
          obscureText: false,
          cursorColor: C.BASE_BLUE,
          autofocus: false,
        ),));
  }
  Widget _header(){
    return Container(
        child:
        Center(child: Text(widget.title,style: S.h1(color: C.BASE_BLUE),textAlign: TextAlign.center,),));
  }
  Widget _operationMessage(){
    return Container(
        padding: EdgeInsets.all(D.default_10),
        child: Center(child: Text(tr("otp_phon"),style: S.h4(color: Colors.grey),textAlign: TextAlign.center,),));
  }
  Widget _nextBtn(){
    return InkWell(onTap: (){
      if (_registerFormGlobalKey.currentState!.validate()) {
        _registerFormGlobalKey.currentState!.save();
      MyUtils.navigate(context, OtpScreen(widget.otpFalge, widget.title,phone:_phoneController.text));
      }
    }
      ,child: Container(
          width: D.default_200,
          padding: EdgeInsets.all(D.default_10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(D.default_15),
              color: C.BASE_BLUE,
              boxShadow:[BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset:Offset(2,2),
                  blurRadius:4,
                  spreadRadius: 2
              )]
          ),
          child: Center(child: Text(widget.otpFalge!="ForgetPasswordScreen"?tr('send'):tr('return'),style: S.h1(color: Colors.white),textAlign: TextAlign.center,),)),);
  }
  Widget _loginPart(){
    return Container(
      height: D.default_50,
      padding: EdgeInsets.all(D.default_5),
      margin: EdgeInsets.all(D.default_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      InkWell(onTap: (){
        MyUtils.navigate(context, RegistrationScreen());
      },child:Text(tr("new_regist"),style: S.h2(color: C.BASE_BLUE),),
      ),
      Container(
        margin: EdgeInsets.all(D.default_10),
        color: Colors.grey,width: D.default_1,height: double.infinity,),
      InkWell(onTap: (){
        MyUtils.navigate(context, LoginScreen());
      },child:Text(tr("login_header"),style: S.h2(color: C.BASE_BLUE),),
      ),
    ],),);
  }

}
