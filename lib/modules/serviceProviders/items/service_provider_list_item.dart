import 'package:alefakaltawinea_animals_app/modules/serviceProviders/provider/sevice_providers_provicer_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:flutter/material.dart';

class ServiceProviderListItem extends StatefulWidget {
  int index;
  ServiceProvidersProviderModel? serviceProvidersProviderModel;

   ServiceProviderListItem(this.index,this.serviceProvidersProviderModel);

  @override
  _ServiceProviderListItemState createState() => _ServiceProviderListItemState();
}

class _ServiceProviderListItemState extends State<ServiceProviderListItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(D.default_10),
      height: D.default_200,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
          boxShadow:[BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset:Offset(2,2),
              blurRadius:2,
              spreadRadius: 2
          )]
      ),
      child: Column(children: [
        Expanded(child: TransitionImage(
          widget.serviceProvidersProviderModel!.serviceProviderModel!.data![widget.index].bannerPhoto!,
          fit: BoxFit.cover,
          width: double.infinity,
        )),
        Container(
          padding: EdgeInsets.all(D.default_10),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Expanded(
                child: Text(
                  widget.serviceProvidersProviderModel!.serviceProviderModel!.data![widget.index].name!
                  ,style: S.h3(color:C.BASE_BLUE),))
          ],),
        )
      ],),
    );
  }
}
