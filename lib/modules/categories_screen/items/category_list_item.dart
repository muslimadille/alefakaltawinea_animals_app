import 'package:alefakaltawinea_animals_app/modules/categories_screen/provider/categories_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/service_providers_list_screen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:flutter/material.dart';

typedef void OnItemClickListener();
class CategoryListItem extends StatefulWidget {
  int index;
  OnItemClickListener? onItemClickListener;
  CategoriesProviderModel?categoriesProviderModel;


  CategoryListItem(this.index,this.categoriesProviderModel,this.onItemClickListener) ;

  @override
  _CategoryListItemState createState() => _CategoryListItemState(index);
}

class _CategoryListItemState extends State<CategoryListItem> {
  _CategoryListItemState(this.index);
  int index;
  GlobalKey? _key;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      setState(() {
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.onItemClickListener,
        child: Directionality(textDirection: TextDirection.ltr,
        child:Container(
            margin:EdgeInsets.only(left:D.default_5,right:D.default_5,top: D.default_10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(D.default_5),
              color: Color(int.parse(widget.categoriesProviderModel!.categoriesList[widget.index].color!.replaceAll("#", "0xFF"))),
            ),
            child: Stack(
                alignment:AlignmentDirectional.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Positioned(child: TransitionImage(
                    widget.categoriesProviderModel!.categoriesList[widget.index].photo!,
                    fit: BoxFit.cover,
                    height:D.default_160,
                  ),bottom: 0,right:-D.default_16,)
                  ,Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(child: Container(
                          padding:EdgeInsets.all(D.default_20)
                          ,child: Text(widget.categoriesProviderModel!.categoriesList[widget.index].name!,style:S.h4(color: Colors.black)),),)
                      ],) ,
                  ),
                ])) ,),
        );
  }

}
