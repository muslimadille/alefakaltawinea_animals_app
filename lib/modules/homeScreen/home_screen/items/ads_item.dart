import 'package:alefakaltawinea_animals_app/modules/serviceProviders/service_provider_list_item.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class AdsSlider extends StatefulWidget {
  const AdsSlider({Key? key}) : super(key: key);

  @override
  _AdsSliderState createState() => _AdsSliderState();
}

class _AdsSliderState extends State<AdsSlider> {
  final _controller = PageController();
  int _currentPosition=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: D.default_250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
          boxShadow:[BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset:Offset(2,2),
              blurRadius:2,
              spreadRadius: 2
          )]
      ),
      child:PageView(
        children: slids,
        controller: _controller,
        onPageChanged: (currentpage) {
          setState(() => _currentPosition = currentpage);
        },
      )
      );
  }
  List<Widget> slids=[ServiceProviderListItem(),ServiceProviderListItem(),ServiceProviderListItem()];
}
