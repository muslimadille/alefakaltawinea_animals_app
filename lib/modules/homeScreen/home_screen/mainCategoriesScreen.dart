import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:flutter/material.dart';
import 'items/ads_item.dart';
import 'items/ads_slider_dots.dart';
import 'items/category_list.dart';

class MainCategoriesScreen extends StatefulWidget {
  const MainCategoriesScreen({Key? key}) : super(key: key);

  @override
  _MainCategoriesScreenState createState() => _MainCategoriesScreenState();
}

class _MainCategoriesScreenState extends State<MainCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      AdsSlider(),
      Expanded(child: Container(
        padding: EdgeInsets.all(D.default_20),
        child: CategoryList(),))
    ],);
  }
}
