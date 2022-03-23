import 'package:alefakaltawinea_animals_app/modules/ads/provider/ads_slider_provider.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdsSliderDots extends StatelessWidget {
  int _itemCount;
  int _position;
   AdsSliderDots(this._itemCount,this._position) ;
  AdsSliderProviderModel?adsSliderProviderModel;


  @override
  Widget build(BuildContext context) {
    adsSliderProviderModel=Provider.of<AdsSliderProviderModel>(context,listen: true);

    return adsSliderProviderModel!.adsSliderModelList.isNotEmpty?Container(
      color: Colors.white,
      width: double.infinity,
      height: D.default_27,
      margin: EdgeInsets.only(bottom: D.default_5),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DotsIndicator(

          dotsCount: adsSliderProviderModel!.adsSliderModelList.length,
          position: _position.toDouble(),
          decorator: DotsDecorator(
              color: C.BASE_BLUE.withOpacity(0.3),
              activeColor: C.BASE_BLUE,
              activeSize:Size(D.default_10,D.default_10),
              size:Size(D.default_10,D.default_10),
              spacing:EdgeInsets.all(D.default_5)
          ),
        )

      ],
    ),):Container();
  }
}
