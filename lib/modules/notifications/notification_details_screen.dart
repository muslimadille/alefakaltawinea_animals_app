import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/profile/no_profile_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/my_fonts.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/action_bar_widget.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/my_utils/resources.dart';
import '../offers/offer_details/offer_code_screen.dart';
import '../offers/offer_details/offer_details_screen.dart';
import '../offers/offers_list/service_provider_offers_list_screen.dart';
import 'data/notification_model.dart';
import 'notification_code_screen.dart';
import 'notification_offers_details_screen.dart';

class NotificationDetailsScreen extends StatefulWidget {
  NotificationModel notificationModel;
  NotificationDetailsScreen(this.notificationModel);

  @override
  _NotificationDetailsScreenState createState() => _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  final _controller = PageController();
  int _currentSliderPager=0;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        tag: "ServiceProviderDetailsScreen",
        showSettings: false,
        showBottomBar: true,
        showIntro: false,
        body:Column(children: [
          ActionBarWidget("", context,textColor:C.BASE_BLUE,showSearch:false,
              backgroundColor: Colors.white),
          _infoCard(),
          Expanded(child: offers())
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
                  margin: EdgeInsets.only(left: D.default_10,right: D.default_10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(D.default_10),
                      color: Colors.white,
                      boxShadow:[BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset:Offset(3,3),
                          blurRadius:3,
                          spreadRadius: 0.5
                      )]
                  ),
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
              Container(
                  margin: EdgeInsets.only(top: D.default_10),
                  child: Center(child: Text(
                    widget.notificationModel.shop!.name!
                    ,style: S.h4(color:C.BASE_BLUE,font: MyFonts.VazirBlack),),)),
              Container(
                color: Colors.white,
                width: double.infinity,
                height: D.default_20,
                margin: EdgeInsets.only(bottom: D.default_5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotsIndicator(
                      dotsCount: widget.notificationModel.shop!.photos!.isNotEmpty?widget.notificationModel.shop!.photos!.length+1:1,
                      position: widget.notificationModel.shop!.photos!.isNotEmpty?
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
                      child: Text(widget.notificationModel.shop!.address!,style: S.h4(color: Colors.grey),),)),
                    InkWell(onTap: (){
                      _launchMapsUrl(
                          widget.notificationModel.shop!.latitude!.isNotEmpty?double.parse(widget.notificationModel.shop!.latitude!):0.0,
                          widget.notificationModel.shop!.longitude!.isNotEmpty?double.parse(widget.notificationModel.shop!.longitude!):0.0);
                    },child:  Container(
                      padding: EdgeInsets.only(left: D.default_10,right: D.default_10,top: D.default_5,bottom: D.default_5),
                      decoration: BoxDecoration(
                          color: C.BASE_BLUE,
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
                    launch("tel://0${widget.notificationModel.shop!.phone!}");
                  },child: Row(children: [
                    Container(
                      child: Icon(Icons.local_phone,color: C.BASE_BLUE,size: D.default_20,),),
                    Container(
                      padding:EdgeInsets.only(left:D.default_10,right:D.default_10),
                      child: Text(widget.notificationModel.shop!.phone!,style: S.h4(color: C.BASE_BLUE),),),
                    (widget.notificationModel.shop!.website??"").isNotEmpty?InkWell(onTap: ()async{
                      await _launchURLBrowser(widget.notificationModel.shop!.website??"");
                    },
                      child: Container(
                        padding:EdgeInsets.only(left:D.default_10,right:D.default_10),
                        child: Text(widget.notificationModel.shop!.website!,style: S.h4(color: Colors.grey),),),):Container()

                  ],),),

                ],),)

          ],),
          Positioned(child: Container(
            padding: EdgeInsets.all(D.default_5),
            margin: EdgeInsets.only(left:D.default_10,right: D.default_10),
            width: D.default_60,
            height: D.default_60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(D.default_5),
                color: Colors.white,
                boxShadow:[BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset:Offset(4,4),
                    blurRadius:4,
                    spreadRadius: 2
                )]
            ),
            child:TransitionImage(
              (widget.notificationModel.shop!.photo??"").contains("https")?(widget.notificationModel.shop!.photo??""):"https://alefak.com/uploads/${(widget.notificationModel.shop!.photo??"")}",
              radius: D.default_10,
              fit: BoxFit.cover,
              width: double.infinity,
            ) ,
          ),),

        ],),
      ),

    ],);
  }
  _launchURLBrowser(String s) async {
    final String ure=widget.notificationModel.shop!.website??"";
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
        Container(
          child:
          Column(children: [
            Expanded(child: TransitionImage(
              (widget.notificationModel.shop!.bannerPhoto??"").contains("https")?(widget.notificationModel.shop!.bannerPhoto??""):"https://alefak.com/uploads/${(widget.notificationModel.shop!.bannerPhoto??"")}",
              fit: BoxFit.cover,
              width: double.infinity,
              radius: D.default_10,
            )),

          ],),)
    );
    for(int i=0;i<widget.notificationModel.shop!.photos!.length;i++){
      items.add(
          Container(child:
          Column(children: [
            Expanded(child: TransitionImage(
              widget.notificationModel.shop!.photos![i].photo!,
              fit: BoxFit.cover,
              width: double.infinity,
              radius: D.default_10,
            )),

          ],),)
      );
    }
    return items;
  }
  Widget _shopsOffersList() {
    return widget.notificationModel.shop!.offers!.isNotEmpty?Container(
      padding: EdgeInsets.all(D.default_10),
      child: CustomScrollView(slivers: [
        SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: D.default_5,
              mainAxisSpacing: D.default_5,
              childAspectRatio: 1,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(D.default_5),
                  child: InkWell(
                    onTap: (){
                      if((widget.notificationModel.shop!.offers![index].url??"")!=""){
                        _launchURLBrowser(widget.notificationModel.shop!.offers![index].url??"");
                      }
                    },
                    child: TransitionImage(
                      widget.notificationModel.shop!.offers![index].photo??"",
                      fit: BoxFit.cover,
                      radius: D.default_10,
                    ),),);
              },
              childCount: widget.notificationModel.shop!.offers!.length,
              semanticIndexOffset: 1,
            )),
      ]),):_noData();
  }

  double _getDescoundRaio(int index){
    double price=double.parse(widget.notificationModel.shop!.offers![index].price!);
    double discount=double.parse(widget.notificationModel.shop!.offers![index].discountValue!);
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
  Widget offers(){
    return Container(
      margin: EdgeInsets.only(top: D.default_10),
      child: Column(children: [
        Expanded(child:
        widget.notificationModel.shop!.offers!.isNotEmpty?
        widget.notificationModel.shop!.categoryId=="4"?_shopsOffersList():
        ListView.separated(
          itemCount: widget.notificationModel.shop!.offers!.length,
          padding: EdgeInsets.only(top:D.default_10,bottom:D.default_10),
          itemBuilder: (context,index){
            return  MaterialButton(onPressed: (){
              MyUtils.navigate(context, NotificationOfferDetailsScreen(widget.notificationModel.shop!,index));
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
                        Expanded(child: Container(child: Text(widget.notificationModel.shop!.offers![index].title!,style: S.h2(color: C.BASE_BLUE),),),),
                        double.parse(widget.notificationModel.shop!.offers![index]!.price!)>0?Container(
                          margin:EdgeInsets.only(left:D.default_10,right:D.default_10),
                          child: Text("${widget.notificationModel.shop!.offers![index]!.discountValue!}${tr("curncy")}",style: S.h2(color: C.BASE_BLUE),),):Container()
                      ],),
                    double.parse(widget.notificationModel.shop!.offers![index]!.price!)>0?Text("${tr("init_price")} ${widget.notificationModel.shop!.offers![index]!.price}${tr("curncy")}-${tr("wafer")}${_getDescoundRaio(index)}%",style: S.h4(color: Colors.grey)):Container(),

                  ],),
              ),);
          }, separatorBuilder: (BuildContext context, int index) {
          return Container(margin:EdgeInsets.only(left: D.default_20,right: D.default_20),color: Colors.grey,height: D.default_1,);
        },):_noData())
      ],),);
  }

}
