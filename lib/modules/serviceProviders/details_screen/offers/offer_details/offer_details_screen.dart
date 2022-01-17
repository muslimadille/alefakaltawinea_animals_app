import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        showSettings: true,
        showBottomBar: true,
        tag: "OfferDetailsScreen",
        body: SingleChildScrollView(child: Container(
          child: Column(children: [
            _providerInfo(),
            _cobonInfo(),
            _cobonBtn(),
            _offerText()
          ],),
        ),));
  }
  Widget _offerText(){
    return Container(
      margin: EdgeInsets.all(D.default_5),
        child: Wrap(
      alignment:WrapAlignment.center,
      children: [
        Text("خصم ",style: S.h2(color: C.BASE_BLUE),),
        Text("${_getDescoundRaio(widget.index)}%",style: S.h2(color: C.BASE_BLUE)),
        Text(" على ",style: S.h2(color: C.BASE_BLUE)),
        Text("${widget.serviceProviderData.offers![widget.index].title}",style: S.h2(color: C.BASE_BLUE)),
        Text(" بـ ",style: S.h2(color: C.BASE_BLUE)),
        Text("${widget.serviceProviderData.offers![widget.index]!.discountValue!}",style: S.h2(color: C.BASE_BLUE)),
        Text(" ريال ",style: S.h2(color: C.BASE_BLUE)),
        Text("بدلا من ",style: S.h2(color: C.BASE_BLUE)),
        Text("${widget.serviceProviderData.offers![widget.index]!.price!}",style: S.h2(color: C.BASE_BLUE)),
        Text(" ريال ",style: S.h2(color: C.BASE_BLUE)),
      ],));
  }
  Widget _cobonBtn(){
    return Container(child: Center(child: MaterialButton(onPressed: (){
      Fluttertoast.showToast(
          msg: "قريبا",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    },
    child: Container(
      width: D.default_200,
      margin: EdgeInsets.all(D.default_20),
      padding: EdgeInsets.all(D.default_15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_50),
          color: C.BASE_BLUE,
          boxShadow:[BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset:Offset(2,2),
              blurRadius:2,
              spreadRadius: 2
          )]
      ),
      child: Center(child: Text("استخدم الكوبون",style: S.h3(color: Colors.white),),),),),),);
  }
  Widget _cobonInfo(){
    return Container(
      child: Column(
        children: [
          _cobonInfoItem("قيمة التوفير:","${widget.serviceProviderData.offers![widget.index]!.discountValue!} ${"ريال"}"),
          _devider(),
          _cobonInfoItem("صالح لغاية:","${widget.serviceProviderData.offers![widget.index]!.expirationDate!}"),
          _devider(),
          _cobonInfoItem("هذا الكوبون متاح فقط لمستخدمي البطاقة",""),
          _devider()

    ],),) ;
  }
  Widget _devider(){
    return Container(width: double.infinity,height: D.default_1,color: Colors.grey,);
  }
  Widget _cobonInfoItem(String title,String content){
    return Container(
      padding: EdgeInsets.only(left: D.default_10,right: D.default_10,top:D.default_20,bottom: D.default_20),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("${title} ",style: S.h2(color: Colors.black45),),
        Text("${content} ",style: S.h3(color: Colors.black),),
      ],),);
  }
  Widget _providerInfo(){
    return Column(children: [
      Container(
        height: D.default_150,
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
        padding: EdgeInsets.all(D.default_10),
        decoration: BoxDecoration(
            color: C.BASE_BLUE,
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
              Center(child: Text(
                widget.serviceProviderData.name!
                ,style: S.h1(color:Colors.white),),),


            ],),
          SizedBox(height: D.default_10,),
        ],),
      )
    ],);
  }

  double _getDescoundRaio(int index){
    double price=double.parse(widget.serviceProviderData.offers![index]!.price!);
    double discount=double.parse(widget.serviceProviderData.offers![index]!.discountValue!);
    double raio=(discount/price)*100;
    return raio;

  }
}
