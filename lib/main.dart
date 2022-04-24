
import 'dart:io';

import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/providers.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/providers.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/providers.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules/adoption/provider/adoption_provider_model.dart';
import 'modules/ads/provider/ads_slider_provider.dart';
import 'modules/cart/provider/cart_provider.dart';
import 'modules/categories_screen/provider/categories_provider_model.dart';
import 'modules/homeTabsScreen/provider/bottom_bar_provider_model.dart';
import 'modules/homeTabsScreen/provider/intro_provider_model.dart';
import 'modules/login/provider/user_provider_model.dart';
import 'modules/notifications/provider/notification_provider.dart';
import 'modules/otp/provider/otp_provider_model.dart';
import 'modules/serviceProviderAccount/provider/scan_code_provider.dart';
import 'modules/serviceProviders/list_screen/provider/sevice_providers_provicer_model.dart';
import 'modules/spalshScreen/spalshScreen.dart';

typedef dynamic OnItemClickListener();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //HttpOverrides.global =  MyHttpOverrides();//handel ssl shackoff error CERTIFICATE_VERIFY_FAILED
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<IntroProviderModel>(create: (ctx) => IntroProviderModel(),),
      ChangeNotifierProvider<BottomBarProviderModel>(create: (ctx) => BottomBarProviderModel(),),
      ChangeNotifierProvider<CategoriesProviderModel>(create: (ctx) => CategoriesProviderModel(),),
      ChangeNotifierProvider<ServiceProvidersProviderModel>(create: (ctx) => ServiceProvidersProviderModel(),),
      ChangeNotifierProvider<AdsSliderProviderModel>(create: (ctx) => AdsSliderProviderModel(),),
      ChangeNotifierProvider<UtilsProviderModel>(create: (ctx) => UtilsProviderModel(),),
      ChangeNotifierProvider<UserProviderModel>(create: (ctx) => UserProviderModel(),),
      ChangeNotifierProvider<OtpProviderModel>(create: (ctx) => OtpProviderModel(),),
      ChangeNotifierProvider<AdoptionProviderModel>(create: (ctx) => AdoptionProviderModel(),),
      ChangeNotifierProvider<NotificationProvider>(create: (ctx) => NotificationProvider(),),
      ChangeNotifierProvider<CartProvider>(create: (ctx) => CartProvider(),),
      ChangeNotifierProvider<ScanCodeProvider>(create: (ctx) => ScanCodeProvider(),),

    ],
    child: EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'assets/strings', // <-- change the path of the translation files
        fallbackLocale: Locale('ar', 'EG'),
        child: MyApp()
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences? prefs;
  UtilsProviderModel? utilsProviderModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: false);
    _initPref(context);
  }
  @override
  Widget build(BuildContext context) {
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: true);
    Constants.utilsProviderModel=utilsProviderModel;
    if(utilsProviderModel!.isArabic){
       context.setLocale(Locale('ar', 'EG'));
       EasyLocalization.of(context)!.setLocale(Locale('ar', 'EG'));
       utilsProviderModel!.currentLocalName="العربية";
       Constants.SELECTED_LANGUAGE="ar";
       utilsProviderModel!.setLanguageState("ar");
       Constants.prefs!.setString(Constants.LANGUAGE_KEY!, "ar");
    }else{
      context.setLocale(Locale('en', 'US'));
      EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));
      utilsProviderModel!.currentLocalName="English";
      Constants.SELECTED_LANGUAGE="en";
      utilsProviderModel!.setLanguageState("en");
      Constants.prefs!.setString(Constants.LANGUAGE_KEY!, "en");
    }
    _initProviders(context);
    return  Constants.utilsProviderModel!.currentLocalName.isNotEmpty? MaterialApp(
      theme: ThemeData(
          primaryColor:C.BASE_BLUE,
          focusColor:C.BASE_BLUE

      ),

        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: utilsProviderModel!.isArabic?Locale('ar', 'EG'):Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        home: BaseScreen(
          tag: "SplashScreen",
      showBottomBar: false,
        showSettings: false,
        body: SplashScreen())):Container();
  }

  void _initProviders(BuildContext context){

  }

  void _initPref(BuildContext ctx)async{
    prefs =  await SharedPreferences.getInstance();
    Constants.prefs=prefs;
    if(prefs!.get(Constants.LANGUAGE_KEY!)!=null){
      if(prefs!.get(Constants.LANGUAGE_KEY!)=="ar"){
        Constants.utilsProviderModel!.setLanguageState("ar");
        utilsProviderModel!.setCurrentLocal(ctx, Locale('ar','EG'));
      }else{
        Constants.utilsProviderModel!.setLanguageState("en");
        utilsProviderModel!.setCurrentLocal(ctx, Locale('en','US'));
      }
    }else{
      Constants.utilsProviderModel!.setLanguageState("ar");
      utilsProviderModel!.setCurrentLocal(ctx, Locale('ar','EG'));

    }
  }
}
/*class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}*/

