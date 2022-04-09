import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/profile/no_profile_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/action_bar_widget.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'offer_code_screen.dart';

class OfferDetailsScreen extends StatefulWidget {
  Data serviceProviderData;
  int index;
  OfferDetailsScreen(this.serviceProviderData,this.index);

  @override
  _OfferDetailsScreenState createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        showSettings: false,
        showBottomBar: true,
        tag: "OfferDetailsScreen",
        body: SingleChildScrollView(child: Container(
          child: Column(children: [
            ActionBarWidget("", context,enableShadow: false,backgroundColor: Colors.white,textColor: C.BASE_BLUE,),
            _providerInfo(),
            _cobonInfo(),
            _cobonBtn(),
            _offerText(),
            Column(children: _benifitsList(),),
            SizedBox(height: D.default_20,)
          ],),
        ),));
  }
  Widget _offerText(){
    return Container(
      margin: EdgeInsets.only(bottom:D.default_20,left:D.default_20,right:D.default_20),
        child: Text("${tr("descount")} ${_getDescoundRaio(widget.index)}%${tr("for")} ${widget.serviceProviderData.offers![widget.index].title}",style: S.h1(color: C.BASE_BLUE)),
    );
  }
  Widget _cobonBtn(){
    return Container(child: Center(child: MaterialButton(onPressed: (){
      if(Constants.currentUser!=null){
        MyUtils.navigate(context, OfferCodeScreen(widget.serviceProviderData,widget.serviceProviderData.offers![widget.index]));
      }else{
        MyUtils.navigate(context, NoProfileScreen());
      }
    },
    child: Container(
      width: D.default_160,
      margin: EdgeInsets.all(D.default_20),
      padding: EdgeInsets.all(D.default_5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_10),
          color: C.BASE_BLUE,
          boxShadow:[BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset:Offset(1,1),
              blurRadius:1,
              spreadRadius: 1
          )]
      ),
      child: Center(child: Text(tr("use_offer"),style: S.h2(color: Colors.white),),),),),),);
  }
  Widget _cobonInfo(){
    return Container(
      margin: EdgeInsets.only(left: D.default_20,right: D.default_20),
      child: Column(
        children: [
          _cobonInfoItem(tr("save_amount"),"${double.parse(widget.serviceProviderData.offers![widget.index].price!)-double.parse(widget.serviceProviderData.offers![widget.index].discountValue!)} ${tr("curncy")}"),
          _devider(),
          _cobonInfoItem(tr("valed_to"),"${widget.serviceProviderData.offers![widget.index].expirationDate!}"),
          _devider(),
          _cobonInfoItem(tr("num_of_use"),"${widget.serviceProviderData.offers![widget.index].usageTimes!}"),
          _devider(),
          _cobonInfoItem(tr("cupon_holder_hint"),""),
          _devider()

    ],),) ;
  }
  Widget _devider(){
    return Container(width: double.infinity,height: D.default_1,color: Colors.grey,);
  }
  Widget _cobonInfoItem(String title,String content){
    return Container(
      padding: EdgeInsets.only(left: D.default_10,right: D.default_10,top:D.default_10),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("${title} ",style: S.h2(color: Colors.black45),),
        Text("${content} ",style: S.h2(color: Colors.black45),),
      ],),);
  }
  Widget _providerInfo(){
    return Column(children: [
      Container(
        height: D.default_200,
        width: double.infinity,
        margin: EdgeInsets.only(left: D.default_20,right: D.default_20),
        child: Stack(children: [
          Column(children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(D.default_20),
                color: Colors.white,
              ),
              child: TransitionImage(
                widget.serviceProviderData.bannerPhoto!,
                fit: BoxFit.cover,
                radius: D.default_20,
                width: double.infinity,
              ),
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
        padding: EdgeInsets.only(top:D.default_10),

        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text(
                widget.serviceProviderData.name!
                ,style: S.h1(color:C.BASE_BLUE),),),


            ],),
          SizedBox(height: D.default_10,),
        ],),
      )
    ],);
  }

  double _getDescoundRaio(int index){
    double price=double.parse(widget.serviceProviderData.offers![index].price!);
    double discount=double.parse(widget.serviceProviderData.offers![index].discountValue!);
    double raio=((price-discount)/price)*100;
    return raio.toInt().toDouble();

  }
 List<Widget>  _benifitsList(){
   List<Widget> beni=[];
   beni.add(
     Container(
       margin: EdgeInsets.only(left:D.default_20,right:D.default_20,top: D.default_5),
       child: Row(
       children: [
         Expanded(child: Text(tr("offer_terms"),style: S.h1(color: Colors.grey),textAlign:TextAlign.start ,))
       ],),)
   );
   for(int i=0;i<widget.serviceProviderData.offers![widget.index].features!.length;i++){
     beni.add(
         Container(
           margin: EdgeInsets.only(left:D.default_20,right:D.default_20,top: D.default_5),
           child: Row(
             children: [
               Expanded(child: Text("-${widget.serviceProviderData.offers![widget.index].features![i].ar}",style: S.h3(color:Colors.grey),textAlign:TextAlign.start ,))
             ],),)
     );
   }
   return beni ;
  }
}
