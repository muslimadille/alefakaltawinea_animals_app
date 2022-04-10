import 'package:alefakaltawinea_animals_app/modules/serviceProviderAccount/provider/scan_code_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../utils/my_utils/baseTextStyle.dart';
import '../baseScreen/baseScreen.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class CodeScannerScreen extends StatefulWidget {
  const CodeScannerScreen({Key? key}) : super(key: key);

  @override
  _CodeScannerScreenState createState() => _CodeScannerScreenState();
}

class _CodeScannerScreenState extends State<CodeScannerScreen> {
  String _scanBarcode = 'Unknown';
  ScanCodeProvider? scanCodeProvider;

  @override
  void initState() {
    super.initState();
    scanCodeProvider = Provider.of<ScanCodeProvider>(context, listen: false);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      scanQR();
    });
  }

  @override
  Widget build(BuildContext context) {
    scanCodeProvider = Provider.of<ScanCodeProvider>(context, listen: true);
    return BaseScreen(
        tag: "SpHomeScreen",
        showBottomBar: true,
        showSettings: false,
        showIntro: false,
        body: scanCodeProvider!.scanCodeModel!=null?Container():_wrongCode());
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
    ],),);
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
}


