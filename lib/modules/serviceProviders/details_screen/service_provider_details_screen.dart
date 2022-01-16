import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'offers/offers_list/service_provider_offers_list_screen.dart';


class ServiceProviderDetailsScreen extends StatefulWidget {
  Data serviceProviderData;
   ServiceProviderDetailsScreen(this.serviceProviderData) ;

  @override
  _ServiceProviderDetailsScreenState createState() => _ServiceProviderDetailsScreenState();
}

class _ServiceProviderDetailsScreenState extends State<ServiceProviderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      tag: "ServiceProviderDetailsScreen",
      showSettings: true,
      showBottomBar: true,
      showIntro: false,
      body:Column(children: [
        _infoCard(),
        Expanded(child: ServiceProviderOffersScreen(widget.serviceProviderData))
      ],)
    );
  }
  Widget _infoCard(){
    return Column(children: [
      Container(
        height: D.default_200,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white,
            boxShadow:[BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset:Offset(3,3),
                blurRadius:3,
                spreadRadius: 0.5
            )]
        ),
        child: Stack(children: [
          Column(children: [
            Expanded(child: TransitionImage(
              widget.serviceProviderData.bannerPhoto!,
              fit: BoxFit.cover,
              width: double.infinity,
            )),

          ],),
          Positioned(child: Container(
            padding: EdgeInsets.all(D.default_5),
            margin: EdgeInsets.all(D.default_10),
            width: D.default_60,
            height: D.default_60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(D.default_10),
                color: Colors.white,
                boxShadow:[BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset:Offset(4,4),
                    blurRadius:4,
                    spreadRadius: 2
                )]
            ),
            child:TransitionImage(
              widget.serviceProviderData.photo!,
              radius: D.default_10,
              fit: BoxFit.cover,
              width: double.infinity,
            ) ,
          ),),

        ],),
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(D.default_15),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow:[BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset:Offset(4,4),
                blurRadius:4,
                spreadRadius: 2
            )]
        ),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text(
                widget.serviceProviderData.name!
                ,style: S.h2(color:C.BASE_BLUE),),),
              TransitionImage(
                Res.IC_FAV_GREY,
                height: D.default_25,
                width: D.default_25,
              )

            ],),
          SizedBox(height: D.default_10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(children: [
                        Container(
                          child: Icon(Icons.add_location_alt,color: Colors.grey,size: D.default_20,),),
                        Expanded(child: Container(
                          padding:EdgeInsets.only(left:D.default_10,right:D.default_10,bottom: D.default_5),
                          child: Text(widget.serviceProviderData.address!,style: S.h4(color: Colors.grey),),)),
                        Container(
                          padding: EdgeInsets.only(left: D.default_10,right: D.default_10,top: D.default_5,bottom: D.default_5),
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(D.default_30),
                              boxShadow:[BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset:Offset(2,2),
                                  blurRadius:2,
                                  spreadRadius: 0.5
                              )]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.share_location,color: Colors.white,size: D.default_25,),
                              Text(tr("show_map"),style: S.h5(color: Colors.white),),

                            ],),
                        )

                      ],),
                      Row(children: [
                        Container(
                          child: Icon(Icons.local_phone,color: Colors.grey,size: D.default_20,),),
                        Container(
                          padding:EdgeInsets.only(left:D.default_10,right:D.default_10),
                          child: Text(widget.serviceProviderData.phone!,style: S.h4(color: Colors.grey),),),
                        Container(
                          child: Icon(Icons.web_rounded,color: Colors.grey,size: D.default_20,),),
                        InkWell(onTap: (){
                          _launchURL("www.google.com");
                        },
                          child: Container(
                            padding:EdgeInsets.only(left:D.default_10,right:D.default_10),
                            child: Text(widget.serviceProviderData.email!,style: S.h4(color: Colors.grey),),),)

                      ],)

                    ],)),
              
            ],)
        ],),
      )
    ],);
  }
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
