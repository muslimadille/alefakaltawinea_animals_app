
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/my_fonts.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/my_utils/baseTextStyle.dart';

class FirstIntroScreen extends StatefulWidget {
  const FirstIntroScreen({Key? key}) : super(key: key);

  @override
  State<FirstIntroScreen> createState() => _FirstIntroScreenState();
}

class _FirstIntroScreenState extends State<FirstIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: C.BASE_ORANGE,
      child: Stack(
        children: [
          _mobileImg(),
          _blueCircuil(),
          _dogImg(),
          _title()
        ],
      ),
    );
  }

  Widget _blueCircuil() {
    return Positioned(
      child: TransitionImage(
        "assets/images/intro_1_blue_circuil.png",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        fit: BoxFit.fill,
      ),
      bottom: 0,
    );
  }

  Widget _dogImg() {
    return Positioned(
      child: TransitionImage(
        "assets/images/intro_1_dog_img.png",
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        fit: BoxFit.fitHeight,
      ),
      bottom: MediaQuery.of(context).size.height * 0.26,
    );
  }
  Widget _mobileImg() {
    return Positioned(
      child: TransitionImage(
        "assets/images/intro_1_mobile_img.png",
        width:D.width(100),
        fit: BoxFit.fitWidth,
      ),
      bottom: D.height(43),
    );
  }
  Widget _title(){

    return Positioned(child:Container(
      width:MediaQuery.of(context).size.width ,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Text(tr("intro1_title"),style:S.h1Bold(color:Colors.white,fontSize: D.textSize(6),font: MyFonts.VEXA),textAlign: TextAlign.center,),
      SizedBox(height: D.default_15,),
      Text(tr("intro1_description"),style:S.h3(color:Colors.white,font: MyFonts.ALMARIA,fontSize: D.textSize(3)),textAlign:TextAlign.center),
        SizedBox(height: D.default_10,),
        Text(tr("intro1_description2"),style:S.h4(color:Colors.white,font:MyFonts.ALMARIA,fontSize: D.textSize(2.5)),textAlign:TextAlign.center),
        SizedBox(height: D.default_10,),

      ],),),bottom: MediaQuery.of(context).size.height * 0.09,);
  }
}
