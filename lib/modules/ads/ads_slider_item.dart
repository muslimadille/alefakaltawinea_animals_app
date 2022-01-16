import 'package:alefakaltawinea_animals_app/modules/serviceProviders/details_screen/service_provider_details_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
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
      child: Container(
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
              radius: D.default_10,
              fit: BoxFit.cover,
              width: double.infinity,
            )),

          ],),
          Positioned(child: Container(
            padding: EdgeInsets.all(D.default_5),
            margin: EdgeInsets.all(D.default_10),
            width: D.default_60,
            height: D.default_60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(D.default_10),
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
          ),),
          Positioned(child: Container(
            height: D.default_60,
            width: double.infinity,
            padding: EdgeInsets.all(D.default_10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(D.default_10),bottomRight: Radius.circular(D.default_10)),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text(
                  widget.AdsItem.name!
                  ,style: S.h3(color:C.BASE_BLUE),),),
                TransitionImage(
                  Res.IC_FAV_GREY,
                  height: D.default_25,
                  width: D.default_25,
                )

              ],),
          ),bottom: 0,left: 0,right: 0,)
        ],),
      ),);
  }
}
