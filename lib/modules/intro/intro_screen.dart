import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/my_utils/baseDimentions.dart';
import '../../utils/my_utils/constants.dart';
import '../../utils/my_utils/myColors.dart';
import '../../utils/my_utils/myUtils.dart';
import '../../utils/my_widgets/transition_image.dart';
import '../baseScreen/baseScreen.dart';
import '../cart/add_cart_screen.dart';
import '../categories_screen/mainCategoriesScreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return  BaseScreen(
      showSettings: false,
      showBottomBar: false,
      tag: "AdoptionScreen",
      body: Column(
        children: [
          Expanded(
              child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              stops: [
                0.1,
                0.9,
              ],
              colors: [
                C.BASE_BLUE,
                C.BASE_BLUE,
              ],
            )
        ),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      _header(),
                      _whiteContainer(),
                      Positioned(child:
                      Column(children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(D.default_10)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    spreadRadius: 0.5)
                              ]),
                          child: TransitionImage("assets/images/cart_img.png",
                              width: MediaQuery.of(context).size.width*0.7,
                              fit:BoxFit.fitWidth
                          ),
                        ),
                        _addCartBtn(),
                        Text(tr("intro_title_tow"),style: S.h1Bold(color: C.BASE_BLUE),),
                        Container(
                          padding: EdgeInsets.only(left:D.default_50,right: D.default_50,top: D.default_20,bottom: D.default_10),
                          width :MediaQuery.of(context).size.width,child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Row(children: [Icon(Icons.check_circle_outline,color: C.BASE_BLUE,), Text(tr("clinic"),style: S.h2(color: C.BASE_BLUE))]),
                              Row(children: [Icon(Icons.check_circle_outline,color: C.BASE_BLUE,), Text(tr("home_care"),style: S.h2(color: C.BASE_BLUE))])
                            ],),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Row(children: [Icon(Icons.check_circle_outline,color: C.BASE_BLUE,), Text(tr("pet_stores"),style: S.h2(color: C.BASE_BLUE),)]),
                              Row(children: [Icon(Icons.check_circle_outline,color: C.BASE_BLUE,), Text(tr("adoption_offers"),style: S.h2(color: C.BASE_BLUE))])
                            ],)
                          ],),),
                        Container(
                          padding: EdgeInsets.only(left:D.default_60,right: D.default_60,top: D.default_10),
                          width:MediaQuery.of(context).size.width,child: Text(tr("intro_offer_for_u"),style: S.h2(color: C.BASE_BLUE)),),
                        Container(
                          padding: EdgeInsets.only(top: D.default_30,left:D.default_50,right: D.default_50),child: Text(tr("intro_cost_title"),style: S.h1Bold(color: C.BASE_BLUE)),)
                      ],),top:D.default_200),
                      Positioned(child: InkWell(
                        onTap: ()async{
                          await Constants.prefs!.setBool("intro${Constants.currentUser!.id}",true);
                          MyUtils.navigateAsFirstScreen(context, MainCategoriesScreen());
                        },
                        child: Text(tr("skip"),style: S.h1Bold(color: C.BASE_BLUE),),),bottom: D.default_40,)
                    ],
                  )))
        ],
      ),
    );
  }
  Widget _whiteContainer() {
    return Container(
      margin: EdgeInsets.only(top: D.default_250),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(D.default_50),
              topRight: Radius.circular(D.default_50)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(1, 1),
                blurRadius: 1,
                spreadRadius: 0.5)
          ]),
    );
  }
  Widget _header(){
    return Container(
      margin: EdgeInsets.only(top:D.default_70),
    child: Text(
      tr("intro_title"),
      style:S.h1Bold(color: Colors.white),textAlign: TextAlign.center,),
    );
  }
  Widget _addCartBtn() {
    return Center(
      child: InkWell(
        onTap: () {
          MyUtils.navigate(context, AddCartScreen());
        },
        child: Container(
          width: D.default_130,
          margin: EdgeInsets.all(D.default_30),
          padding: EdgeInsets.only(
              left: D.default_10,
              right: D.default_10,
              top: D.default_10,
              bottom: D.default_10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(D.default_15),
              color: C.BASE_BLUE,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(1, 1),
                    blurRadius: 1,
                    spreadRadius: 1)
              ]),
          child: Text(
            tr("subscribe"),
            style: S.h1Bold(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }


}
