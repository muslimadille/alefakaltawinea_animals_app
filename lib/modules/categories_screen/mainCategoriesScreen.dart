import 'package:alefakaltawinea_animals_app/modules/ads/ads_slider.dart';
import 'package:alefakaltawinea_animals_app/modules/ads/provider/ads_slider_provider.dart';
import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/provider/categories_provider_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/my_utils/myColors.dart';
import '../../utils/my_utils/myUtils.dart';
import '../adoption/adpotion_screen.dart';
import 'items/category_list.dart';

class MainCategoriesScreen extends StatefulWidget {
   MainCategoriesScreen();

  @override
  _MainCategoriesScreenState createState() => _MainCategoriesScreenState();
}

class _MainCategoriesScreenState extends State<MainCategoriesScreen> {
  AdsSliderProviderModel?adsSliderProviderModel;

  CategoriesProviderModel?categoriesProviderModel;

  @override
  void initState() {
    super.initState();
    categoriesProviderModel=Provider.of<CategoriesProviderModel>(context,listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((_){
      adsSliderProviderModel!.getAdsSlider();
      categoriesProviderModel!.getCategoriesList();
    });

  }
  @override
  Widget build(BuildContext context) {
    categoriesProviderModel=Provider.of<CategoriesProviderModel>(context,listen: true);
    adsSliderProviderModel=Provider.of<AdsSliderProviderModel>(context,listen: true);
    return  BaseScreen(
      tag: "MainCategoriesScreen",
      showBottomBar: true,
        showSettings: true,
        showIntro: false,
        body: categoriesProviderModel!.isLoading?LoadingProgress():
        Stack(
          fit:StackFit.expand,
          children: [
          Column(children: [
            Container(height: MediaQuery.of(context).size.height*0.30,child: AdsSlider(),),
            Expanded(child:  Container(
              color: Colors.white,
              child: CategoryList(context,categoriesProviderModel),))
          ],),
            categoriesProviderModel!.showHadeth?_adotionAlert():Container()
        ],));
  }
  Widget _adotionAlert(){
    return Directionality(textDirection: TextDirection.rtl, child: Container(
      color: Colors.white.withOpacity(0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Expanded(child: Container()),
        Container(
          padding: EdgeInsets.all(D.default_10),
          color: C.ADAPTION_COLOR,
          height: D.default_200,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.only(right: D.default_10,top:D.default_10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(tr("hadeth_start"),style: S.h1(color: Colors.white),),
                  Text(tr("hadeth")+tr("hadeth_end"),style: S.h1(color: Colors.white),),
                ],),),),
              InkWell(
                onTap: (){
                  categoriesProviderModel!.showHadeth=false;
                  categoriesProviderModel!.notifyListeners();
                  MyUtils.navigate(context, AdoptionScreen());
                },
                child: Container(child:
                Row(children: [
                  Checkbox(
                      side: BorderSide(color: Colors.white),
                      checkColor: Colors.white,
                      activeColor: Colors.white,
                      value: true, onChanged: (value){
                    categoriesProviderModel!.showHadeth=false;
                    categoriesProviderModel!.notifyListeners();
                    MyUtils.navigate(context, AdoptionScreen());
                  }),
                  Text(tr("hadeth_check"),style: S.h2(color: Colors.white),)
                ],),),)
            ],),
        )
      ],),
    ));
  }
}
