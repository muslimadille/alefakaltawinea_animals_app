
import 'package:alefakaltawinea_animals_app/modules/categories_screen/mainCategoriesScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/fav/favourite_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/homeTabsScreen/provider/bottom_bar_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/neerToYou/NearToyouScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/profile/no_profile_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/profile/profileScreen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import '../cart/add_cart_screen.dart';
import '../my_cards/my_cards_screen.dart';
import '../notifications/notifications_screen.dart';
import '../serviceProviderAccount/SpHomeScreen.dart';
import '../serviceProviderAccount/code_scanner_screen.dart';
import 'provider/intro_provider_model.dart';


class HomeTabsScreen extends StatefulWidget {
  IntroProviderModel?introProviderModel;
  bool showIntro;
  

   HomeTabsScreen(this.introProviderModel,this.showIntro) ;

  @override
  _HomeTabsScreenState createState() => _HomeTabsScreenState();
}

class _HomeTabsScreenState extends State<HomeTabsScreen> with TickerProviderStateMixin{
  PersistentTabController? _controller;
  AnimationController? _animationController;
  Animation<double>? _animation;
  BottomBarProviderModel?bottomBarProviderModel;
  bool isServiceProvider=false;
@override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
}

  @override
  Widget build(BuildContext context) {
  if(Constants.currentUser!=null){
    if(Constants.currentUser!.userTypeId.toString()=="6"){
      isServiceProvider=true;
    }
    else{
      isServiceProvider=false;
    }
  }
    bottomBarProviderModel=Provider.of<BottomBarProviderModel>(context,listen: true);
    return  _bottomBar();
  }
 

  Widget _bottomBar(){
    return Container(
      padding: EdgeInsets.all(D.default_10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
          boxShadow:[BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset:Offset(-2,-2),
              blurRadius:2,
              spreadRadius: 2
          )]
      ),
      child: Row(
        children: isServiceProvider?[
          _SpHomeBtn(),
          _SpScanCodeBtn(),
        ]:[
          _homeBtn(),
          _favBtn(),
          _closestBtn(),
          _notificationsBtn(),
          _profileBtn()

        ],
      ),
    ) ;
  }
  Widget _homeBtn(){
    return Expanded(
      child: InkWell(onTap: (){
        bottomBarProviderModel!.setSelectedScreen(0);
        MyUtils.navigateAsFirstScreen(context, MainCategoriesScreen());
      }
        ,child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          TransitionImage(bottomBarProviderModel!.selectedScreen==0?Res.IC_HOME_BLUE:Res.IC_HOME_GREY,width: D.default_25,height: D.default_25,),
          Center(child:Text(tr("home"),style: S.h5(color: bottomBarProviderModel!.selectedScreen==0?C.BASE_BLUE:Colors.grey),),)
        ]
    ),));
  }
  Widget _favBtn(){
    return Expanded(
      child: InkWell(onTap: (){
        bottomBarProviderModel!.setSelectedScreen(1);
        if(Constants.currentUser!=null){
          MyUtils.navigate(context, FavScreen());
        }else{
          MyUtils.navigate(context, NoProfileScreen());
        }

      }
        ,child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          TransitionImage(bottomBarProviderModel!.selectedScreen==1?Res.IC_FAV_BLUE:Res.IC_FAV_GREY,width: D.default_25,height: D.default_25,),
          Center(child:Text(tr("fav"),style: S.h5(color: bottomBarProviderModel!.selectedScreen==1?C.BASE_BLUE:Colors.grey),),)
        ]
    ),));
  }
  Widget _notificationsBtn(){
    return Expanded(
      child: InkWell(onTap: (){
        bottomBarProviderModel!.setSelectedScreen(3);
        MyUtils.navigate(context, MyCardsScreen());
      }
        ,child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          TransitionImage("assets/images/card_ic.png",width: D.default_25,height: D.default_25,),
          Center(child:Text(tr("card"),style: S.h5(color: bottomBarProviderModel!.selectedScreen==3?C.BASE_BLUE:Colors.grey),),)
        ]
    ),));
  }
  Widget _profileBtn(){
    return Expanded(
      child: InkWell(onTap: (){
        bottomBarProviderModel!.setSelectedScreen(4);
        if(Constants.currentUser!=null){
          MyUtils.navigate(context, ProfileScreen());
        }else{
          MyUtils.navigate(context, NoProfileScreen());
        }
        //bottomBarProviderModel!.setSelectedScreen(4);

      }
        ,child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          TransitionImage(bottomBarProviderModel!.selectedScreen==4?Res.IC_PROFILE_BLUE:Res.IC_PROFILE_GREY,width: D.default_25,height: D.default_25,),
          Center(child:Text(tr("profile"),style: S.h5(color: bottomBarProviderModel!.selectedScreen==4?C.BASE_BLUE:Colors.grey),),)
        ]
    ),));
  }
  Widget _closestBtn(){
    return Expanded(
      child:InkWell(onTap: (){
        bottomBarProviderModel!.setSelectedScreen(2);
        MyUtils.navigate(context, NearToYouScreen());
      }
          ,child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            TransitionImage(bottomBarProviderModel!.selectedScreen==2?Res.IC_NEAR_BLUE:Res.IC_NEAR_GREY,width: D.default_25,height: D.default_25,),
            Center(child:Text(tr("closest"),style: S.h5(color: bottomBarProviderModel!.selectedScreen==2?C.BASE_BLUE:Colors.grey),),)
          ]
      ),));
  }
  Widget _SpHomeBtn(){
    return Expanded(
        child: InkWell(onTap: (){
          bottomBarProviderModel!.setSelectedScreen(0);
          MyUtils.navigateAsFirstScreen(context, SpHomeScreen());
        }
          ,child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                TransitionImage(bottomBarProviderModel!.selectedScreen==0?Res.IC_HOME_BLUE:Res.IC_HOME_GREY,width: D.default_25,height: D.default_25,),
                Center(child:Text(tr("home"),style: S.h5(color: bottomBarProviderModel!.selectedScreen==0?C.BASE_BLUE:Colors.grey),),)
              ]
          ),));
  }
  Widget _SpScanCodeBtn(){
    return Expanded(
        child: InkWell(onTap: (){
          bottomBarProviderModel!.setSelectedScreen(1);
          MyUtils.navigateAsFirstScreen(context, CodeScannerScreen());
        }
          ,child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                TransitionImage(bottomBarProviderModel!.selectedScreen==1?"assets/images/qr_icon_blue.png":"assets/images/qr_icon_black.png",width: D.default_25,height: D.default_25,),
                Center(child:Text(tr("code_tap"),style: S.h5(color: bottomBarProviderModel!.selectedScreen==1?C.BASE_BLUE:Colors.grey),),)
              ]
          ),));
  }


}

