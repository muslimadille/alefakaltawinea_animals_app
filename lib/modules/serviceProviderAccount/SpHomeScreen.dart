import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/offers/offers_list/service_provider_offers_list_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';




class SpHomeScreen extends StatefulWidget {
  SpHomeScreen() ;

  @override
  _SpHomeScreenState createState() => _SpHomeScreenState();
}

class _SpHomeScreenState extends State<SpHomeScreen> {
  final _controller = PageController();
  int _currentSliderPager=0;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        tag: "SpHomeScreen",
        showBottomBar: true,
        showSettings: true,
        showIntro: false,
        body:Column(children: [
          _infoCard(),
         Expanded(child: _offersList())
        ],)
    );
  }
  Widget _infoCard(){
    return Column(children: [
      Container(
        height: D.default_100*3,
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
            Expanded(child: Container(child: Column(children: [
              Expanded(child: Container(
                  child:PageView(
                    children: _sliderItem(),
                    controller: _controller,
                    onPageChanged: (currentpage) {
                      setState(() {
                        _currentSliderPager=currentpage;
                      });
                    },
                  )
              )),
              Container(child: Center(child: Text(
                Constants.currentUser!.name!
                ,style: S.h1(color:C.BASE_BLUE),),)),
              Container(
                color: Colors.white,
                width: double.infinity,
                height: D.default_20,
                margin: EdgeInsets.only(bottom: D.default_5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotsIndicator(
                      dotsCount: Constants.currentUser!.photos!.isNotEmpty?Constants.currentUser!.photos!.length:1,
                      position: Constants.currentUser!.photos!.isNotEmpty?
                      _currentSliderPager.toDouble():0,
                      decorator: DotsDecorator(
                          color: C.BASE_BLUE.withOpacity(0.3),
                          activeColor: C.BASE_BLUE,
                          activeSize:Size(D.default_10,D.default_10),
                          size:Size(D.default_10,D.default_10),
                          spacing:EdgeInsets.all(D.default_5)
                      ),
                    )

                  ],
                ),)
            ],),)),
            Container(
              margin: EdgeInsets.only(bottom:D.default_10,left:D.default_20,right:D.default_20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                      child: Icon(Icons.add_location_alt,color: Colors.grey,size: D.default_20,),),
                    Expanded(child: Container(
                      padding:EdgeInsets.only(left:D.default_10,right:D.default_10,bottom: D.default_5),
                      child: Text(Constants.currentUser!.address!,style: S.h4(color: Colors.grey),),)),
                    InkWell(onTap: (){
                      _launchMapsUrl(
                          Constants.currentUser!.latitude!.isNotEmpty?double.parse(Constants.currentUser!.latitude!):0.0,
                          Constants.currentUser!.longitude!.isNotEmpty?double.parse(Constants.currentUser!.longitude!):0.0);
                    },child:  Container(
                      padding: EdgeInsets.only(left: D.default_10,right: D.default_10,top: D.default_5,bottom: D.default_5),
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(D.default_10),
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
                          Icon(Icons.share_location,color: Colors.white,size: D.default_20,),
                          Text(tr("show_map"),style: S.h5(color: Colors.white),),

                        ],),
                    ),)

                  ],),
                  InkWell(onTap: (){
                    launch("tel://0${Constants.currentUser!.phone!}");
                  },child: Row(children: [
                    Container(
                      child: Icon(Icons.local_phone,color: Colors.grey,size: D.default_20,),),
                    Container(
                      padding:EdgeInsets.only(left:D.default_10,right:D.default_10),
                      child: Text(Constants.currentUser!.phone!,style: S.h4(color: Colors.grey),),),
                    Constants.currentUser!.website!.isNotEmpty?InkWell(onTap: ()async{
                      await _launchURLBrowser();
                    },
                      child: Container(
                        padding:EdgeInsets.only(left:D.default_10,right:D.default_10),
                        child: Text(Constants.currentUser!.website!,style: S.h4(color: Colors.grey),),),):Container()

                  ],),),

                ],),)

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
              Constants.currentUser!.photo!,
              radius: D.default_10,
              fit: BoxFit.cover,
              width: double.infinity,
            ) ,
          ),),

        ],),
      ),

    ],);
  }
  _launchURLBrowser() async {
    final String ure=Constants.currentUser!.website??"";
    String  url = ure;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(msg: tr("cant_opn_url"),backgroundColor: Colors.red,textColor: Colors.white,);
    }
  }
  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(msg: tr("cant_opn_url"),backgroundColor: Colors.red,textColor: Colors.white,);

    }
  }
  List<Widget >_sliderItem(){
    List<Widget>items=[];

    items.add(
        Container(child:
        Column(children: [
          Expanded(child: TransitionImage(
            (Constants.currentUser!.bannerPhoto??"").contains("https")?Constants.currentUser!.bannerPhoto!:
            "https://alefak.com/uploads/${Constants.currentUser!.bannerPhoto!}",
            fit: BoxFit.cover,
            width: double.infinity,
          )),

        ],),)
    );
    for(int i=0;i<Constants.currentUser!.photos!.length;i++){
      items.add(
          Container(child:
          Column(children: [
            Expanded(child: TransitionImage(
              (Constants.currentUser!.photos![i].photo??"").contains("https")?Constants.currentUser!.photos![i].photo!:
              "https://alefak.com/uploads/${Constants.currentUser!.photos![i].photo!}",
              fit: BoxFit.cover,
              width: double.infinity,
            )),

          ],),)
      );
    }
    return items;
  }
  Widget _offersList(){
    return Container(
      margin: EdgeInsets.only(top: D.default_10),
      child: Column(children: [
        Expanded(child:
        Constants.currentUser!.offers!.isNotEmpty?ListView.separated(
          itemCount: Constants.currentUser!.offers!.length,
          padding: EdgeInsets.only(top:D.default_10,bottom:D.default_10),
          itemBuilder: (context,index){
            return  MaterialButton(onPressed: (){
              //MyUtils.navigate(context, OfferDetailsScreen(Constants.currentUser!,index));
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
                        Expanded(child: Container(child: Text(Constants.currentUser!.offers![index].title!,style: S.h2(color: C.BASE_BLUE),),),),
                      double.parse(Constants.currentUser!.offers![index]!.price!)>0?  Container(
                          margin:EdgeInsets.only(left:D.default_10,right:D.default_10),
                          child: Text("${Constants.currentUser!.offers![index]!.discountValue!}${tr("curncy")}",style: S.h2(color: C.BASE_BLUE),),):Container()
                      ],),
                    double.parse(Constants.currentUser!.offers![index]!.price!)>0?Text("${tr("init_price")} ${Constants.currentUser!.offers![index]!.price}${tr("curncy")}-${tr("wafer")}${_getDescoundRaio(index)}% ${tr("with_alifak_cart")}",style: S.h4(color: Colors.grey)):Container(),

                  ],),
              ),);
          }, separatorBuilder: (BuildContext context, int index) {
          return Container(margin:EdgeInsets.only(left: D.default_20,right: D.default_20),color: Colors.grey,height: D.default_1,);
        },):_noData())
      ],),);
  }
  double _getDescoundRaio(int index){
    double price=double.parse(Constants.currentUser!.offers![index].price!);
    double discount=double.parse(Constants.currentUser!.offers![index].discountValue!);
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
