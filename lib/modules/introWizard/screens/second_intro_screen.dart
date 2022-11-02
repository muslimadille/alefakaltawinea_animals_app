import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import '../../../utils/my_utils/myColors.dart';
import '../../../utils/my_utils/my_fonts.dart';
import '../../../utils/my_widgets/transition_image.dart';

class SecondIntroScreen extends StatefulWidget {
  const SecondIntroScreen({Key? key}) : super(key: key);

  @override
  State<SecondIntroScreen> createState() => _SecondIntroScreenState();
}

class _SecondIntroScreenState extends State<SecondIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: C.BASE_ORANGE,
      child: Stack(
          alignment:AlignmentDirectional.center,
        children: [
          _title(),
          Positioned(
              child: _cart("assets/images/intro_2_img1.png", tr("clinic")),
              bottom: MediaQuery.of(context).size.height * 0.46),
          Positioned(
              child: _cart("assets/images/intro_2_img2.png", tr("intro_2_title2")),
              bottom: MediaQuery.of(context).size.height * 0.26),
          Positioned(
              child: _cart("assets/images/intro_2_img3.png", tr("noti_screen_title")),
              bottom: MediaQuery.of(context).size.height * 0.06)
        ],
      ),
    );
  }

  Widget _cart(String img, String title) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: D.height(18),
        width: D.width(90),
        margin: EdgeInsets.all(D.default_20),
        child: Stack(
          alignment:AlignmentDirectional.center,
          children: [
            TransitionImage(
              img,
              width: MediaQuery.of(context).size.width-D.default_40,
              fit: BoxFit.fitWidth,
              radius: D.default_10,
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.all(D.default_20),
                child: Text(
                  title,
                  style: S.h1(color: Colors.white),
                ),
              ),
              right: 0,
            )
          ],
        ),
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
          Text(tr("intro2_title"),style:S.h1Bold(color:Colors.black,fontSize: D.textSize(9),font: MyFonts.VEXA),textAlign: TextAlign.center,),
          SizedBox(height: D.default_10,),
          Text(tr("intro2_description"),style:TextStyle(color:Colors.black,fontFamily: MyFonts.ALMARIA,fontSize:D.size(7),height:D.textSize(0.45)),textAlign:TextAlign.center)
        ],),),top: MediaQuery.of(context).size.height * 0.05);
  }

}
