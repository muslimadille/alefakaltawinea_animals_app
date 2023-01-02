import 'package:alefakaltawinea_animals_app/modules/categories_screen/mainCategoriesScreen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';

import '../../modules/spalshScreen/data/regions_model.dart';
import 'package:get/get.dart';


class UtilsProviderModel with ChangeNotifier {
  bool isArabic=true;
  bool isEnglish=false;
  Locale currentLocal =Locale('ar', 'EG');
  String currentLocalName="العربية";
  int currentRegionIndex=0;
  int currentStateIndex=0;



  setCurrentRegionIndex(int value){
  currentRegionIndex=value;
  notifyListeners();
}
  setCurrentStateIndex(int value){
    currentStateIndex=value;
    Constants.currentState=value;
    notifyListeners();
  }
  setCurrentLocal(BuildContext ctx,Locale locale)  async {
    currentLocal=locale;
    await ctx.setLocale(locale);
    await Get.updateLocale(locale);
    if(locale==Locale('ar', 'EG')){
      currentLocalName="العربية";
      Constants.SELECTED_LANGUAGE="ar";
      await Constants.prefs!.setString(Constants.LANGUAGE_KEY!, "ar");
      setLanguageState("ar");
    }
    else if(locale==Locale('en', 'US')){
      currentLocalName="English";
      Constants.SELECTED_LANGUAGE="en";
      await Constants.prefs!.setString(Constants.LANGUAGE_KEY!, "en");
      setLanguageState("en");
    }
    else{
      currentLocalName="العربية";
      Constants.SELECTED_LANGUAGE="ar";
      await Constants.prefs!.setString(Constants.LANGUAGE_KEY!, "ar");
      setLanguageState("ar");
    }

    notifyListeners();
  }
  setLanguageState(String type){
    if(type=="ar"){
      isArabic=true;
      isEnglish=false;
    }else{
      isArabic=false;
      isEnglish=true;
    }
    notifyListeners();
  }
}