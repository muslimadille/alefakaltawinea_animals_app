import 'package:alefakaltawinea_animals_app/modules/spalshScreen/spalshScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';



class BaseScreen extends StatefulWidget {
  Widget body;
   BaseScreen({required this.body});

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MusDev',
      theme: ThemeData(primarySwatch: Colors.amber),
      home:Scaffold(
        body: widget.body,
      ),
    );
  }
}
