
import 'package:alefakaltawinea_animals_app/utils/my_utils/providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:provider/provider.dart';
import 'baseDimentions.dart';
import 'baseTextStyle.dart';
import 'myColors.dart';

class MyUtils{


  static void navigate(BuildContext context,Widget screen){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }
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
      builder: (BuildContext context) {
        // return object of type Dialog
        return WillPopScope(
            onWillPop: isDismissible ? _onWillPop : _onWillNotPop,
            child: AlertDialog(
              contentPadding: EdgeInsets.all(0),
              content:Container(

                  height: D.default_300,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(D.default_10),
                        child: Text(tr("select_language"),style: S.h1(color: C.BASE_BLUE),textAlign:TextAlign.center ,),),
                      Container(width: double.infinity,height: D.default_1,color: Colors.grey,),
                      Container(
                          padding: EdgeInsets.all(D.default_10),
                          child: Row(children: [
                            Radio(value: true, groupValue:utilsProviderModel!.isArabic,toggleable: true,activeColor:C.BASE_BLUE, onChanged: ( val ){
                              bool currentValue=val as bool ;
                              currentValue?utilsProviderModel!.setLanguageState("ar"):utilsProviderModel!.setLanguageState("en");

                            }),
                            Text("العربية", style: S.h2(color: Colors.black))
                          ],)),
                         Container(width: double.infinity,height: D.default_1,color: Colors.grey,),
                      Container(
                          padding: EdgeInsets.all(D.default_10),
                          child: Row(children: [
                            Radio(value: true, groupValue:utilsProviderModel!.isEnglish, toggleable: true,activeColor:C.BASE_BLUE,onChanged: ( val ){
                              bool currentValue=val as bool ;
                              currentValue?utilsProviderModel!.setLanguageState("en"):utilsProviderModel!.setLanguageState("ar");
                            }),
                            Text("English", style: S.h2(color: Colors.black))
                          ],)),
                      Container(width: double.infinity,height: D.default_1,color: Colors.grey,),
                      Container(child:Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                        InkWell(onTap: ()async{
                          if(utilsProviderModel.isArabic){
                            await utilsProviderModel.setCurrentLocal(context, Locale("ar","EG"));
                            Navigator.pop(context);
                          }else{
                            await utilsProviderModel.setCurrentLocal(context, Locale("en","US"));
                            Navigator.pop(context);
                          }
                        },child: Container(
                            padding: EdgeInsets.all(D.default_15),
                            child: Text(tr("confirm"), style: S.h2(color: C.BASE_BLUE))),),
                        InkWell(onTap: (){
                          Navigator.pop(context);
                        },child: Container(
                            padding: EdgeInsets.all(D.default_15),
                            child: Text(tr("cancel"), style: S.h2(color: C.BASE_BLUE))),)
                      ],))

                    ],)),
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


}