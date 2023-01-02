import 'package:alefakaltawinea_animals_app/modules/serviceProviderAccount/provider/scan_code_provider.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../utils/my_utils/baseDimentions.dart';
import '../../utils/my_utils/baseTextStyle.dart';
import '../../utils/my_utils/myColors.dart';
import '../../utils/my_utils/myUtils.dart';
import '../baseScreen/baseScreen.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../homeTabsScreen/provider/bottom_bar_provider_model.dart';
import 'SpHomeScreen.dart';


class CodeScannerScreen extends StatefulWidget {
  const CodeScannerScreen({Key? key}) : super(key: key);

  @override
  _CodeScannerScreenState createState() => _CodeScannerScreenState();
}

class _CodeScannerScreenState extends State<CodeScannerScreen> {
  String _scanBarcode = 'Unknown';
  ScanCodeProvider? scanCodeProvider;
  BottomBarProviderModel?bottomBarProviderModel;


  @override
  void initState() {
    super.initState();
    scanCodeProvider = Provider.of<ScanCodeProvider>(context, listen: false);
    bottomBarProviderModel=Provider.of<BottomBarProviderModel>(context,listen: false);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      scanQR();
    });
  }

  @override
  Widget build(BuildContext context) {
    scanCodeProvider = Provider.of<ScanCodeProvider>(context, listen: true);
    bottomBarProviderModel=Provider.of<BottomBarProviderModel>(context,listen: true);
    return BaseScreen(
        tag: "SpHomeScreen",
        showBottomBar: true,
        showSettings: false,
        showIntro: false,
        body:  scanCodeProvider!.isLoading? LoadingProgress():scanCodeProvider!.scanCodeModel!=null?_offerDetails():scanCodeProvider!.isFirst?Container():_wrongCode());
  }

  Widget _wrongCode() {
    return Container(
        alignment: Alignment.center,
        child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () => scanQR(),
                  child: Text(tr("try_again_code"))),
              Text(tr("wrong_code"),
                  style:S.h2(color: Colors.grey))
            ]));
  }

  Widget _offerDetails() {
    return Container(child: Column(children: [
      SizedBox(height: D.default_200,),
      _nameItem(),
      Container(height: D.default_1,color: Colors.grey,width: MediaQuery.of(context).size.width,),
      _numbersItem(),
      Container(height: D.default_1,color: Colors.grey,width: MediaQuery.of(context).size.width,),
      SizedBox(height: D.default_20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        _submitBtn(),
        _cancelBtn()
      ],),
      SizedBox(height: D.default_40,),
      Column(children: _benifitsList(),),

    ],),);
  }
  Widget _cancelBtn() {
    return Center(
      child: InkWell(
        onTap: () {
          bottomBarProviderModel!.setSelectedScreen(0);
          MyUtils.navigateAsFirstScreen(context, SpHomeScreen());
        },
        child: Container(
          width: D.default_130,
          margin: EdgeInsets.all(D.default_5),
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
            tr("cancel"),
            style: S.h1Bold(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
  Widget _submitBtn() {
    return Center(
      child: InkWell(
        onTap: () {
          scanCodeProvider!.scanCode(context, _scanBarcode, 1).then((value){
            if(value){
              bottomBarProviderModel!.setSelectedScreen(0);
              MyUtils.navigateAsFirstScreen(context, SpHomeScreen());
            }
          });
        },
        child: Container(
          width: D.default_130,
          margin: EdgeInsets.all(D.default_5),
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
            tr("submit"),
            style: S.h1Bold(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
  Widget _nameItem(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left:D.default_15,right:D.default_15,top:D.default_5),
      padding: EdgeInsets.only(left:D.default_10,right:D.default_10,top:D.default_20,bottom:D.default_10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container(child: Text(scanCodeProvider!.scanCodeModel!.offer!.title!,style: S.h1Bold(color: C.BASE_BLUE),),),),
             double.parse(scanCodeProvider!.scanCodeModel!.offer!.price!)>0? Container(
                margin:EdgeInsets.only(left:D.default_10,right:D.default_10),
                child: Text("${scanCodeProvider!.scanCodeModel!.offer!.discountValue!}${tr("curncy")}",style: S.h2(color: C.BASE_BLUE),),):Container()
            ],),
          double.parse(scanCodeProvider!.scanCodeModel!.offer!.price!)>0?Text("${tr("init_price")} ${scanCodeProvider!.scanCodeModel!.offer!.price}${tr("curncy")}-${tr("wafer")}${_getDescoundRaio()}% ${tr("with_alifak_cart")}",style: S.h4(color: Colors.grey)):Container(),

        ],),
    );
  }
  double _getDescoundRaio(){
    double price=double.parse(scanCodeProvider!.scanCodeModel!.offer!.price!);
    double discount=double.parse(scanCodeProvider!.scanCodeModel!.offer!.discountValue!);
    double raio=((price-discount)/price)*100;
    return raio.toInt().toDouble();

  }
  Widget _numbersItem(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left:D.default_15,right:D.default_15,top:D.default_5),
      padding: EdgeInsets.only(left:D.default_10,right:D.default_10,top:D.default_20,bottom:D.default_10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container(child: Text(tr("remains_times"),style: S.h1Bold(color: C.BASE_BLUE),),),),
              Container(
                margin:EdgeInsets.only(left:D.default_10,right:D.default_10),
                child: Text((int.parse(scanCodeProvider!.scanCodeModel!.offer!.usageTimes??"0")-scanCodeProvider!.scanCodeModel!.userUsageCount!).toString()+" ${tr("times")}",style: S.h2(color: C.BASE_BLUE),),)
            ],),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container(child: Text(tr("total_usage"),style: S.h4(color: Colors.grey),),),),
              Container(
                margin:EdgeInsets.only(left:D.default_10,right:D.default_10),
                child: Text("${scanCodeProvider!.scanCodeModel!.offer!.usageTimes??"0"} ${tr("times")}",style: S.h4(color: Colors.grey),),)
            ],),

        ],),
    );
  }
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      scanCodeProvider!.scanCode(context, barcodeScanRes, 0);
    });
  }
  List<Widget>  _benifitsList(){
    List<Widget> beni=[];
    beni.add(
        Container(
          margin: EdgeInsets.only(left:D.default_20,right:D.default_20,top: D.default_5),
          child: Row(
            children: [
              Expanded(child: Text(tr("offer_terms"),style: S.h1(color: Colors.grey),textAlign:TextAlign.start ,))
            ],),)
    );
    for(int i=0;i<scanCodeProvider!.scanCodeModel!.offer!.features!.length;i++){
      beni.add(
          Container(
            margin: EdgeInsets.only(left:D.default_20,right:D.default_20,top: D.default_5),
            child: Row(
              children: [
                Expanded(child: Text("-${scanCodeProvider!.scanCodeModel!.offer!.features![i].ar}",style: S.h3(color:Colors.grey),textAlign:TextAlign.start ,))
              ],),)
      );
    }
    return beni ;
  }

}


