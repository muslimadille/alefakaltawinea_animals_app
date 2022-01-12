import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdsSliderDots extends StatelessWidget {
  const AdsSliderDots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DotsIndicator(
          dotsCount: 3,
          position: 0,
          decorator: DotsDecorator(
            color: Colors.grey, // Inactive color
            activeColor: C.BASE_BLUE,
            size: Size(D.default_5,D.default_5)
          ),
        )

      ],
    );
  }
}
