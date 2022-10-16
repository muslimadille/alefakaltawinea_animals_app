import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import '../../../utils/my_utils/baseDimentions.dart';
import '../../../utils/my_utils/baseTextStyle.dart';
import '../../../utils/my_utils/myColors.dart';
import '../../../utils/my_utils/my_fonts.dart';
import '../../../utils/my_widgets/transition_image.dart';

class FivthIntroScreen extends StatefulWidget {
  const FivthIntroScreen({Key? key}) : super(key: key);

  @override
  State<FivthIntroScreen> createState() => _FivthIntroScreenState();
}

class _FivthIntroScreenState extends State<FivthIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: C.BASE_BLUE,
      child: Stack(
        alignment:AlignmentDirectional.center,
        children: [
          Positioned(
              child:TransitionImage(
                "assets/images/intro_4_img.png",
                width: MediaQuery.of(context).size.width*0.6,
                fit: BoxFit.fitWidth,
              ) ,
              top: MediaQuery.of(context).size.height * 0.1),
          _title(),
        ],
      ),
    );
  }

  Widget _title(){
    return Positioned(child:Container(
      width:MediaQuery.of(context).size.width ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(tr("intro5_title"),style:S.h1Bold(color:Colors.white,fontSize: D.size(14),font: MyFonts.MYRIAD_ARABIC),textAlign: TextAlign.center,),
        ],),),bottom: MediaQuery.of(context).size.height * 0.12);
  }

}
