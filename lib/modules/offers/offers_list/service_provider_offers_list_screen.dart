import 'package:alefakaltawinea_animals_app/modules/offers/offer_details/offer_details_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ServiceProviderOffersScreen extends StatefulWidget {
  Data serviceProviderData;
  ServiceProviderOffersScreen(this.serviceProviderData);

  @override
  _ServiceProviderOffersScreenState createState() => _ServiceProviderOffersScreenState();
}

class _ServiceProviderOffersScreenState extends State<ServiceProviderOffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: D.default_10),
      child: Column(children: [
      Expanded(child:
      widget.serviceProviderData.offers!.isNotEmpty?ListView.separated(
          itemCount: widget.serviceProviderData.offers!.length,
          padding: EdgeInsets.only(top:D.default_10,bottom:D.default_10),
          itemBuilder: (context,index){
            return  MaterialButton(onPressed: (){
              MyUtils.navigate(context, OfferDetailsScreen(widget.serviceProviderData,index));
            },
              padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left:D.default_15,right:D.default_15,top:D.default_5),
              padding: EdgeInsets.only(left:D.default_10,right:D.default_10,top:D.default_20,bottom:D.default_10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Expanded(child: Container(child: Text(widget.serviceProviderData.offers![index].title!,style: S.h2(color: C.BASE_BLUE),),),),
                  Container(
                    margin:EdgeInsets.only(left:D.default_10,right:D.default_10),
                    child: Text("${widget.serviceProviderData.offers![index]!.discountValue!}${tr("curncy")}",style: S.h2(color: C.BASE_BLUE),),)
                ],),
                  Text("${tr("init_price")} ${widget.serviceProviderData.offers![index]!.price}${tr("curncy")}-${tr("wafer")}${_getDescoundRaio(index)}% ${tr("with_alifak_cart")}",style: S.h4(color: Colors.grey)),

                ],),
            ),);
          }, separatorBuilder: (BuildContext context, int index) {
            return Container(margin:EdgeInsets.only(left: D.default_20,right: D.default_20),color: Colors.grey,height: D.default_1,);
      },):_noData())
    ],),);
  }
  double _getDescoundRaio(int index){
    double price=double.parse(widget.serviceProviderData.offers![index].price!);
    double discount=double.parse(widget.serviceProviderData.offers![index].discountValue!);
    double raio=((price-discount)/price)*100;
    return raio.toInt().toDouble();

  }
  Widget _noData(){
    return Container(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    TransitionImage(Res.OFFER_ICON,
    width: D.default_60,
        height: D.default_60,
    ),
    SizedBox(height: D.default_20,),
    Text(tr("no_offers"),style: S.h3(color: C.BASE_BLUE),)
    ],),);
  }
}
