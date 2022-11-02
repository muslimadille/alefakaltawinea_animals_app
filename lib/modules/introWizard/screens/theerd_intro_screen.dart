import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/Material.dart';
import '../../../utils/my_utils/baseDimentions.dart';
import '../../../utils/my_utils/baseTextStyle.dart';
import '../../../utils/my_utils/myColors.dart';
import '../../../utils/my_utils/my_fonts.dart';
import '../../../utils/my_widgets/transition_image.dart';

class thirdIntroScreen extends StatefulWidget {
  const thirdIntroScreen({Key? key}) : super(key: key);

  @override
  State<thirdIntroScreen> createState() => _thirdIntroScreenState();
}

class _thirdIntroScreenState extends State<thirdIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: C.ADAPTION_COLOR,
      child: Stack(
        alignment:AlignmentDirectional.center,
        children: [
          _title(),
          Positioned(
              child:TransitionImage(
                "assets/images/intro_3_img.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ) ,
              bottom: D.height(7)),
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
          Text(tr("intro3_title"),style:S.h1Bold(color:Colors.white,fontSize:D.size(14),font: MyFonts.VEXA),textAlign: TextAlign.center,),
          SizedBox(height: D.size(5)),
          Text(tr("intro3_description"),style:TextStyle(color:Colors.white,fontFamily: MyFonts.ALMARIA,fontSize:D.size(7),height:D.textSize(0.45)),textAlign:TextAlign.center)
        ],),),top: D.height(4));
  }

}
