import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/mainCategoriesScreen.dart';
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
  @override
  void initState() {
    super.initState();
    otpProviderModel=Provider.of<OtpProviderModel>(context,listen: false);
    _getCode();
  }
  @override
  Widget build(BuildContext context) {
    otpProviderModel=Provider.of<OtpProviderModel>(context,listen: true);
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
              _otpField(),
            _useCodeBtn(),
              SizedBox(height: D.default_10,),
              Center(child:Text("${widget.code}",style: S.h4(color:Colors.grey),textAlign:TextAlign.center ,))

          ],)
      ),);
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
  Widget _useCodeBtn(){
    return InkWell(onTap: (){
      if(widget.code==_userCode){
        //MyUtils.navigateAsFirstScreen(context, MainCategoriesScreen());
        otpProviderModel!.activeAccount(Constants.currentUser!.phone!, widget.code, context, Constants.currentUser!);
        ///call api here
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
        child: Center(child: Text(widget.title,style: S.h1(color: Colors.white),textAlign: TextAlign.center,),)),);
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
  void _resendCode(){
    if(widget.phone!=null){
      otpProviderModel!.getCode(widget.phone!, context);
    }else{
      otpProviderModel!.getCode(Constants.currentUser!.phone!, context);
    }
  }

}
