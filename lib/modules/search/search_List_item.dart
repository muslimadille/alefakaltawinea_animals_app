import 'package:alefakaltawinea_animals_app/modules/serviceProviders/details_screen/service_provider_details_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/provider/sevice_providers_provicer_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchListItem extends StatefulWidget {
  int index;

  SearchListItem(this.index);

  @override
  _SearchListItemState createState() => _SearchListItemState();
}

class _SearchListItemState extends State<SearchListItem> {
  ServiceProvidersProviderModel? serviceProvidersProviderModel;
@override
  void initState() {
  serviceProvidersProviderModel=Provider.of<ServiceProvidersProviderModel>(context,listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    serviceProvidersProviderModel=Provider.of<ServiceProvidersProviderModel>(context,listen: true);

    return InkWell(
      onTap: (){
        MyUtils.navigate(context, ServiceProviderDetailsScreen(serviceProvidersProviderModel!.searchServiceProviderModel!.data![widget.index]));
      },
      child: Container(
        margin: EdgeInsets.all(D.default_10),
        height: D.default_230,
        width: double.infinity,
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
        child: Stack(children: [
          Column(children: [
            Expanded(child:
            Container(
              padding: EdgeInsets.all(D.default_10),
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(serviceProvidersProviderModel!.searchServiceProviderModel!.data![widget.index].bannerPhoto!,
                ),fit:BoxFit.cover),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(D.default_10),topRight: Radius.circular(D.default_10)),
                color: Colors.white,
              ),)),
            Container(
              height: D.default_50,
              width: double.infinity,
              padding: EdgeInsets.all(D.default_10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(D.default_10),bottomRight: Radius.circular(D.default_10)),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Text(
                    serviceProvidersProviderModel!.searchServiceProviderModel!.data![widget.index].name!
                    ,style: S.h3(color:C.BASE_BLUE),),),
                  InkWell(
                    onTap: () async {
                     await serviceProvidersProviderModel!.setFav(serviceProvidersProviderModel!.searchServiceProviderModel!.data![widget.index].id!);
                      setState(() {
                        serviceProvidersProviderModel!.searchServiceProviderModel!.data![widget.index].is_fav==0?
                        fav_icon=Res.IC_FAV_GREY:fav_icon=Res.IC_FAV_BLUE;
                      });
                    },
                    child: TransitionImage(
                      serviceProvidersProviderModel!.searchServiceProviderModel!.data![widget.index].is_fav==0?
                      Res.IC_FAV_GREY:Res.IC_FAV_BLUE,
                      height: D.default_25,
                      width: D.default_25,
                    ),)

                ],),
            )
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
              serviceProvidersProviderModel!.searchServiceProviderModel!.data![widget.index].photo!,
              radius: D.default_10,
              fit: BoxFit.cover,
              width: double.infinity,
            ) ,
          ),),
        ],),
      ),);
  }
  String fav_icon= Res.IC_FAV_GREY;

}
