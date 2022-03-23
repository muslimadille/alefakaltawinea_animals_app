import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/offer_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/action_bar_widget.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../../utils/my_utils/baseTextStyle.dart';
import '../../../utils/my_utils/myColors.dart';


class OfferCodeScreen extends StatefulWidget {
  OfferModel offerModel;
   OfferCodeScreen(this.offerModel);
  @override
  _OfferCodeScreenState createState() => _OfferCodeScreenState();
}

class _OfferCodeScreenState extends State<OfferCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showSettings: false,
      showBottomBar: false,
      tag: "",
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            ActionBarWidget("", context,backgroundColor: Colors.white,textColor: C.BASE_BLUE,enableShadow: false,),
            Expanded(child: _selectedCart()),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(D.default_5),
                  color: Colors.white,
                  border: Border.all(color: Colors.black,width: D.default_2)
              ),
              padding: EdgeInsets.all(D.default_10),
              height: D.default_150,
              width: D.default_150,
              child: SfBarcodeGenerator(
                value: '${widget.offerModel.code}',
                symbology: QRCode(),
                showValue: false,
              ),
            ),
            Container(child: Text(tr("show_code_for"),style: S.h3(color: Colors.grey),),margin: EdgeInsets.only(left:D.default_50,right: D.default_50,top: D.default_40)),
            Container(color: Colors.grey,height: D.default_2,margin: EdgeInsets.only(left:D.default_50,right: D.default_50,top: D.default_10,bottom: D.default_10),),
            Expanded(child: _cartList())
          ] ),);
  }
Widget _cartList(){
    return Container(
      child:SingleChildScrollView(child:  Stack(
      alignment:AlignmentDirectional.topCenter,
      fit:StackFit.loose,
      children: carts(),),),);
}
List<Widget> carts(){
    List<Widget>items=[];
    for(int i=0;i<5;i++){
      items.add(
        Container(
            decoration:  BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(1, 1), // changes position of shadow
                ),
              ],
            ),
          margin: EdgeInsets.only(top:D.default_80*(i),left: D.default_50,right: D.default_50 ),
          child: TransitionImage("assets/images/cart_img.png",
          fit: BoxFit.cover,),
        )
      );
    }
    return items;
}
Widget _selectedCart(){
    return Container(
      width:double.infinity,
      height: D.default_150,
      decoration:  BoxDecoration(

      ),
      margin: EdgeInsets.only(top:D.default_20,bottom: D.default_20,left: D.default_50,right: D.default_50 ),
      child: TransitionImage("assets/images/cart_img.png",
        width:double.infinity,
        height: D.default_150,
        fit: BoxFit.fitWidth,),
    );
}
}
