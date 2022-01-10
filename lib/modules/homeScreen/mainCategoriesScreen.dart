import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:flutter/material.dart';

class MainCategoriesScreen extends StatefulWidget {
  const MainCategoriesScreen({Key? key}) : super(key: key);

  @override
  _MainCategoriesScreenState createState() => _MainCategoriesScreenState();
}

class _MainCategoriesScreenState extends State<MainCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return LoadingProgress();
  }
}
