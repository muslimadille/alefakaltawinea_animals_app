import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../utils/my_utils/baseDimentions.dart';
import '../../utils/my_utils/baseTextStyle.dart';
import '../../utils/my_utils/constants.dart';
import '../../utils/my_utils/input _validation_mixing.dart';
import '../../utils/my_utils/myColors.dart';
import '../../utils/my_widgets/laoding_view.dart';
import '../login/provider/user_provider_model.dart';

class DeletAnimalPopupScreen extends StatefulWidget {
  final Function onAccept;
  final String title;
  const DeletAnimalPopupScreen({required this.onAccept,required this.title,Key? key}) : super(key: key);

  @override
  State<DeletAnimalPopupScreen> createState() => _DeletAnimalPopupScreenState();
}

class _DeletAnimalPopupScreenState extends State<DeletAnimalPopupScreen> with InputValidationMixin{


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(D.default_10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_10),
          color: Colors.white,
          boxShadow:[BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset:Offset(1,1),
              blurRadius:1,
              spreadRadius: 0.5
          )]
      ),
      child: Stack(
        alignment:AlignmentDirectional.center,
        children: [
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap:(){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.cancel,color: Colors.red,size: D.default_30,),)],),
            SizedBox(height:D.default_10),
            Text(widget.title,style: S.h4(),),
            SizedBox(height:D.default_10),
            Row(children: [
              Expanded(child: _acceptBtn(),),
              Expanded(child: _deleteBtn(),)
            ],)

          ],),
        ],),);
  }
  Widget _acceptBtn() {
    return InkWell(
      onTap: () async{
        widget.onAccept();
      },
      child: Container(
        margin: EdgeInsets.all(D.default_30),
        padding: EdgeInsets.only(
            left: D.default_10,
            right: D.default_10,
            top: D.default_5,
            bottom: D.default_5),
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
          tr("submit"),
          style: S.h3(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  Widget _deleteBtn() {
    return InkWell(
      onTap: () async{
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.all(D.default_30),
        padding: EdgeInsets.only(
            left: D.default_10,
            right: D.default_10,
            top: D.default_5,
            bottom: D.default_5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_15),
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(1, 1),
                  blurRadius: 1,
                  spreadRadius: 1)
            ]),
        child: Text(
          tr("cancel"),
          style: S.h3(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }



}
