import 'package:alefakaltawinea_animals_app/main.dart';
import 'package:alefakaltawinea_animals_app/modules/search/search_screen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:flutter/material.dart';

class ActionBarWidget extends StatelessWidget {
  String title;
  Color textColor;
  Color backgroundColor;
  bool showSearch;
  BuildContext cxt;
   ActionBarWidget(
       this.title,
       this.cxt,
       {this.textColor=Colors.white,
         this.backgroundColor=C.BASE_BLUE,
         this.showSearch=false
       });

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr, child: Container(
      height: D.default_70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: backgroundColor,
          boxShadow:[BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset:Offset(2,2),
              blurRadius:2,
              spreadRadius: 2
          )]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex:1,child: _backBtn(),),
          Expanded(flex:1,child:showSearch?_searchBtn(context):Container(),),
          Expanded(flex: 8,child: Center(child: Text(title,style: S.h1(color:textColor),),)),
          Expanded(flex:1,child: Container(),),
          Expanded(flex:1,child: Container(),),


        ],),
    ));
  }
  Widget _backBtn(){
    return Container(
      padding:EdgeInsets.only(left:D.default_10,right:D.default_10),
      child:IconButton(onPressed: () {
        Navigator.of(cxt).pop();
      }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: D.default_25,),) ,
    );
  }
  Widget _searchBtn(BuildContext context){
    return Container(
      padding:EdgeInsets.only(left:D.default_10,right:D.default_10),
      child:IconButton(onPressed: () {
        MyUtils.navigate(context, SearchScreen(title));
      }, icon: Icon(Icons.search,color: Colors.white,size: D.default_25,),) ,
    );
  }



}
