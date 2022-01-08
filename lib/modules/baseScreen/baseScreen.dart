import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class BaseScreen extends StatefulWidget {
  Widget body;
  bool showSettings;
   BaseScreen({required this.body,this.showSettings=false});


  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    context.setLocale(Locale('en', 'US')) ;
    return  MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: SafeArea(child: Column(children: [
          widget.showSettings?_actionBar():Container(),
          Expanded(child: widget.body,)
        ],),),
      ),
    );
  }
  Widget _actionBar(){
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: D.default_1,color: Colors.grey)),
        color: Colors.white,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Center(
            child:
          IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.grey,size: D.default_40,)),)
        ],),
      ),
    );
  }
}
