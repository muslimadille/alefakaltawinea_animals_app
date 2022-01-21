import 'package:alefakaltawinea_animals_app/modules/serviceProviders/details_screen/offers/offer_details/offer_details_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
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
      widget.serviceProviderData.offers!.isNotEmpty?ListView.builder(
          itemCount: widget.serviceProviderData.offers!.length,
          padding: EdgeInsets.only(top:D.default_10,bottom:D.default_10),
          itemBuilder: (context,index){
            return  MaterialButton(onPressed: (){
              MyUtils.navigate(context, OfferDetailsScreen(widget.serviceProviderData,index));
            },
              padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left:D.default_15,right:D.default_15,top:D.default_5,bottom:D.default_5),
              padding: EdgeInsets.only(left:D.default_10,right:D.default_10,top:D.default_20,bottom:D.default_20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(D.default_10),
                  border: Border.all(color: C.BASE_BLUE,width: D.default_1),
                  color: Colors.white,
                  boxShadow:[BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset:Offset(2,2),
                      blurRadius:2,
                      spreadRadius: 2
                  )]
              ),
              child: Wrap(alignment:WrapAlignment.center
                  ,children: [
                //Text("خصم ",style: S.h4(color: C.BASE_BLUE),),
                //Text("${_getDescoundRaio(index)}%",style: S.h4(color: C.BASE_BLUE)),
                //Text(" على ",style: S.h4(color: C.BASE_BLUE)),
                Text("${widget.serviceProviderData.offers![index].title}",style: S.h4(color: C.BASE_BLUE),textAlign: TextAlign.center,),
               // Text(" بـ ",style: S.h4(color: C.BASE_BLUE)),
                //Text("${widget.serviceProviderData.offers![index]!.discountValue!}",style: S.h4(color: C.BASE_BLUE)),
               // Text(" ريال ",style: S.h4(color: C.BASE_BLUE)),
               // Text("بدلا من ",style: S.h4(color: C.BASE_BLUE)),
               // Text("${widget.serviceProviderData.offers![index]!.price!}",style: S.h4(color: C.BASE_BLUE)),
               // Text(" ريال ",style: S.h4(color: C.BASE_BLUE)),
              ],),
            ),);
          }):_noData())
    ],),);
  }
  double _getDescoundRaio(int index){
    double price=double.parse(widget.serviceProviderData.offers![index].price!);
    double discount=double.parse(widget.serviceProviderData.offers![index].discountValue!);
    double raio=(discount/price)*100;
    return raio;

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
    Text("لا توجد عروض متاحة حاليا",style: S.h3(color: C.BASE_BLUE),)
    ],),);
  }
}
