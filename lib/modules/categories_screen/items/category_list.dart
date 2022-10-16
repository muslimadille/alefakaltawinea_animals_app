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
import '../../../utils/my_utils/constants.dart';
import '../../../utils/my_utils/myColors.dart';
import '../../../utils/my_utils/resources.dart';
import '../../../utils/my_widgets/transition_image.dart';
import '../../notifications/notifications_screen.dart';
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
    return Column(children: [
      Expanded(child: Row(children: [
        Expanded(child: CategoryListItem(
          title:tr("clinic") ,
            image:"assets/images/clinics_img.png",
            onItemClickListener:(){_onItemClick(0);})),
        Expanded(child: CategoryListItem(
            title:tr("shops") ,
            image:"assets/images/shops_img.png",
            onItemClickListener:(){_onItemClick(1);}),)
      ],),),
      Expanded(child: Row(children: [
        Expanded(child: CategoryListItem(
            title:tr("home_care") ,
            image:"assets/images/home_care-img.png",
            onItemClickListener:(){_onItemClick(2);}),),
        Expanded(child: CategoryListItem(
            title:tr("Exclusive_Offers") ,
            image:"assets/images/excloseve_offers.png",
            onItemClickListener:(){
              MyUtils.navigate(context, NotificationsScreen());
            }),)

      ],),),
      Expanded(child:_adoptionItem(),)

    ]);

  }
  Widget _adoptionItem(){
    return  InkWell(onTap: ()async{
      bool hadeathState=Constants.currentUser!=null?await Constants.prefs!.getBool(Constants.currentUser!.id.toString())??false:true;
      if(!hadeathState){
        widget.categoriesProviderModel!.showHadeth=true;
        await Constants.prefs!.setBool(Constants.currentUser!.id.toString(),true);
      }else{
        widget.categoriesProviderModel!.showHadeth=false;
        MyUtils.navigate(context, AdoptionScreen());
      }
      widget.categoriesProviderModel!.notifyListeners();
    },
      child: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(D.default_10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_10),
            color: C.ADAPTION_COLOR,
            boxShadow:[BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset:Offset(1,1),
                blurRadius:1,
                spreadRadius: 1
            )]
        ),
        child: Row(
          children: [
            Expanded(child: Container(
              child: Center(
                child: Text(
                    tr('adoption'),
                    style: S.h1Bold(color: Colors.white)),
              ),)),
            Expanded(flex:0,child: Container(
              height: double.infinity,
              child: TransitionImage(
              "assets/images/adooption_img.png",
              fit: BoxFit.fitWidth,
            ),)),

          ],
        ),),);
  }
  void _onItemClick(int index){
    if(widget.categoriesProviderModel!.categoriesList[index].id==-1){
    }else{
      MyUtils.navigate(widget.ctx, ServiceProviderListScreen(widget.categoriesProviderModel!.categoriesList[index],widget.categoriesProviderModel!.categoriesList[index].name!));
    }
  }

}

