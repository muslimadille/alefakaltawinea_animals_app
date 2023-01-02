import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import '../../../utils/my_utils/baseDimentions.dart';
import '../../../utils/my_utils/baseTextStyle.dart';
import '../../../utils/my_utils/myColors.dart';
import '../../../utils/my_utils/my_fonts.dart';
import '../../../utils/my_widgets/transition_image.dart';

class ForthIntroScreen extends StatefulWidget {
  const ForthIntroScreen({Key? key}) : super(key: key);

  @override
  State<ForthIntroScreen> createState() => _ForthIntroScreenState();
}

class _ForthIntroScreenState extends State<ForthIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: C.BASE_BLUE,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [_title(), titlsList(), _animalsImage()],
      ),
    );
  }



  Widget _animalsImage() {
    return Positioned(
        child: TransitionImage(
          "assets/images/intro_4_animal_img.png",
          width: MediaQuery.of(context).size.width,
          fit:BoxFit.fitWidth,
        ),
        bottom: 0);
  }

  Widget _title() {
    return Positioned(
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              tr("intro_4_mainTitle"),
              style: S.h1Bold(color: Colors.white, fontSize:D.size(14),font: MyFonts.VEXA),textAlign: TextAlign.center,
            )),
        top: MediaQuery.of(context).size.height * 0.04);
  }

  Widget titlsList() {
    return Positioned(
        child: Container(
          width:MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height * 0.5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _listTitlsItem(tr("intro_4_title1")),
                _listTitlsItem(tr("intro_4_title2")),
                _listTitlsItem(tr("intro_4_title3")),
                _listTitlsItem(tr("intro_4_title4")),
                _listTitlsItem(tr("intro_4_title5")),
                _listTitlsItem(tr("intro_4_title6")),
                _listTitlsItem(tr("intro_4_title7")),
                _listTitlsItem(tr("intro_4_title8")),

              ],
            ),
          ),
        ),
        top: MediaQuery.of(context).size.height * 0.15);
  }

  Widget _listTitlsItem(String title) {
    return Container(
      margin: EdgeInsets.all(D.default_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_outline,
            color: Colors.white,
            size: D.default_30,
          ),
          SizedBox(width: D.default_10,),
          Expanded(
            child: Text(
              title,
              style: S.h3(color: Colors.white,fontSize: D.size(9)),
            ),
          )
        ],
      ),
    );
  }
}
