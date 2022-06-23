import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

import '../../modules/cart/provider/cart_provider.dart';
import '../my_utils/baseDimentions.dart';
import '../my_utils/baseTextStyle.dart';
import '../my_utils/myColors.dart';

class CobonWidget extends StatefulWidget {
  const CobonWidget({Key? key}) : super(key: key);

  @override
  State<CobonWidget> createState() => _CobonWidgetState();
}

class _CobonWidgetState extends State<CobonWidget> {
  TextEditingController cobonController=TextEditingController();
  CartProvider? cartProvider;

  @override
  void initState() {
    super.initState();
    cartProvider=Provider.of<CartProvider>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    cartProvider=Provider.of<CartProvider>(context,listen: true);
    return Container(
      height: D.default_250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(D.default_50),
              topRight: Radius.circular(D.default_50)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 3)
          ]),
      margin: EdgeInsets.only(top: D.default_10),
      padding: EdgeInsets.only(top:D.default_10,bottom: D.default_10,left: D.default_20,right: D.default_20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Container(height: D.default_5,width: D.default_150,color: Colors.grey,margin: EdgeInsets.all(D.default_10),),),
          Container(
            margin: EdgeInsets.only(bottom: D.default_10),
            child: Text(tr("cobon_add"),style: S.h3(color:Colors.grey),),),
          TextFormField(
            enabled: true,
            style: S.h3(),
            controller: cobonController,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: C.BASE_BLUE),
              ),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: C.BASE_BLUE)),
              errorStyle: S.h4(color: Colors.red),
              contentPadding: EdgeInsets.all(D.default_5),
            ),
            keyboardType: TextInputType.text,
            obscureText: false,
            cursorColor: C.BASE_BLUE,
            autofocus: false,
          ),
          SizedBox(height: D.default_20,),
          Center(
            child: InkWell(
              onTap: () async{
                //showBottomSheet();
                await cartProvider!.checkCobon(context, cobonController.value.text.toString());
                cartProvider!.setShowCobonPart(false);
              },
              child: Container(
                width: D.default_100*2.8,
                margin: EdgeInsets.all(D.default_10),
                padding: EdgeInsets.only(
                    left: D.default_10,
                    right: D.default_10,
                    top: D.default_8,
                    bottom: D.default_8),
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
                  tr("check"),
                  style: S.h1Bold(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],),
    );
  }

}
