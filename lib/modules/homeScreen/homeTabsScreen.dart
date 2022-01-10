
import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/homeScreen/mainCategoriesScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/homeScreen/provider/intro_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/neerToYou/NearToyouScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/profile/profileScreen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class HomeTabsScreen extends StatefulWidget {
  IntroProviderModel?introProviderModel;

   HomeTabsScreen(this.introProviderModel) ;

  @override
  _HomeTabsScreenState createState() => _HomeTabsScreenState();
}

class _HomeTabsScreenState extends State<HomeTabsScreen> with TickerProviderStateMixin{
  PersistentTabController? _controller;
  AnimationController? _animationController;
  Animation<double>? _animation;
@override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _handelIntro();
}
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showSettings: true,
        body: PersistentTabView(
        context,
        controller: _controller,
        screens: _screens,
        items: _navBarsItems(context),
            padding:NavBarPadding.all(D.default_5),
        confineInSafeArea: false,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(0),
            colorBehindNavBar: Colors.black,
            boxShadow:[BoxShadow(
                color: Colors.grey,
                offset:Offset(0,0),
                blurRadius:D.default_1,
                spreadRadius: D.default_1
            )]
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style10 // Choose the nav bar style with this property.
    ));
  }
  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    List<PersistentBottomNavBarItem>list=
    [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: (tr("home")),
        textStyle: S.h4(),
        opacity: _animation!.value,
        contentPadding: D.default_10,
        activeColorPrimary: C.BASE_BLUE,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        activeColorSecondary: CupertinoColors.white,

      ),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.location_circle,key: widget.introProviderModel!.intro!.keys[1]),
          title: (tr("closest")),
          textStyle: S.h4(),
          activeColorPrimary: C.BASE_BLUE,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        activeColorSecondary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(

          icon: Icon(CupertinoIcons.profile_circled,key: widget.introProviderModel!.intro!.keys[2]),
          title: (tr("profile")),
          textStyle: S.h4(),
          activeColorPrimary: C.BASE_BLUE,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        activeColorSecondary: CupertinoColors.white,
      ),

    ];
    return list;
  }
  List<Widget>_screens=[MainCategoriesScreen(),NearToYouScreen(),ProfileScreen()];
  Intro _myIntro(){
    List<String>descriptionsList=[
      tr("intro_settings"),
      tr("intro_closest_btn"),
      tr("intro_profile_btn"),
    ];
    return MyUtils.myIntro(descriptionsList);
  }
  void _handelIntro(){
    widget.introProviderModel!.setIntro(_myIntro());
    _animationController=AnimationController(vsync: this,duration:Duration(milliseconds: 1000));
    _animation=Tween<double>(begin:0.0,end: 1.0 ).animate(_animationController!)..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        setState(() {
          widget.introProviderModel!.intro!.start(context);
        });
      }
    })..addListener(() {

    });
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      _animationController!.forward();
    });
  }

}

