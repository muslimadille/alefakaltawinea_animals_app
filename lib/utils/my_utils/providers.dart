import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';

class UtilsProviderModel with ChangeNotifier{
  bool isArabic=true;
  bool isEnglish=false;
  Locale currentLocal =Locale('ar', 'EG');
  String currentLocalName="العربية";

  setCurrentLocal(BuildContext ctx,Locale locale)  async {
    await ctx.setLocale(locale);
    await EasyLocalization.of(ctx)!.setLocale(locale);
    currentLocal=locale;
    if(locale==Locale('ar', 'EG')){
      currentLocalName="العربية";
      Constants.SELECTED_LANGUAGE="ar";
    }
    else if(locale==Locale('en', 'US')){
      currentLocalName="English";
      Constants.SELECTED_LANGUAGE="en";
    }
    else{
      currentLocalName="العربية";
      Constants.SELECTED_LANGUAGE="ar";
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