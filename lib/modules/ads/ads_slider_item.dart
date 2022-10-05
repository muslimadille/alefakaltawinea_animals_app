import 'package:alefakaltawinea_animals_app/modules/serviceProviders/details_screen/service_provider_details_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdsSliderItem extends StatefulWidget {
  Data AdsItem;
   AdsSliderItem(this.AdsItem) : super();

  @override
  _AdsSliderItemState createState() => _AdsSliderItemState();
}

class _AdsSliderItemState extends State<AdsSliderItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        MyUtils.navigate(context, ServiceProviderDetailsScreen(widget.AdsItem));
      },
      child: Stack(
        alignment:AlignmentDirectional.bottomCenter ,
        children: [
        Container(
        margin: EdgeInsets.only(left: D.default_10,right: D.default_10),
        width: double.infinity,
        child:Column(children: [
          Expanded(child: TransitionImage(
            widget.AdsItem.bannerPhoto!,
            fit: BoxFit.cover,
            radius:D.default_15,
            width: double.infinity,
          )),
          Container(
            height: D.default_40,
            color: C.BASE_ORANGE,
            width: double.infinity,
            padding: EdgeInsets.only(top:D.default_10),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text(
                  widget.AdsItem.name!
                  ,style: S.h3(color:Colors.white),textAlign: TextAlign.center,),),
              ],),
          )
        ],),

        ),
      ],),);
  }
}
