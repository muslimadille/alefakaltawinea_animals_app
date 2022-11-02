import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

import '../../utils/my_utils/baseDimentions.dart';
import '../../utils/my_utils/baseTextStyle.dart';
import '../../utils/my_utils/myColors.dart';
import '../../utils/my_utils/myUtils.dart';
import '../../utils/my_utils/providers.dart';
import '../categories_screen/mainCategoriesScreen.dart';
import '../spalshScreen/spalshScreen.dart';

class ChangeLanguageDialogWidget extends StatefulWidget {
  const ChangeLanguageDialogWidget({Key? key}) : super(key: key);

  @override
  _ChangeLanguageDialogWidgetState createState() => _ChangeLanguageDialogWidgetState();
}

class _ChangeLanguageDialogWidgetState extends State<ChangeLanguageDialogWidget> {
  UtilsProviderModel? _utilsProviderModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    _utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: true);
    return Container(

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
                  Radio(value: true, groupValue:_utilsProviderModel!.isArabic,toggleable: true,activeColor:C.BASE_BLUE, onChanged: ( val ){
                    bool currentValue=val as bool ;
                    currentValue?_utilsProviderModel!.setLanguageState("ar"):_utilsProviderModel!.setLanguageState("en");
                    setState(() {

                    });

                  }),
                  Text("العربية", style: S.h2(color: Colors.black))
                ],)),
            Container(width: double.infinity,height: D.default_1,color: Colors.grey,),
            Container(
                padding: EdgeInsets.all(D.default_10),
                child: Row(children: [
                  Radio(value: true, groupValue:_utilsProviderModel!.isEnglish, toggleable: true,activeColor:C.BASE_BLUE,onChanged: ( val ){
                    bool currentValue=val as bool ;
                    currentValue?_utilsProviderModel!.setLanguageState("en"):_utilsProviderModel!.setLanguageState("ar");
setState(() {

});
                  }),
                  Text("English", style: S.h2(color: Colors.black))
                ],)),
            Container(width: double.infinity,height: D.default_1,color: Colors.grey,),
            Container(child:Row(mainAxisAlignment: MainAxisAlignment.end,children: [
              InkWell(onTap: ()async{
                if(_utilsProviderModel!.isArabic){
                  await _utilsProviderModel!.setCurrentLocal(Constants.mainContext!, Locale("ar","EG"));
                  //Navigator.pop(context);
                  MyUtils.navigate(context, SplashScreen(toHome: true,));

                }else{
                  await _utilsProviderModel!.setCurrentLocal(Constants.mainContext!, Locale("en","US"));
                  //Navigator.pop(context);
                  MyUtils.navigate(context, SplashScreen(toHome: true,));
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

          ],));
  }
}
