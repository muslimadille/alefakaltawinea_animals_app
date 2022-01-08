
import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/homeScreen/mainCategoriesScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/neerToYou/NearToyouScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/profile/profileScreen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeTabsScreen extends StatefulWidget {
  const HomeTabsScreen({Key? key}) : super(key: key);

  @override
  _HomeTabsScreenState createState() => _HomeTabsScreenState();
}

class _HomeTabsScreenState extends State<HomeTabsScreen> {
  PersistentTabController? _controller;
  Intro? intro;
@override
  void initState() {
    super.initState();
    intro=_myIntro();
    _controller = PersistentTabController(initialIndex: 0);
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
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        activeColorSecondary: CupertinoColors.white,

      ),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.location_circle,),
          title: (tr("closest")),
          textStyle: S.h4(),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          activeColorSecondary: CupertinoColors.white

      ),
      PersistentBottomNavBarItem(

          icon: Icon(CupertinoIcons.profile_circled),
          title: (tr("profile")),
          textStyle: S.h4(),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          activeColorSecondary: CupertinoColors.white

      ),

    ];
    return list;
  }
  List<Widget>_screens=[MainCategoriesScreen(),NearToYouScreen(),ProfileScreen()];
  Intro _myIntro(){
    List<String>descriptionsList=[
      "يمكنك الإتطلاع علي بيانات حسابك الشخصي وتعديلها",
      "يمكنك العثور علي اقرب العروض لديك"
    ];
    return MyUtils.myIntro(descriptionsList);
  }
}

