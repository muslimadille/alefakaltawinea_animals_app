import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/login/login_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/login/provider/user_provider_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/input%20_validation_mixing.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  String phone,code;
   ForgetPasswordScreen(this.phone,this.code);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> with InputValidationMixin{
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  final _registerFormGlobalKey = GlobalKey<FormState>();
  bool passwordobsecure = true;
  bool confirmpasswordobsecure = true;
  UserProviderModel? userProviderModel;

@override
  void initState() {
    super.initState();
    userProviderModel=Provider.of<UserProviderModel>(context,listen: false);

}

  @override
  Widget build(BuildContext context) {
    userProviderModel=Provider.of<UserProviderModel>(context,listen: true);
    return BaseScreen(
      showSettings: false,
      showBottomBar: false,
      tag: "ForgetPasswordScreen",
      body:  Form(
        key:_registerFormGlobalKey ,
        child: Container(
          padding: EdgeInsets.all(D.default_50),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: D.default_200,),
                _header(),
                //_operationMessage(),
                SizedBox(height: D.default_80,),
                _password(),
                _confirmPassword(),
                SizedBox(height: D.default_50,),
                _submitBtn(context),

              ],)
        ),
      ),);
  }

  Widget _header(){
    return Container(
        child: Center(child: Text(tr("forget_password_title"),style: S.h1(color: C.BASE_BLUE),textAlign: TextAlign.center,),));
  }
  Widget _operationMessage(){
    return Container(
        padding: EdgeInsets.all(D.default_10),
        child: Center(child: Text(tr("forget_password_title"),style: S.h4(color: Colors.grey),textAlign: TextAlign.center,),));
  }
  Widget _submitBtn(BuildContext context){
    return InkWell(onTap: (){
      if (_registerFormGlobalKey.currentState!.validate()) {
        _registerFormGlobalKey.currentState!.save();
        userProviderModel!.resetPassword(context, _passwordController.text, _confirmPasswordController.text, widget.code, widget.phone);
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
          child: Center(child: Text(tr('submit'),style: S.h1(color: Colors.white),textAlign: TextAlign.center,),)),);
  }
  Widget _password() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _passwordController,
          validator: (password) {
            if (isFieldNotEmpty(password!)) {
              if (isPasswordValide(password)) {
                return null;
              } else {
                return tr("password_length");
              }
            } else {
              return tr("enter_password");
            }
          },
          style: S.h4(color: Colors.black),
          decoration: InputDecoration(
              hintText: tr("enter_password"),
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
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    passwordobsecure
                        ? passwordobsecure = false
                        : passwordobsecure = true;
                  });
                },
                icon: Icon(
                  (passwordobsecure ?? false)
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey,
                ),
              )),
          keyboardType: TextInputType.text,
          obscureText: passwordobsecure,
          cursorColor: C.BASE_BLUE,
          autofocus: false,
        ));
  }
  Widget _confirmPassword() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _confirmPasswordController,
          validator: (confirm) {
            if (isFieldNotEmpty(confirm!)) {
              if (isTowFieldsMached(_passwordController.text, confirm)) {
                return null;
              } else {
                return tr("not_confirm");
              }
            } else {
              return tr("confirm_password");
            }
          },
          style: S.h4(color: Colors.black),
          decoration: InputDecoration(
              hintText: tr("confirm_password"),
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
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    confirmpasswordobsecure
                        ? confirmpasswordobsecure = false
                        : confirmpasswordobsecure = true;
                  });
                },
                icon: Icon(
                  (confirmpasswordobsecure ?? false)
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey,
                ),
              )),
          keyboardType: TextInputType.text,
          obscureText: confirmpasswordobsecure,
          cursorColor: C.BASE_BLUE,
          autofocus: false,
        ));
  }

}
