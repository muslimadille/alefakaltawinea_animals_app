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

import '../offers/offer_details/offer_code_screen.dart';
import 'data/notification_model.dart';
import 'notification_code_screen.dart';

class NotificationDetailsScreen extends StatefulWidget {
  NotificationModel notificationModel;
  NotificationDetailsScreen(this.notificationModel);

  @override
  _NotificationDetailsScreenState createState() => _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        showSettings: false,
        showBottomBar: true,
        tag: "NotificationDetailsScreen",
        body: Column(
          children: [
            ActionBarWidget("", context,enableShadow: false,backgroundColor: Colors.white,textColor: C.BASE_BLUE,),
            Expanded(child:SingleChildScrollView(child: Container(
              child: Column(children: [
                _providerInfo(),
                _cobonInfo(),
                _cobonBtn(),
                _offerText(),
                Column(children: _benifitsList(),),
                SizedBox(height: D.default_20,)
              ],),
            ),),
            )
          ],
        ));
  }
  Widget _offerText(){
    return Container(
      margin: EdgeInsets.only(bottom:D.default_20,left:D.default_20,right:D.default_20),
      child: double.parse(widget.notificationModel.price!)>0?
      Text("${tr("descount")} ${_getDescoundRaio()}%${tr("for")} ${widget.notificationModel.title}",style: S.h1(color: C.BASE_BLUE)):
      Text("${widget.notificationModel.title}",style: S.h1(color: C.BASE_BLUE)),

    );
  }
  Widget _cobonBtn(){
    return Container(child: Center(child: MaterialButton(onPressed: (){
      if(Constants.currentUser!=null){
        MyUtils.navigate(context, NotificationCodeScreen(widget.notificationModel));
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
          double.parse(widget.notificationModel.price!)>0?
          _cobonInfoItem(tr("save_amount"),"${double.parse(widget.notificationModel.price!)-double.parse(widget.notificationModel.discountValue!)} ${tr("curncy")}")
              :Container(),
          double.parse(widget.notificationModel.price!)>0?_devider():Container(),
          _cobonInfoItem(tr("valed_to"),"${widget.notificationModel.expirationDate!}"),
          _devider(),
          double.parse(widget.notificationModel.usageTimes!)>0?
          _cobonInfoItem(tr("num_of_use"),"${widget.notificationModel.usageTimes!}"):Container(),
          double.parse(widget.notificationModel.usageTimes!)>0?
          _devider():Container(),
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
                widget.notificationModel.shop!.bannerPhoto!,
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
              widget.notificationModel.shop!.photo!,
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
                widget.notificationModel.shop!.name??""
                ,style: S.h1(color:C.BASE_BLUE),),),


            ],),
          SizedBox(height: D.default_10,),
        ],),
      )
    ],);
  }

  double _getDescoundRaio(){
    double price=double.parse(widget.notificationModel.price!);
    double discount=double.parse(widget.notificationModel.discountValue!);
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
    for(int i=0;i<widget.notificationModel.features!.length;i++){
      beni.add(
          Container(
            margin: EdgeInsets.only(left:D.default_20,right:D.default_20,top: D.default_5),
            child: Row(
              children: [
                Expanded(child: Text("-${widget.notificationModel.features![i].ar}",style: S.h3(color:Colors.grey),textAlign:TextAlign.start ,))
              ],),)
      );
    }
    return beni ;
  }
}
