
import 'package:alefakaltawinea_animals_app/modules/search/search_screen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:easy_localization/easy_localization.dart'hide TextDirection;
import 'package:flutter/material.dart';
import '../../modules/settings/settings_screen.dart';

class ActionBarWidget extends StatelessWidget {
  String title;
  Color textColor;
  Color backgroundColor;
  bool showSearch;
  bool enableShadow;
  bool showBack;
  bool showShare;
  BuildContext cxt;
  bool showSetting;
   ActionBarWidget(
       this.title,
       this.cxt,
       {this.textColor=Colors.white,
         this.backgroundColor=C.BASE_BLUE,
         this.showSearch=false,
         this.enableShadow=true,
         this.showSetting=true,
         this.showShare=false,
         this.showBack=true
       });

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr, child: Container(
      height: D.default_70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: backgroundColor,
          boxShadow:[BoxShadow(
              color: enableShadow?Colors.grey.withOpacity(0.5):Colors.white,
              offset:Offset(2,2),
              blurRadius:2,
              spreadRadius: 2
          )]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _backBtn(),
          showSearch?_searchBtn(context):Container(),
          showShare?_shareBtn(context):Container(),
          Expanded(child: Center(child: Directionality(textDirection: EasyLocalization.of(context)!.currentLocale==Locale('ar', 'EG')?TextDirection.rtl:TextDirection.ltr,child: Text(title,style: S.h1(color:textColor),),),)),
          settingsBtn()
        ],),
    ));
  }
  Widget _backBtn(){
    return showBack?Container(
      child:IconButton(onPressed: () {
        Navigator.of(cxt).pop();
      }, icon: Icon(Icons.arrow_back_ios,color: textColor,size: D.default_25,),) ,
    ):Container(width: D.default_80,);
  }
  Widget _searchBtn(BuildContext context){
    return Container(
      child:InkWell(onTap: () {
        MyUtils.navigate(context, SearchScreen(title));
      }, child: Icon(Icons.search,color: textColor,size: D.default_25,),) ,
    );
  }
  Widget _shareBtn(BuildContext context){
    return Container(
      child:InkWell(onTap: () {
        MyUtils.share();
      }, child: Icon(Icons.ios_share,color: textColor,size: D.default_25,),) ,
    );
  }
  Widget settingsBtn(){
    return showSetting?Container(
      child:IconButton(onPressed: () {
        MyUtils.navigate(cxt, SettingScreen());
      }, icon: Icon(Icons.segment,color: textColor,size: D.default_30,),) ,
    ):Container(width: D.default_30,);
  }



}
