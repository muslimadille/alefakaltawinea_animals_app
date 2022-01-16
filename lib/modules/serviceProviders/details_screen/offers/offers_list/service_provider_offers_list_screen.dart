import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/provider/sevice_providers_provicer_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
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
            return  Container(
              padding: EdgeInsets.only(left:D.default_15,right:D.default_10,top:D.default_20,bottom:D.default_20),
                margin: EdgeInsets.all(D.default_10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(D.default_10),
                    color: Colors.white,
                    boxShadow:[BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset:Offset(2,2),
                        blurRadius:1,
                        spreadRadius: 0.5
                    )]
                ),
              child: Wrap(children: [
                Text("خصم ",style: S.h4(color: Colors.deepOrange),),
                Text("15%",style: S.h4(color: Colors.deepOrange)),
                Text(" على ",style: S.h4(color: Colors.deepOrange)),
                Text("التطعيم ضد حشرات الفرو",style: S.h4(color: Colors.deepOrange)),
                Text(" بـ ",style: S.h4(color: Colors.deepOrange)),
                Text("120",style: S.h4(color: Colors.deepOrange)),
                Text(" ريال ",style: S.h4(color: Colors.deepOrange)),
                Text("بدلا من ",style: S.h4(color: Colors.deepOrange)),
                Text("260",style: S.h4(color: Colors.deepOrange)),
                Text(" ريال ",style: S.h4(color: Colors.deepOrange)),
              ],),
            );
          }),)
    ],),);
  }
}
