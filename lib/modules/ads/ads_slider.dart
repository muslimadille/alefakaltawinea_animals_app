import 'package:alefakaltawinea_animals_app/modules/ads/ads_slider_item.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:flutter/material.dart';

class AdsSlider extends StatefulWidget {
  const AdsSlider({Key? key}) : super(key: key);

  @override
  _AdsSliderState createState() => _AdsSliderState();
}

class _AdsSliderState extends State<AdsSlider> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    _outoslid();

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


        },
      )
      );
  }
  List<Widget> slids=[AdsSliderItem()];
  void _outoslid(){
    Future.delayed(Duration(milliseconds: 4000)).then((value) {
    if(_controller.page!.toInt()<slids.length-1) {
      setState(() {
        _controller.animateToPage(_controller.page!.toInt()+1, duration: Duration(milliseconds: 1000), curve: Curves.ease);
      });
    }else{
        setState(() {
          _controller.animateToPage(0, duration: Duration(milliseconds: 1000), curve: Curves.ease);
        });

          }});
  }
}
