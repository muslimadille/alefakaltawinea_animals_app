
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
import 'package:flutter_intro/flutter_intro.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import '../notifications/notifications_screen.dart';
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
@override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
   // _handelIntro();
}

  @override
  Widget build(BuildContext context) {
    bottomBarProviderModel=Provider.of<BottomBarProviderModel>(context,listen: true);
    return  _bottomBar();
  }
 
  List<Widget>_screens=[MainCategoriesScreen(),NearToYouScreen(),ProfileScreen(),ProfileScreen(),ProfileScreen(),ProfileScreen()];
  /*Intro _myIntro(){
    List<String>descriptionsList=[
      tr("intro_settings"),
      tr("intro_fav"),
      tr("intro_closest_btn"),
      tr("intro_notification_btn"),
      tr("intro_profile_btn"),
    ];
    return MyUtils.myIntro(descriptionsList);
  }*/
  /*void _handelIntro()async{

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if(widget.showIntro) {
        await widget.introProviderModel!.setIntro(_myIntro());
      }
      setState(() async {
        if(widget.showIntro) widget.introProviderModel!.intro!.start(context);
      });
    });
  }*/
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
        children: [
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
          Center(child:Text(tr("home"),style: S.h4(color: bottomBarProviderModel!.selectedScreen==0?C.BASE_BLUE:Colors.grey),),)
        ]
    ),));
  }
  Widget _favBtn(){
    return Expanded(
      //key:widget.showIntro? widget.introProviderModel!.intro!.keys[1]:Key("_favBtn"),
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
          Center(child:Text(tr("fav"),style: S.h4(color: bottomBarProviderModel!.selectedScreen==1?C.BASE_BLUE:Colors.grey),),)
        ]
    ),));
  }
  Widget _notificationsBtn(){
    return Expanded(
      //key: widget.showIntro?widget.introProviderModel!.intro!.keys[3]:Key("_notificationsBtn"),
      child: InkWell(onTap: (){
        bottomBarProviderModel!.setSelectedScreen(3);
        MyUtils.navigate(context, NotificationsScreen());
      }
        ,child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          TransitionImage(bottomBarProviderModel!.selectedScreen==3?Res.IC_NOTIFICATIONS_BLUE:Res.IC_NOTIFICATIONS_GREY,width: D.default_25,height: D.default_25,),
          Center(child:Text(tr("notifications"),style: S.h4(color: bottomBarProviderModel!.selectedScreen==3?C.BASE_BLUE:Colors.grey),),)
        ]
    ),));
  }
  Widget _profileBtn(){
    return Expanded(
     // key: widget.showIntro?widget.introProviderModel!.intro!.keys[4]:Key("_profileBtn"),
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
          Center(child:Text(tr("profile"),style: S.h4(color: bottomBarProviderModel!.selectedScreen==4?C.BASE_BLUE:Colors.grey),),)
        ]
    ),));
  }
  Widget _closestBtn(){
    return Expanded(
      //key: widget.showIntro?widget.introProviderModel!.intro!.keys[2]:Key("_closestBtn"),
      child:InkWell(onTap: (){
        bottomBarProviderModel!.setSelectedScreen(2);
        MyUtils.navigate(context, NearToYouScreen());
      }
          ,child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            TransitionImage(bottomBarProviderModel!.selectedScreen==2?Res.IC_NEAR_BLUE:Res.IC_NEAR_GREY,width: D.default_25,height: D.default_25,),
            Center(child:Text(tr("closest"),style: S.h4(color: bottomBarProviderModel!.selectedScreen==2?C.BASE_BLUE:Colors.grey),),)
          ]
      ),));
  }

}

