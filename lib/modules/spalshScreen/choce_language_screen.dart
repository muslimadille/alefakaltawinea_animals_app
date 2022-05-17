import 'package:alefakaltawinea_animals_app/modules/homeTabsScreen/homeTabsScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/modules/spalshScreen/splash_two_screen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/providers.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:alefakaltawinea_animals_app/utils/providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/my_utils/baseDimentions.dart';
import '../../utils/my_utils/constants.dart';
import '../../utils/my_utils/myColors.dart';
import '../baseScreen/baseScreen.dart';

class ChoceLanguageScreen extends StatefulWidget {
  const ChoceLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChoceLanguageScreen> createState() => _ChoceLanguageScreenState();
}

class _ChoceLanguageScreenState extends State<ChoceLanguageScreen> {
  UtilsProviderModel? utilsProviderModel;
  @override
  void initState() {
    super.initState();
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: true);
    return BaseScreen(
        tag: "SplashScreen",
        showSettings: false,
        showBottomBar: false,
        body: Container(
            width: double.infinity,
            color: C.BASE_BLUE,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TransitionImage(
                  "assets/images/logo_name_white.png",
                  width: D.default_150,
                  height: D.default_150,
                ),
                SizedBox(
                  height: D.default_30,
                ),
                _button("عربي",()async{
                  await Constants.utilsProviderModel!.setCurrentLocal(context, Locale("en","US"));
                  await utilsProviderModel!.setCurrentLocal(context, Locale("en","US"));
                  await utilsProviderModel!.setLanguageState("en");
                  await Constants.utilsProviderModel!.setCurrentLocal(context, Locale("ar","EG"));
                  await utilsProviderModel!.setCurrentLocal(context, Locale("ar","EG"));
                  await utilsProviderModel!.setLanguageState("ar");
                  MyUtils.navigate(context, OnBoardingScreen());
                },

                ),
                SizedBox(
                  height: D.default_10,
                ),
                _button("English",()async{
                  await Constants.utilsProviderModel!.setCurrentLocal(context, Locale("ar","EG"));
                  await utilsProviderModel!.setCurrentLocal(context, Locale("ar","EG"));
                  await utilsProviderModel!.setLanguageState("ar");
                  await Constants.utilsProviderModel!.setCurrentLocal(context, Locale("en","US"));
                  await utilsProviderModel!.setCurrentLocal(context, Locale("en","US"));
                  await utilsProviderModel!.setLanguageState("en");
                  MyUtils.navigate(context, OnBoardingScreen());
                }),

              ],
            )));
  }
  Widget _button(String title,Function ontClick){
    return InkWell(onTap:(){
      ontClick();
    } ,child:Container(
      padding: EdgeInsets.all(D.default_5),
      height:D.default_60,
      width: D.default_200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(D.default_100),),
        border: Border.all(color: Colors.white),
        color: C.BASE_BLUE,
      ),
      child: Center(child: Container(
        padding: EdgeInsets.all(D.default_5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(D.default_100),),
          color: Colors.white,
        ),child: Center(child: Text(title,style: S.h1Bold(color: C.BASE_BLUE),textAlign:TextAlign.center ,),),

      ),),
    ));
  }
}
