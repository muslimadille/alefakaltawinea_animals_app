import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/providers.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/action_bar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  UtilsProviderModel? utilsProviderModel;
  bool _showLangAlert=false;
  @override
  Widget build(BuildContext context) {
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: true);
    return Stack(children: [
      BaseScreen(
        showSettings: false,
        showBottomBar: true,
        tag: "SettingScreen",
        body: Container(
          child: Column(
            children: [
              ActionBarWidget(tr("Settings_title"), context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(D.default_10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: D.default_10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _itemText(tr("select_language"), (){}),
                            Container(
                                width: D.default_150,
                                padding: EdgeInsets.only(left:D.default_10,right: D.default_10,top: D.default_5,bottom: D.default_5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(D.default_100),
                                    color: C.BASE_BLUE,
                                    boxShadow:[BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        offset:Offset(1,1),
                                        blurRadius:1,
                                        spreadRadius: 0.5
                                    )]
                                ),
                                child: InkWell(
                                  onTap: (){
                                    MyUtils.languageDialog(context, _changeLnguagesAlertBody(),utilsProviderModel,isDismissible:true);
                                  },
                                  child: Center(child: Text(utilsProviderModel!.currentLocalName,style: S.h3(color: Colors.white),),),)

                            )
                          ],),
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _itemText(tr("select_city"), (){}),
                            Container(
                                width: D.default_150,
                                padding: EdgeInsets.only(left:D.default_10,right: D.default_10,top: D.default_5,bottom: D.default_5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(D.default_100),
                                    color: C.BASE_BLUE,
                                    boxShadow:[BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        offset:Offset(1,1),
                                        blurRadius:1,
                                        spreadRadius: 0.5
                                    )]
                                ),
                                child: Center(child: Text(utilsProviderModel!.currentLocalName,style: S.h3(color: Colors.white),),)

                            )
                          ],),
                        _itemText(tr("about_app"), () {}),
                        _itemText(tr("contact_us"), () {}),
                        _itemText(tr("Terms_and_Conditions"), (){}),*/




                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      _showLangAlert?_changeLnguagesAlertBody():Container()
    ],);
  }

  Widget _itemText(String title, Function onClick) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.all(D.default_15),
            child: Text(title, style: S.h2(color: Colors.black)))
      ],
    );
  }
  Widget _changeLnguagesAlertBody(){
    bool arStat=utilsProviderModel!.isArabic;
    bool enStat=utilsProviderModel!.isEnglish;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.5),
      child: Center(child:Container(

        height: D.default_300,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(D.default_10),
              child: Text(tr("select_language"),style: S.h2(color: Colors.black),textAlign:TextAlign.start ,),),
            _devider(),
            Container(
                padding: EdgeInsets.all(D.default_10),
                child: Row(children: [
                  Radio(value: true, groupValue:arStat,toggleable: true, onChanged: ( val ){

                    bool currentValue=val as bool ;
                    arStat=currentValue;
                    currentValue?utilsProviderModel!.setLanguageState("ar"):utilsProviderModel!.setLanguageState("en");
                    setState(() {

                    });
                  }),
                  Text("العربية", style: S.h2(color: Colors.black))
                ],)),
            _devider(),
            Container(
                padding: EdgeInsets.all(D.default_10),
                child: Row(children: [
                  Radio(value: true, groupValue:enStat, toggleable: true,onChanged: ( val ){
                    bool currentValue=val as bool ;
                    enStat=currentValue;
                    currentValue?utilsProviderModel!.setLanguageState("en"):utilsProviderModel!.setLanguageState("ar");
                    setState(() {

                    });
                  }),
                  Text("English", style: S.h2(color: Colors.black))
                ],)),
          ],))),);
  }
  Widget _devider(){
    return Container(width: double.infinity,height: D.default_1,color: Colors.grey,);
  }
}
