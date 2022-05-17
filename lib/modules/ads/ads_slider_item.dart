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
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white,
            boxShadow:[BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset:Offset(3,3),
                blurRadius:3,
                spreadRadius: 0.5
            )]
        ),
        child: Stack(children: [
          Column(children: [
            Expanded(child: TransitionImage(
              widget.AdsItem.bannerPhoto!,
              fit: BoxFit.cover,
              width: double.infinity,
            )),

          ],),
          /*widget.AdsItem.photo!.isNotEmpty? Positioned(child: Container(
            padding: EdgeInsets.all(D.default_5),
            margin: EdgeInsets.only(left:D.default_10,right:D.default_10,top: D.default_10),
            width: D.default_60,
            height: D.default_60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(D.default_5) ),
                color: Colors.white,
                boxShadow:[BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset:Offset(4,4),
                    blurRadius:4,
                    spreadRadius: 2
                )]
            ),
            child:TransitionImage(
              widget.AdsItem.photo!,
              radius: D.default_10,
              fit: BoxFit.cover,
              width: double.infinity,
            ) ,
          ),):Container(),*/
        ],),
      ),
        Container(
          height: D.default_40,
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.only(top:D.default_10),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text(
                widget.AdsItem.name!
                ,style: S.h3(color:C.BASE_BLUE),textAlign: TextAlign.center,),),
            ],),
        )
      ],),);
  }
}
