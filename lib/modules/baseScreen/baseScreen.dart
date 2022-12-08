
import 'package:alefakaltawinea_animals_app/modules/homeTabsScreen/homeTabsScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/homeTabsScreen/provider/intro_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/settings/settings_screen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/providers.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';




class BaseScreen extends StatefulWidget {
  bool showWhatsIcon;
  String tag;
  Widget body;
  bool showSettings;
  bool showBottomBar;
  bool showIntro;
   BaseScreen({this.showWhatsIcon=true,required this.body,required this.showSettings,required this.showBottomBar,this.showIntro=false,required this.tag});


  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> with TickerProviderStateMixin{

  IntroProviderModel?introProviderModel;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SharedPreferences? prefs;
  UtilsProviderModel?utilsProviderModel;





  @override
  void initState() {
    super.initState();
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: false);
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    //Constants.utilsProviderModel!.setCurrentLocal(context,Constants.utilsProviderModel!.currentLocal);


  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Constants.DEVICE_RATIO=MediaQuery.of(context).size.height/MediaQuery.of(context).size.width;
    Constants.DEVICE_HEIGHT=MediaQuery.of(context).size.height;
    Constants.DEVICE_WIDTH=MediaQuery.of(context).size.width;

    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: true);
    introProviderModel =Provider.of<IntroProviderModel>(context, listen: true);
    return SafeArea(child: Scaffold(
        key: _scaffoldKey,
        body: Column(children: [
          widget.showSettings?_actionBar():Container(height: 0,),
          Expanded(child:
            Stack(
              alignment:AlignmentDirectional.center,
              children: [
              widget.body,
                widget.showWhatsIcon?Positioned(child: InkWell(
                onTap: (){
                  MyUtils.openwhatsapp(context);
                },
                child: Container(
                width: D.default_50,
                height: D.default_50,
                margin: EdgeInsets.only(bottom:D.default_5,left:D.default_5,right:D.default_5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(D.default_200),

                ),
                child: Center(child: TransitionImage("assets/images/whatsapp.png",width: D.default_50,height: D.default_50,fit: BoxFit.fitWidth,),),
              ),),bottom: 0,left: utilsProviderModel!.isArabic?0:null,right: utilsProviderModel!.isEnglish?0:null):Container()
            ],),),
          widget.showBottomBar?HomeTabsScreen(introProviderModel,introProviderModel!=null&&widget.tag=="MainCategoriesScreen"):Container()
        ],),
      resizeToAvoidBottomInset: true,

    ),);
  }
  Widget _actionBar(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
          boxShadow:[BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset:Offset(2,2),
              blurRadius:2,
              spreadRadius: 2
          )]
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Center(
            child:
        IconButton(key:Key("setting_btn"),onPressed: (){
          MyUtils.navigate(context, SettingScreen());
        }, icon: Icon(Icons.segment,color: C.BASE_BLUE,size: D.default_30)))
        ],),
      ),
    );
  }


}
