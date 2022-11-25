import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/offer_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/action_bar_widget.dart';
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
            padding: EdgeInsets.only(left: D.default_5, right: D.default_5),
            margin: EdgeInsets.only(
                top: D.default_10 + (D.default_100 * index),
                bottom: D.default_10,
                left: D.default_20,
                right: D.default_20),
            width: MediaQuery.of(context).size.width * 7,
            height: D.default_260,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bit_card_bg.png")),
              borderRadius: BorderRadius.circular(D.default_10),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                  cartProvider!.useCode(widget.serviceProviderData.id!,
                      widget.offerModel.id!, cartProvider!.myCarts[index].id!);
                });
              },
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.expand,
                children: [
                  Positioned(
                    child: TransitionImage(
                      "assets/images/bit_cart_dog_logo.png",
                      width: MediaQuery.of(context).size.width,
                      height: D.default_180,
                      fit: BoxFit.fitWidth,
                    ),
                    bottom: D.default_30,
                    left: 0,
                    right: 0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: D.default_230,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(D.default_10),
                                  topRight: Radius.circular(D.default_10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.9),
                                    offset: Offset(1, 0),
                                    blurRadius: 1,
                                    spreadRadius: 1)
                              ]),
                          height: D.default_40,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              "PET IDENTIFICATION هوية الحيوان الأليف",
                              style: S.h3(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: D.default_2,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                          margin: EdgeInsets.only(
                              top: D.default_2, bottom: D.default_2),
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.only(
                              bottom: D.default_65,
                              left: D.default_20,
                              right: D.default_80,
                              top: D.default_10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: D.default_5, bottom: D.default_10),
                                child: TransitionImage(
                                  cartProvider!.myCarts[index].photo ?? "",
                                  height: double.infinity,
                                  width: D.default_70,
                                  fit: BoxFit.cover,
                                  strokeColor: Colors.black,
                                  strokeWidth: D.default_2,
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    cartDataItem(
                                        "Name of pet",
                                        "اسم الأليف",
                                        cartProvider!.myCarts[index].name ??
                                            ""),
                                    cartDataItem(
                                        "Address",
                                        "البلد",
                                        cartProvider!.myCarts[index].country ??
                                            ""),
                                    cartDataItem(
                                        "Breed",
                                        "الفصيلة",
                                        cartProvider!.myCarts[index].family ??
                                            ""),
                                    cartDataItem(
                                        "Gender",
                                        "الجنس",
                                        cartProvider!.myCarts[index].gender ??
                                            ""),
                                    cartDataItem("owner name", "اسم المربي",
                                        Constants.currentUser!.name ?? ""),
                                    cartDataItem(
                                        "Expiration date",
                                        "انتهاء البطاقة",
                                        cartProvider!
                                                .myCarts[index].expiration_at ??
                                            "")
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget cartDataItem(String nameEn, String nameAr, String value) {
    return Container(
      margin: EdgeInsets.only(left: D.default_5, right: D.default_8),
      child: Row(
        children: [
          Text(
            nameEn,
            style: S.h5(color: Colors.black),
            textAlign: TextAlign.start,
          ),
          Expanded(
              child: Text(
            value,
            style: S.h5(color: Colors.black),
            textAlign: TextAlign.center,
          )),
          Text(
            nameAr,
            style: S.h5(color: Colors.black),
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }

  Widget _selectedCart(int index) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
            padding: EdgeInsets.only(left: D.default_5, right: D.default_5),
            margin: EdgeInsets.only(
                top: D.default_10, left: D.default_20, right: D.default_20),
            width: MediaQuery.of(context).size.width * 7,
            height: D.default_260,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bit_card_bg.png")),
              borderRadius: BorderRadius.circular(D.default_10),
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              fit: StackFit.expand,
              children: [
                Positioned(
                  child: TransitionImage(
                    "assets/images/bit_cart_dog_logo.png",
                    width: MediaQuery.of(context).size.width,
                    height: D.default_200,
                    fit: BoxFit.fill,
                  ),
                  bottom: D.default_30,
                  left: 0,
                  right: 0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: D.default_230,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(D.default_10),
                                topRight: Radius.circular(D.default_10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.9),
                                  offset: Offset(1, 0),
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ]),
                        height: D.default_40,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "PET IDENTIFICATION هوية الحيوان الأليف",
                            style: S.h3(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        height: D.default_2,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                        margin: EdgeInsets.only(
                            top: D.default_2, bottom: D.default_2),
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(
                            bottom: D.default_65,
                            left: D.default_20,
                            right: D.default_70,
                            top: D.default_10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: D.default_5, bottom: D.default_10),
                              child: TransitionImage(
                                cartProvider!.myCarts[index].photo ?? "",
                                height: double.infinity,
                                width: D.default_70,
                                fit: BoxFit.cover,
                                strokeColor: Colors.black,
                                strokeWidth: D.default_2,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  cartDataItem("Name of pet", "اسم الأليف",
                                      cartProvider!.myCarts[index].name ?? ""),
                                  cartDataItem(
                                      "Address",
                                      "البلد",
                                      cartProvider!.myCarts[index].country ??
                                          ""),
                                  cartDataItem(
                                      "Breed",
                                      "الفصيلة",
                                      cartProvider!.myCarts[index].family ??
                                          ""),
                                  cartDataItem(
                                      "Gender",
                                      "الجنس",
                                      cartProvider!.myCarts[index].gender ??
                                          ""),
                                  cartDataItem("owner name", "اسم المربي",
                                      Constants.currentUser!.name ?? ""),
                                  cartDataItem(
                                      "Expiration date",
                                      "انتهاء البطاقة",
                                      cartProvider!
                                              .myCarts[index].expiration_at ??
                                          "")
                                ],
                              ),
                            ))
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            )));
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
