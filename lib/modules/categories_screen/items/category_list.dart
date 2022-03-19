import 'package:alefakaltawinea_animals_app/modules/adoption/adpotion_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/provider/categories_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/service_providers_list_screen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/my_utils/baseTextStyle.dart';
import '../../../utils/my_utils/resources.dart';
import '../../../utils/my_widgets/transition_image.dart';
import '../data/categories_model.dart';
import 'category_list_item.dart';

class CategoryList extends StatefulWidget {
  CategoriesProviderModel?categoriesProviderModel;
  BuildContext ctx;
   CategoryList(this.ctx,this.categoriesProviderModel);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  CategoriesDataModel adaption=CategoriesDataModel(id:-1,name:tr("adoption"),photo: Res.ADOPTION_NEW_IMAG,color: "#F38183");


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [

      SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 1.35,
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
      SliverToBoxAdapter(child:  InkWell(onTap: (){
        MyUtils.navigate(context, AdoptionScreen());
      },
      child: Container(color: Color(int.parse(adaption.color!.replaceAll("#", "0xff"))),width: MediaQuery.of(context).size.width,height: D.default_150,
        child: Row(
          children: [
            Expanded(child: Container(
              height: D.default_40,
              child: Center(
                child: Text(
                    adaption.name!,
                    style: S.h3(color: Colors.white)),
              ),)),
                Expanded(child: TransitionImage(
                  adaption.photo!,
                  fit: BoxFit.fitHeight,
                  padding: EdgeInsets.only(top:D.default_10,bottom:D.default_10),
                  width: double.infinity,
                )),

          ],
        ),),),)

    ]);

  }
  void _onItemClick(int index){
    if(widget.categoriesProviderModel!.categoriesList[index].id==-1){
      /// navigate to adoption

    }else{
      MyUtils.navigate(widget.ctx, ServiceProviderListScreen(widget.categoriesProviderModel!.categoriesList[index],widget.categoriesProviderModel!.categoriesList[index].name!));
    }
  }

}

