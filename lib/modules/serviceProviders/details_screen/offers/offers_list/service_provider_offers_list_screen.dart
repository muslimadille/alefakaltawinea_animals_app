import 'package:alefakaltawinea_animals_app/modules/serviceProviders/details_screen/offers/offer_details/offer_details_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
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
      Expanded(child:ListView.builder(
          itemCount: 4,
          padding: EdgeInsets.all(D.default_10),
          itemBuilder: (context,index){
            return  MaterialButton(onPressed: (){
              MyUtils.navigate(context, OfferDetailsScreen(widget.serviceProviderData));
            },
              padding: EdgeInsets.zero,
            child: Container(
              padding: EdgeInsets.only(left:D.default_15,right:D.default_10,top:D.default_20,bottom:D.default_20),
              margin: EdgeInsets.all(D.default_10),
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
              child: Wrap(children: [
                Text("خصم ",style: S.h4(color: C.BASE_BLUE),),
                Text("15%",style: S.h4(color: C.BASE_BLUE)),
                Text(" على ",style: S.h4(color: C.BASE_BLUE)),
                Text("التطعيم ضد حشرات الفرو",style: S.h4(color: C.BASE_BLUE)),
                Text(" بـ ",style: S.h4(color: C.BASE_BLUE)),
                Text("120",style: S.h4(color: C.BASE_BLUE)),
                Text(" ريال ",style: S.h4(color: C.BASE_BLUE)),
                Text("بدلا من ",style: S.h4(color: C.BASE_BLUE)),
                Text("260",style: S.h4(color: C.BASE_BLUE)),
                Text(" ريال ",style: S.h4(color: C.BASE_BLUE)),
              ],),
            ),);
          }),)
    ],),);
  }
}
