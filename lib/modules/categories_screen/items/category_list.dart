import 'package:alefakaltawinea_animals_app/modules/categories_screen/provider/categories_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/service_providers_list_screen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category_list_item.dart';

class CategoryList extends StatefulWidget {
  CategoriesProviderModel?categoriesProviderModel;
  BuildContext ctx;
   CategoryList(this.ctx,this.categoriesProviderModel);

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
            crossAxisSpacing: D.default_10,
            mainAxisSpacing: D.default_10,
            childAspectRatio: 1.6,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return CategoryListItem(
                  index,
                  widget.categoriesProviderModel,
                  (){_onItemClick(index);});
            },
            childCount: widget.categoriesProviderModel!.categoriesList.length,
            semanticIndexOffset: 1,
          )),

    ]);

  }
  void _onItemClick(int index){
    MyUtils.navigate(widget.ctx, ServiceProviderListScreen(widget.categoriesProviderModel!.categoriesList[index]));
  }

}

