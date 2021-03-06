
import 'package:alefakaltawinea_animals_app/modules/login/data/user_data.dart';
import 'package:alefakaltawinea_animals_app/modules/login/provider/user_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/spalshScreen/spalshScreen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../modules/categories_screen/mainCategoriesScreen.dart';
import '../../modules/settings/change_language_dialog_widget.dart';
import '../../modules/settings/regions_dialog_widget.dart';
import '../../modules/spalshScreen/data/regions_model.dart';
import 'baseDimentions.dart';
import 'baseTextStyle.dart';
import 'myColors.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_share/flutter_share.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MyUtils{

  /// ........... navigation utils................................
  static void navigate(BuildContext context,Widget screen){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen)).then((value) {
      //Constants.utilsProviderModel!.setCurrentLocal(context, Constants.utilsProviderModel!.currentLocal);
    });
  }
  static void navigateAsFirstScreen(BuildContext context,Widget screen){
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => screen)).then((value) {
      //Constants.utilsProviderModel!.setCurrentLocal(context, Constants.utilsProviderModel!.currentLocal);
    });
  }

  static void navigateReplaceCurrent(BuildContext context,Widget screen){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => screen)).then((value) {
      //Constants.utilsProviderModel!.setCurrentLocal(context, Constants.utilsProviderModel!.currentLocal);
    });
  }
  ///========================intor utils===================================================
  static  Intro myIntro(List<String> descriptionsList){
    Intro? intro;
     intro = Intro(
      noAnimation: false,
      stepCount: descriptionsList.length,
      maskClosable: true,
      onHighlightWidgetTap: (introStatus) {
        print(introStatus);
      },
      padding: EdgeInsets.all(D.default_2),
      borderRadius: BorderRadius.all(Radius.circular(D.default_5)),
      widgetBuilder: StepWidgetBuilder.useAdvancedTheme(widgetBuilder:(params){
        return Container(
          width: double.infinity,
          decoration:  BoxDecoration(
            color: C.BASE_BLUE,
            borderRadius: BorderRadius.all(Radius.circular(D.default_5)),

          ),
          child: Column(children: [
            Expanded(
              flex: 0,
              child:Container(
                padding: EdgeInsets.only(top:D.default_20,left:D.default_10,right: D.default_10),
                child: Text(descriptionsList[intro!.getStatus().currentStepIndex],style: S.h3(color: Colors.white,),)),),
            Container(
              height: D.default_70,
                padding: EdgeInsets.all(D.default_10),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    intro.getStatus().currentStepIndex<descriptionsList.length-1?InkWell(
                      onTap:(){
                        params.onNext!();
                      },child: Container(
                        margin: EdgeInsets.all(D.default_5),
                        padding: EdgeInsets.only(top:D.default_5,bottom: D.default_5,left: D.default_15,right: D.default_15),
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
                        ,child: Center(child: Text(tr("Next"),style:S.h4(color:C.BASE_BLUE)),)),):Container(),
                    intro.getStatus().currentStepIndex>0? InkWell(
                      onTap:(){
                        params.onPrev!();
                      },child: Container(
                        margin: EdgeInsets.all(D.default_5),
                        padding: EdgeInsets.only(top:D.default_5,bottom: D.default_5,left: D.default_15,right: D.default_15),
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
                        ,child: Center(child: Text(tr("Previous"),style:S.h4(color:C.BASE_BLUE)),)),):Container(),
                    InkWell(
                      onTap:(){
                        params.onFinish();
                      },child: Container(
                        margin: EdgeInsets.all(D.default_5),
                        padding: EdgeInsets.only(top:D.default_5,bottom: D.default_5,left: D.default_15,right: D.default_15),
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
                        ,child: Center(child: Text(tr("Hide"),style:S.h4(color:C.BASE_BLUE)),)),),
                  ],))

          ],),
        );
      } ),
    );
    return intro;
  }
  static void printLongLine(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static languageDialog(BuildContext context,Widget body,UtilsProviderModel? utilsProviderModel,
  {bool isDismissible = true,}) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {// return object of type Dialog
        return WillPopScope(
            onWillPop: isDismissible ? _onWillPop : _onWillNotPop,
            child: AlertDialog(
              contentPadding: EdgeInsets.all(0),
              content:ChangeLanguageDialogWidget(),
            ));
      },
    );
  }
  static regionsDialog(BuildContext context,UtilsProviderModel? utilsProviderModel,
  UserProviderModel?userProviderModel,

      {bool isDismissible = true,}) {
    userProviderModel=Provider.of<UserProviderModel>(context,listen: false);
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {

        // return object of type Dialog
        return WillPopScope(
            onWillPop: isDismissible ? _onWillPop : _onWillNotPop,
            child: AlertDialog(
              contentPadding: EdgeInsets.all(0),
              content:RegionsDialogWidget(),
            ));
      },
    );
  }
  static Future<bool> _onWillPop() async {
    return  true;
  }

  static Future<bool> _onWillNotPop() async {
    return  false;
  }
  static Future<void> share() async {
    await FlutterShare.share(
        title: '?????????? ?????????? ',
        linkUrl: Constants.APP_LINK);
  }
  static openwhatsapp(BuildContext context) async{
    var whatsapp ="${Constants.APP_INFO!.whatsapp}";
    var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("")}";
    if(Platform.isIOS){
      // for iOS phone only
      if( await canLaunch(whatappURL_ios)){
        await launch(whatappURL_ios, forceSafariVC: false);
      }else{
        await Fluttertoast.showToast(msg: "???????????? ?????????? whatsapp ???????????? ???? ?????????????? ????????");
      }
    }else{
      // android , web
      if( await canLaunch(whatsappURl_android)){
        await launch(whatsappURl_android);
      }else{
        await Fluttertoast.showToast(msg: "???????????? ?????????? whatsapp ???????????? ???? ?????????????? ????????");

      }
    }
  }


}

class ChangeLangageDialogWidget {
}