
import 'package:alefakaltawinea_animals_app/modules/homeTabsScreen/homeTabsScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/homeTabsScreen/provider/intro_provider_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';




class BaseScreen extends StatefulWidget {
  Widget body;
  bool showSettings;
  bool showBottomBar;
  bool showIntro;
   BaseScreen({required this.body,required this.showSettings,required this.showBottomBar,this.showIntro=false});


  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> with TickerProviderStateMixin{

  AnimationController? _controller;
  Animation<double>? _animation;
  IntroProviderModel?introProviderModel;


  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _handelIntro();
  }
  @override
  Widget build(BuildContext context) {
    introProviderModel =Provider.of<IntroProviderModel>(context, listen: true);

    context.setLocale(Locale('ar', 'EG')) ;
    return  MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: SafeArea(child: Column(children: [
          widget.showSettings?_actionBar():Container(height: 0,),
          Expanded(child: widget.body,),
          widget.showBottomBar?HomeTabsScreen(introProviderModel,widget.showIntro):Container()
        ],)),
      ),
    );
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
        introProviderModel!.intro!=null?Opacity(opacity: _animation!.value,child:IconButton(key: introProviderModel!.intro!.keys[0],onPressed: (){}, splashColor:C.BASE_BLUE,icon: Icon(Icons.menu,color: Colors.grey,size: D.default_40)) ,):Container())
        ],),
      ),
    );
  }

  void _handelIntro(){
    _controller=AnimationController(vsync: this,duration:Duration(milliseconds: 200));
    _animation=Tween<double>(begin:0.0,end: 1.0 ).animate(_controller!)..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        setState(() {
        });
      }
    })..addListener(() {

    });
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      _controller!.forward();
    });
  }
}
