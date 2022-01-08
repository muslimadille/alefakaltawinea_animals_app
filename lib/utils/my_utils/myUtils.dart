
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';

import 'baseDimentions.dart';
import 'baseTextStyle.dart';

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
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.all(Radius.circular(D.default_5)),
      widgetBuilder: StepWidgetBuilder.useAdvancedTheme(widgetBuilder:(params){
        return Container(
          decoration:  BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.all(Radius.circular(D.default_5)),

          ),
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top:D.default_20,left:D.default_10,right: D.default_10),
              child: Expanded(child: Text(descriptionsList[intro!.getStatus().currentStepIndex],style: S.h3(color: Colors.white),),),),
            Container(
                padding: EdgeInsets.all(D.default_10),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap:(){
                          params.onNext!();
                        },child: Container(
                          margin: EdgeInsets.all(D.default_5),
                          padding: EdgeInsets.all(D.default_5),
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
                          ,child: Center(child: Text(tr("Next"),style:S.h4(color:Colors.blue)),)),),
                    ),
                    Expanded( flex: 1,child: InkWell(
                      onTap:(){
                        params.onPrev!();
                      },child: Container(
                        margin: EdgeInsets.all(D.default_5),
                        padding: EdgeInsets.all(D.default_5),
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
                        ,child: Center(child: Text(tr("Previous"),style:S.h4(color:Colors.blue)),)),)),
                    Expanded( flex: 1,child: InkWell(
                      onTap:(){
                        params.onFinish();
                      },child: Container(
                        margin: EdgeInsets.all(D.default_5),
                        padding: EdgeInsets.all(D.default_5),
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
                        ,child: Center(child: Text(tr("Hide"),style:S.h4(color:Colors.blue)),)),),)
                  ],))

          ],),
        );
      } ),
    );
    return intro;
  }

}