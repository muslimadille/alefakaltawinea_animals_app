import 'package:alefakaltawinea_animals_app/modules/introWizard/screens/first_itro_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/introWizard/screens/fivth_intro_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/introWizard/screens/forth_intro_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/introWizard/screens/second_intro_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/introWizard/screens/theerd_intro_screen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/my_utils/baseDimentions.dart';
import '../../utils/my_utils/constants.dart';
import '../../utils/my_utils/myColors.dart';
import '../../utils/my_utils/myUtils.dart';
import '../baseScreen/baseScreen.dart';
import '../spalshScreen/splash_two_screen.dart';



class IntroWizardScreen extends StatefulWidget {
  const IntroWizardScreen({Key? key}) : super(key: key);

  @override
  State<IntroWizardScreen> createState() => _IntroWizardScreenState();
}

class _IntroWizardScreenState extends State<IntroWizardScreen> {
  final _controller = PageController();
  int _currentSliderPager=0;
  List<Widget> sliderItems=[
    FirstIntroScreen(),
    SecondIntroScreen(),
    thirdIntroScreen(),
    ForthIntroScreen(),
    FivthIntroScreen()
  ];


  @override
  void initState() {
    super.initState();
    Constants.prefs!.setBool(Constants.IS_FIRST_TIME,false);
  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        tag: "SplashScreen",
        showSettings: false,
        showBottomBar: false,
        showWhatsIcon:false,
        body:Stack(
          alignment: AlignmentDirectional.center,
          children: [
          Container(
              color: Colors.white,
              child:PageView(
                children: sliderItems,
                controller: _controller,
                onPageChanged: (currentPage) {
                  setState(() {
                    _currentSliderPager=currentPage;
                  });
                },
              )
          ),
          _controlPart()
        ],));
  }
  Widget _controlPart(){
    return Positioned(child: Container(
      margin: EdgeInsets.only(left:D.default_10,right: D.default_10),
      width:  MediaQuery.of(context).size.width,
      child: Row(children: [
        _nextBtn(),
        Expanded(child: _dots()),
        _skipBtn(),

      ],),),bottom: MediaQuery.of(context).size.height*0.02,)
    ;
  }
  Widget _dots(){
    return Container(
      width: double.infinity,
      height: D.default_27,
      margin: EdgeInsets.only(bottom: D.default_5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DotsIndicator(

            dotsCount: sliderItems.length,
            position: _currentSliderPager.toDouble(),
            decorator: DotsDecorator(
                color: dotsColor(_currentSliderPager).withOpacity(0.3),
                activeColor: dotsColor(_currentSliderPager),
                activeSize:Size(D.default_10,D.default_10),
                size:Size(D.default_10,D.default_10),
                spacing:EdgeInsets.all(D.default_5)
            ),
          )

        ],
      ),);
  }
  Color dotsColor(int index){
    switch(index){
      case 0:return Colors.white;
      case 1:return Colors.black;
      case 2:return Colors.white;
      case 3:return C.BASE_BLUE;
      case 4:return Colors.white;
      default: return Colors.white;
    }

  }
  Color textColor(int index){
    switch(index){
      case 0:return C.BASE_BLUE;
      case 1:return Colors.white;
      case 2:return C.ADAPTION_COLOR;
      case 3:return Colors.white;
      case 4:return C.BASE_BLUE;
      default: return Colors.white;
    }

  }

  Widget _skipBtn(){
    return InkWell(
      onTap: (){
        MyUtils.navigateReplaceCurrent(context, OnBoardingScreen());
      },
      child: Container(
      height:D.default_30,
      width: D.default_70,
      margin: EdgeInsets.only(left: D.default_10,right: D.default_10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_10),
          color: dotsColor(_currentSliderPager),
          boxShadow:[BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset:Offset(3,3),
              blurRadius:3,
              spreadRadius: 0.5
          )]
      ),
      child: Center(child: Text(tr("skip"),style: S.h4(color: textColor(_currentSliderPager)),),),
    ),);
  }
  Widget _nextBtn(){
    return InkWell(
      onTap: ()async{
        if(_currentSliderPager<sliderItems.length-1){
          setState(() {
            _currentSliderPager=_currentSliderPager+1;
             //_controller.jumpTo(_currentSliderPager.toDouble());
            _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.decelerate);
          });
        }else{
          MyUtils.navigateReplaceCurrent(context, OnBoardingScreen());
        }
      },
      child: Container(
      height:D.default_30,
      width: D.default_70,
      child: Center(child: Icon(true?Icons.arrow_back:Icons.arrow_forward,color: dotsColor(_currentSliderPager),),),
    ),);
  }

}
