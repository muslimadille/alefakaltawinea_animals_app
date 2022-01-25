import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/login/login_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/registeration/registration_screen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NoProfileScreen extends StatelessWidget {
  const NoProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showSettings: false,
      showBottomBar: true,
      tag: "ProfileScreen",
      body: Column(
        children: [
          TransitionImage(
            Res.NO_PROFILE_BG,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
         Expanded(child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
           _loginBtn(context),
           _registerBtn(context)
         ],))
        ],
      ),
    );
  }
  Widget _loginBtn(BuildContext context){
    return Center(child: InkWell(
      onTap: (){
        MyUtils.navigate(context, LoginScreen());
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left:D.default_30,right: D.default_30,top: D.default_10,bottom: D.default_10),
        padding: EdgeInsets.only(left:D.default_20,right: D.default_20,top: D.default_10,bottom: D.default_10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_10),
            border: Border.all(color: C.BASE_BLUE),
            color: Colors.white,
            boxShadow:[BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset:Offset(2,2),
                blurRadius:4,
                spreadRadius: 2
            )]
        ),
        child: Text(tr("login"),style: S.h2(color: C.BASE_BLUE),textAlign:TextAlign.center ,),),),);
  }
  Widget _registerBtn(BuildContext context){
    return Center(child: InkWell(
      onTap: (){
        MyUtils
        .navigate(context, RegistrationScreen());
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left:D.default_30,right: D.default_30,top: D.default_10,bottom: D.default_10),
        padding: EdgeInsets.only(left:D.default_20,right: D.default_20,top: D.default_10,bottom: D.default_10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_10),
            color: C.BASE_BLUE,
            boxShadow:[BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset:Offset(2,2),
                blurRadius:4,
                spreadRadius: 2
            )]
        ),
        child: Text(tr("register_new"),style: S.h2(color: Colors.white),textAlign:TextAlign.center ,),),),);
  }
}
