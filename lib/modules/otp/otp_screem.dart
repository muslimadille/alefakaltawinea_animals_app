import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/mainCategoriesScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/login/forget_password/forget_password_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/login/provider/user_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/otp/provider/otp_provider_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/action_bar_widget.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';


class OtpScreen extends StatefulWidget {
  String otpFalge;
  String title;
  String code;
  String? phone;
   OtpScreen(this.otpFalge,this.title,{this.code="",this.phone});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _userCode="";
  OtpProviderModel? otpProviderModel;
  UserProviderModel? userProviderModel;
  @override
  void initState() {
    super.initState();
    otpProviderModel=Provider.of<OtpProviderModel>(context,listen: false);
    userProviderModel=Provider.of<UserProviderModel>(context,listen: false);
    _getCode();
  }
  @override
  Widget build(BuildContext context) {
    otpProviderModel=Provider.of<OtpProviderModel>(context,listen: true);
    userProviderModel=Provider.of<UserProviderModel>(context,listen: true);

    return BaseScreen(
      showSettings: false,
      showBottomBar: false,
      tag: "OtpScreen",
      body:  SingleChildScrollView(child: Container(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _header(),
              _operationMessage(),
              SizedBox(height: D.default_30,),
              _otpField(),
              _useCodeBtn(),
              SizedBox(height: D.default_20,),
              _resendCodeBtn(),

            ],)
      ),),);
  }
  Widget _header(){
    return Container(
        child: Center(child: Text(tr("active_acount"),style: S.h1(color: C.BASE_BLUE),textAlign: TextAlign.center,),));
  }
  Widget _operationMessage(){
    return Container(
      padding: EdgeInsets.all(D.default_10),
        child: Center(child: Text(tr("otp_phon"),style: S.h4(color: Colors.grey),textAlign: TextAlign.center,),));
  }
  Widget _useCodeBtn(){
    return InkWell(onTap: (){
      if(otpProviderModel!.activation_code.toString()==_userCode||widget.code==_userCode){
        if(widget.otpFalge=="ForgetPasswordScreen"){
          MyUtils.navigate(context, ForgetPasswordScreen(widget.phone!, _userCode));
        }else{
          otpProviderModel!.activeAccount(Constants.currentUser!=null?Constants.currentUser!.phone!:widget.phone!, _userCode, context);
        }
        //MyUtils.navigateAsFirstScreen(context, MainCategoriesScreen());
        ///call api here
      }else{
        Fluttertoast.showToast(msg:tr("كود التفعيل غير صحيح"));
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
        child: Center(child: Text(tr("submit"),style: S.h1(color: Colors.white),textAlign: TextAlign.center,),)),);
  }
  Widget _resendCodeBtn(){
    return InkWell(onTap: (){
      _resendCode();
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
          child: Center(child: Text(tr("resend"),style: S.h1(color: Colors.white),textAlign: TextAlign.center,),)),);
  }

  Widget _otpField(){
    return Directionality(textDirection: TextDirection.ltr, child: Container(
      padding: EdgeInsets.all(D.default_30),
      child: OTPTextField(
        length: Constants.OTP_LENGTH,
        width: double.infinity,
        fieldWidth: D.default_50,
        otpFieldStyle:OtpFieldStyle(
            borderColor:C.BASE_BLUE
        ),
        style: TextStyle(
            fontSize: D.default_20
        ),
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.box,
        onCompleted: (pin) {
          setState(() {
            _userCode=pin;
          });
        },
      ),));
}
 void _getCode(){
    if(widget.phone!=null){
      otpProviderModel!.getCode(widget.phone!, context);
    }
 }
  void _resendCode()async{
    if(widget.phone!=null){
      await otpProviderModel!.getCode(widget.phone!, context);
      widget.code=otpProviderModel!.activation_code.toString();
    }else{
      otpProviderModel!.getCode(Constants.currentUser!.phone!, context);
    }
  }
  void _resetPassword(){
    if(widget.otpFalge=="ForgetPasswordScreen"){
      _resendCode();
    }
  }

}
