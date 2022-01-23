import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/otp/otp_screem.dart';
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
              SizedBox(height: D.default_150,),
              _header(),
              _operationMessage(),
              SizedBox(height: D.default_100,),
              _phone(),
              SizedBox(height: D.default_30,),

              _nextBtn(),

            ],)
      ),);
  }
  Widget _phone() {
    return Container(
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
            hintStyle: S.h2(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: C.BASE_BLUE),
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: C.BASE_BLUE)),
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
        child: Center(child: Text(widget.title,style: S.h1(color: C.BASE_BLUE),textAlign: TextAlign.center,),));
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
          child: Center(child: Text(tr('send'),style: S.h1(color: Colors.white),textAlign: TextAlign.center,),)),);
  }

}
