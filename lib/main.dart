
import 'dart:io';

import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/ads/provider/ads_slider_provider.dart';
import 'modules/categories_screen/provider/categories_provider_model.dart';
import 'modules/homeTabsScreen/provider/bottom_bar_provider_model.dart';
import 'modules/homeTabsScreen/provider/intro_provider_model.dart';
import 'modules/serviceProviders/list_screen/provider/sevice_providers_provicer_model.dart';
import 'modules/spalshScreen/spalshScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global =  MyHttpOverrides();//handel ssl shackoff error CERTIFICATE_VERIFY_FAILED
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<IntroProviderModel>(create: (ctx) => IntroProviderModel(),),
      ChangeNotifierProvider<BottomBarProviderModel>(create: (ctx) => BottomBarProviderModel(),),
      ChangeNotifierProvider<CategoriesProviderModel>(create: (ctx) => CategoriesProviderModel(),),
      ChangeNotifierProvider<ServiceProvidersProviderModel>(create: (ctx) => ServiceProvidersProviderModel(),),
      ChangeNotifierProvider<AdsSliderProviderModel>(create: (ctx) => AdsSliderProviderModel(),),

    ],
    child: EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'assets/strings', // <-- change the path of the translation files
        fallbackLocale: Locale('ar', 'EG'),
        child: MyApp()
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _initProviders(context);
    return  MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: BaseScreen(
          tag: "SplashScreen",
      showBottomBar: false,
        showSettings: false,
        body: SplashScreen()));
  }
  void _initProviders(BuildContext context){
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

