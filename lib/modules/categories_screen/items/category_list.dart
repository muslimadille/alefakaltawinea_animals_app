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
    return Column(children: [

      Container(
        height:(MediaQuery.of(context).size.height*0.6*2)/(3),
          child:Column(children:[
            Expanded(child:Row(children:[
              Expanded(child:itemsList()[0]),
              Expanded(child:itemsList()[1]),
            ])),
            Expanded(child:Row(children:[
              Expanded(child:itemsList()[2]),
              Expanded(child:itemsList()[3]),
            ]))
          ])),
      Container(
        height:(MediaQuery.of(context).size.height*0.6)/(3),
          child:InkWell(onTap: ()async{
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
        child: Container(color: Color(int.parse(adaption.color!.replaceAll("#", "0xff"))),width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(child: Container(
                child: Center(
                  child: Text(
                      adaption.name!,
                      style: S.h1Bold(color: Colors.white)),
                ),)),
              Expanded(child: TransitionImage(
                adaption.photo!,
                fit: BoxFit.fitHeight,
                padding: EdgeInsets.only(top:D.default_5,bottom:D.default_5),
                width: double.infinity,
              )),

            ],
          ),),))

    ]);

  }
  List<Widget>itemsList(){
    List<Widget>items=[];
    for(int i=0;i<widget.categoriesProviderModel!.categoriesList.length;i++){
      items.add(CategoryListItem(
          i,
          widget.categoriesProviderModel,
              (){_onItemClick(i);}));
    }
    return items;
  }
  void _onItemClick(int index){
    if(widget.categoriesProviderModel!.categoriesList[index].id==-1){
      /// navigate to adoption

    }else{
      MyUtils.navigate(widget.ctx, ServiceProviderListScreen(widget.categoriesProviderModel!.categoriesList[index],widget.categoriesProviderModel!.categoriesList[index].name!));
    }
  }

}

