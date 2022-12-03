import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/offer_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/action_bar_widget.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/animal_cart_widget.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../../utils/my_utils/baseTextStyle.dart';
import '../../../utils/my_utils/constants.dart';
import '../../../utils/my_utils/myColors.dart';
import '../../../utils/my_utils/myUtils.dart';
import '../../cart/add_cart_screen.dart';
import '../../cart/provider/cart_provider.dart';
import '../../serviceProviders/list_screen/data/serviceProvidersModel.dart';

class OfferCodeScreen extends StatefulWidget {
  OfferModel offerModel;
  Data serviceProviderData;

  OfferCodeScreen(this.serviceProviderData, this.offerModel);

  @override
  _OfferCodeScreenState createState() => _OfferCodeScreenState();
}

class _OfferCodeScreenState extends State<OfferCodeScreen> {
  CartProvider? cartProvider;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider!.getMyCart(
        shop_id: widget.serviceProviderData.id!,
        offer_id: widget.offerModel.id!);
  }

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartProvider>(context, listen: true);
    return BaseScreen(
      showSettings: false,
      showBottomBar: false,
      tag: "",
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionBarWidget(
              "",
              context,
              backgroundColor: Colors.white,
              textColor: C.BASE_BLUE,
              enableShadow: false,
            ),
            Expanded(
                child: cartProvider!.isLoading
                    ? LoadingProgress()
                    : cartProvider!.myCarts.isNotEmpty
                        ? _codePart()
                        : _noCarts())
          ]),
    );
  }

  Widget _codePart() {
    return Column(
      children: [
        _selectedCart(_selectedIndex),
        cartProvider!.offerCode != ""
            ? Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(D.default_5),
                    color: Colors.white,
                    border:
                        Border.all(color: Colors.black, width: D.default_2)),
                margin: EdgeInsets.only(top: D.default_20),
                padding: EdgeInsets.all(D.default_10),
                height: D.default_150,
                width: D.default_150,
                child: SfBarcodeGenerator(
                  value: '${cartProvider!.offerCode}',
                  symbology: QRCode(),
                  showValue: false,
                ),
              )
            : Container(
                margin: EdgeInsets.only(top: D.default_20),
                padding: EdgeInsets.all(D.default_10),
                height: D.default_150,
                width: D.default_250,
                child: Center(
                  child: Text(tr("sould_out"),style: S.h2(),textAlign:TextAlign.center ,),
                ),
              ),
        Container(
            child: cartProvider!.offerCode != ""?Text(
              tr("show_code_for"),
              style: S.h3(color: Colors.grey),
            ):Container(),
            margin: EdgeInsets.only(
                left: D.default_50, right: D.default_50, top: D.default_40)),
        Container(
          color: Colors.grey,
          height: D.default_2,
          margin: EdgeInsets.only(
              left: D.default_50,
              right: D.default_50,
              top: D.default_10,
              bottom: D.default_10),
        ),
        Expanded(child: _cartList())
      ],
    );
  }

  Widget _cartList() {
    return Container(
      child: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          fit: StackFit.loose,
          children: carts(),
        ),
      ),
    );
  }

  List<Widget> carts() {
    List<Widget> items = [];
    for (int i = 0; i < cartProvider!.myCarts.length; i++) {
      items.add(_cartItem(i));
    }
    return items;
  }

  Widget _cartItem(int index) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
            margin: EdgeInsets.only(
                top: D.default_10 + (D.default_100 * index),
                bottom: D.default_10,
                ),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                  cartProvider!.useCode(widget.serviceProviderData.id!,
                      widget.offerModel.id!, cartProvider!.myCarts[index].id!);
                });
              },
              child: AnimalCartWidget(cart:cartProvider!.myCarts[index],),
            )));
  }


  Widget _selectedCart(int index) {
    return AnimalCartWidget(cart:cartProvider!.myCarts[index]);
  }

  Widget _noCarts() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tr("dont_have_cart_title"),
            style: S.h1(color: C.BASE_BLUE),
          ),
          Text(
            tr("dont_have_cart_subtitle"),
            style: S.h2(color: Colors.grey),
          ),
          SizedBox(
            height: D.default_40,
          ),
          _addCartBtn(),
        ],
      ),
    );
  }

  Widget _addCartBtn() {
    return Center(
      child: InkWell(
        onTap: () {
          MyUtils.navigate(context, AddCartScreen());
        },
        child: Container(
          width: D.default_250,
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
            tr("add_cart"),
            style: S.h1(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
