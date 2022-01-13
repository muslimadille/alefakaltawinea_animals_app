import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:flutter/material.dart';

import 'category_list_item.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: D.default_20,
            mainAxisSpacing: D.default_20,
            childAspectRatio: 1.9,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return CategoryListItem(index);
            },
            childCount: 5,
            semanticIndexOffset: 1,
          )),

    ]);
  }
}
