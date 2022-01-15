import 'package:alefakaltawinea_animals_app/modules/ads/ads_slider.dart';
import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/provider/categories_provider_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'items/category_list.dart';

class MainCategoriesScreen extends StatefulWidget {
   MainCategoriesScreen();

  @override
  _MainCategoriesScreenState createState() => _MainCategoriesScreenState();
}

class _MainCategoriesScreenState extends State<MainCategoriesScreen> {
  CategoriesProviderModel?categoriesProviderModel;
  @override
  void initState() {
    super.initState();
    var _categoriesProviderModel=Provider.of<CategoriesProviderModel>(context,listen: false);
    _categoriesProviderModel.getCategoriesList();
  }
  @override
  Widget build(BuildContext context) {
    categoriesProviderModel=Provider.of<CategoriesProviderModel>(context,listen: true);

    return  BaseScreen(
      showBottomBar: true,
        showSettings: true,
        showIntro: true,
        body: Column(children: [
      AdsSlider(),
      Expanded(child:
      !categoriesProviderModel!.isLoading?
      Container(
        padding: EdgeInsets.all(D.default_20),
        child: CategoryList(context,categoriesProviderModel),):LoadingProgress())
    ],));
  }
}
