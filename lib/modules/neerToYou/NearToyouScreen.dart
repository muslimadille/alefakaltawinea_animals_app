import 'dart:async';

import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/data/categories_model.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/provider/categories_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/provider/sevice_providers_provicer_model.dart';
import 'package:alefakaltawinea_animals_app/utils/location/location_utils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class NearToYouScreen extends StatefulWidget {
  const NearToYouScreen({Key? key}) : super(key: key);

  @override
  _NearToYouScreenState createState() => _NearToYouScreenState();
}

class _NearToYouScreenState extends State<NearToYouScreen> {

  static Position? _position;
  static final CameraPosition _myCameraPosition=CameraPosition(
    bearing: 0.0,
      tilt: 0.0,
      zoom: 9,
      target: LatLng(_position!.latitude,_position!.longitude));

  ServiceProvidersProviderModel? serviceProvidersProviderModel;
  CategoriesProviderModel?categoriesProviderModel;
  CategoriesDataModel? selectedCategory;


  @override
  void initState() {
    super.initState();
    serviceProvidersProviderModel=Provider.of<ServiceProvidersProviderModel>(context,listen: false);
    categoriesProviderModel=Provider.of<CategoriesProviderModel>(context,listen: false);
    selectedCategory=categoriesProviderModel!.categoriesList[0];
    getCurrentLocation();


  }
  @override
  Widget build(BuildContext context) {
    serviceProvidersProviderModel=Provider.of<ServiceProvidersProviderModel>(context,listen: true);
    categoriesProviderModel=Provider.of<CategoriesProviderModel>(context,listen: true);
    return BaseScreen(
        showSettings: false,
        showBottomBar: true,
        tag: "",
      body: Container(child: Center(child:
        _position!=null?Stack(
            alignment :AlignmentDirectional.bottomCenter,
          children: [
          serviceProvidersProviderModel!.isLoading? _buildMap():_buildMap(),
          _categories()
        ],):LoadingProgress(),),),);
  }
  Future<void> getCurrentLocation()async{
    await LocationUtils.getLocationPermission();
    _position=await Geolocator.getLastKnownPosition().whenComplete((){
      setState(() {
        _getMyCurrentLocation();

      });
    });
  }
  Widget _buildMap(){
    return GoogleMap(
      initialCameraPosition: serviceProvidersProviderModel!.currentCameraPosition!=null?serviceProvidersProviderModel!.currentCameraPosition!:_myCameraPosition,
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller){
        serviceProvidersProviderModel!.mapController.complete(controller);
      },
      markers: serviceProvidersProviderModel!.markers,
    );
  }
  Future <void>_getMyCurrentLocation()async{
    final GoogleMapController controller=await serviceProvidersProviderModel!.mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_myCameraPosition));
    serviceProvidersProviderModel!.getClosestList(1,_position!.latitude.toString(),_position!.longitude.toString());
  }
  Widget _categories(){
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(D.default_20),topRight: Radius.circular(D.default_20),bottomRight: Radius.circular(D.default_20),bottomLeft: Radius.circular(D.default_20)),
            color: Colors.black.withOpacity(0.6),
            boxShadow:[BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset:Offset(1,1),
                blurRadius:2,
                spreadRadius: 1
            )]
        ),
      padding: EdgeInsets.only(top: D.default_5,bottom: D.default_5),
        margin: EdgeInsets.all(D.default_5),

        height: D.default_260,
        child:CustomScrollView(slivers: [
      SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: D.default_5,
            mainAxisSpacing: D.default_5,
            childAspectRatio: 2.8,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return _categoriesIem(index);
            },
            childCount:categoriesProviderModel!.categoriesList.length,
            semanticIndexOffset: 1,
          )),

    ]));
  }
  Widget _categoriesIem(int index){
    return InkWell(onTap: (){
      setState(() {
        selectedCategory=categoriesProviderModel!.categoriesList[index];
        serviceProvidersProviderModel!.getClosestList(categoriesProviderModel!.categoriesList[index].id!,_position!.latitude.toString(),_position!.longitude.toString());

      });
    },
      child:Stack(
          alignment:AlignmentDirectional.centerStart,
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(D.default_10),
            child:  Container(
        height: D.default_100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_100),
            color: selectedCategory!.id==categoriesProviderModel!.categoriesList[index].id?C.BASE_BLUE:Colors.white,
            boxShadow:[BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset:Offset(2,2),
                blurRadius:4,
                spreadRadius: 1
            )]
        ),child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: D.default_35,),
            Text(categoriesProviderModel!.categoriesList[index].name!,style:S.h4(color:
            selectedCategory!.id==categoriesProviderModel!.categoriesList[index].id?Colors.white:C.BASE_BLUE)),
          ],
        )
        ) ,),
          Positioned(child: Container(
            width:D.default_70,
            height:D.default_70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(D.default_200),
                color: selectedCategory!.id==categoriesProviderModel!.categoriesList[index].id?C.BASE_BLUE:Colors.white,
                boxShadow:[BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset:Offset(2,2),
                    blurRadius:4,
                    spreadRadius: 1
                )]
            ),
            child: TransitionImage(
            categoriesProviderModel!.categoriesList[index].photo!.isNotEmpty?categoriesProviderModel!.categoriesList[index].photo!:Res.SHOP_IC,
            fit: BoxFit.cover,
            backgroundColor: Colors.white,
            padding: EdgeInsets.all(D.default_10),
            width:D.default_70,
            height:D.default_70,
            radius: D.default_200,
            strokeColor: selectedCategory!.id==categoriesProviderModel!.categoriesList[index].id?C.BASE_BLUE:Colors.white,

          ),),right: D.default_10,),
        ]));
  }


}
