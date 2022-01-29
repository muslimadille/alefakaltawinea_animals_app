import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/offer_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';


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
      showBottomBar: true,
      tag: "",
      body:Center(
          child: Container(
            padding: EdgeInsets.all(D.default_50),
            width: double.infinity,
            height: D.default_300,
            child: SfBarcodeGenerator(
              value: '${widget.offerModel.code}',
              symbology: QRCode(),
              showValue: true,
            ),
          )),);
  }

}
