import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:flutter/material.dart';

class CategoryListItem extends StatefulWidget {
  int index;
   CategoryListItem(this.index) ;

  @override
  _CategoryListItemState createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Directionality(textDirection: TextDirection.ltr,
        child:Container(
            child: Stack(
                alignment:AlignmentDirectional.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin:EdgeInsets.only(left:D.default_5,right:D.default_5,top: D.default_10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(D.default_5),
                        color: C.BASE_BLUE,

                    ),
                    child:Row(children: [
                      SizedBox(width: D.default_50,),
                      Center(child: Text("عيادات طبية",style:S.h4(color: Colors.black)),)
                    ],) ,
                  ),
                  Positioned(child: TransitionImage(
                    Res.CONSULTATION_IMG,
                    fit: BoxFit.cover,
                    height: D.default_130,
                  ),bottom: 0,right:-D.default_8,)

                ])) ,),
        onTap: () {

        });
  }
}
