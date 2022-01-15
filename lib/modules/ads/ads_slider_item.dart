import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:flutter/material.dart';

class AdsSliderItem extends StatefulWidget {
  const AdsSliderItem({Key? key}) : super(key: key);

  @override
  _AdsSliderItemState createState() => _AdsSliderItemState();
}

class _AdsSliderItemState extends State<AdsSliderItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: D.default_200,
      width: double.infinity,
      child: Column(children: [
        Expanded(child: TransitionImage(
          "https://creditkarma-cms.imgix.net/wp-content/uploads/2018/03/options-huge-vet-bill.jpg",
          fit: BoxFit.cover,
          width: double.infinity,
        )),
        Container(
          padding: EdgeInsets.all(D.default_10),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text("عيادات رويال البطرية",style: S.h3(color:C.BASE_BLUE),))
            ],),
        )
      ],),
    );
  }
}
