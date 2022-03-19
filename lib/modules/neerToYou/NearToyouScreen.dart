import 'dart:async';

import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/data/categories_model.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/provider/categories_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/provider/sevice_providers_provicer_model.dart';
import 'package:alefakaltawinea_animals_app/utils/location/location_utils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../serviceProviders/details_screen/service_provider_details_screen.dart';

class NearToYouScreen extends StatefulWidget {
  const NearToYouScreen({Key? key}) : super(key: key);

  @override
  _NearToYouScreenState createState() => _NearToYouScreenState();
}

class _NearToYouScreenState extends State<NearToYouScreen> {
  static Position? _position;
  static final CameraPosition _myCameraPosition = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      zoom: 9,
      target: LatLng(_position!.latitude, _position!.longitude));

  ServiceProvidersProviderModel? serviceProvidersProviderModel;
  CategoriesProviderModel? categoriesProviderModel;
  CategoriesDataModel? selectedCategory;

  @override
  void initState() {
    super.initState();
    serviceProvidersProviderModel =
        Provider.of<ServiceProvidersProviderModel>(context, listen: false);
    categoriesProviderModel =
        Provider.of<CategoriesProviderModel>(context, listen: false);
    selectedCategory = categoriesProviderModel!.categoriesList[0];
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    serviceProvidersProviderModel =
        Provider.of<ServiceProvidersProviderModel>(context, listen: true);
    categoriesProviderModel =
        Provider.of<CategoriesProviderModel>(context, listen: true);
    return BaseScreen(
        showSettings: false,
        showBottomBar: true,
        tag: "",
        body: Stack(
          children: [
            Container(
              child: Center(
                child: _position != null
                    ? Column(
                        children: [
                          Expanded(
                              child: serviceProvidersProviderModel!.isLoading
                                  ? _buildMap()
                                  : _buildMap()),
                          _categories()
                        ],
                      )
                    : LoadingProgress(),
              ),
            ),
            serviceProvidersProviderModel!.currentSelectedShop != null
                ? _shopItem()
                : Container(),
          ],
        ));
  }

  Future<void> getCurrentLocation() async {
    await LocationUtils.getLocationPermission();
    _position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {
        _getMyCurrentLocation();
      });
    });
  }

  Widget _buildMap() {
    return GoogleMap(
      initialCameraPosition:
          serviceProvidersProviderModel!.currentCameraPosition != null
              ? serviceProvidersProviderModel!.currentCameraPosition!
              : _myCameraPosition,
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        serviceProvidersProviderModel!.mapController.complete(controller);
      },
      markers: serviceProvidersProviderModel!.markers,
    );
  }

  Future<void> _getMyCurrentLocation() async {
    final GoogleMapController controller =
        await serviceProvidersProviderModel!.mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_myCameraPosition));
    serviceProvidersProviderModel!.getClosestList(context, 1,
        _position!.latitude.toString(), _position!.longitude.toString());
  }

  Widget _categories() {
    return Container(
        height: D.default_260,
        child: CustomScrollView(slivers: [
          SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 1.73,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _categoriesIem(index);
                },
                childCount: categoriesProviderModel!.categoriesList.length,
                semanticIndexOffset: 1,
              )),
        ]));
  }

  Widget _categoriesIem(int index) {
    return InkWell(
        onTap: () {
          setState(() {
            selectedCategory = categoriesProviderModel!.categoriesList[index];
            serviceProvidersProviderModel!.getClosestList(
                context,
                categoriesProviderModel!.categoriesList[index].id!,
                _position!.latitude.toString(),
                _position!.longitude.toString());
          });
        },
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              color: categoriesProviderModel!.categoriesList[index].color !=
                      null
                  ? Color(int.parse(
                      "${categoriesProviderModel!.categoriesList[index].color!.replaceAll("#", "0xff")}"))
                  : Color(0xffF38183),
            ),
            Positioned(
                child: TransitionImage(
              categoriesProviderModel!.categoriesList[index].photo!.isNotEmpty
                  ? categoriesProviderModel!.categoriesList[index].photo!
                  : Res.SHOP_IC,
              fit: BoxFit.fitHeight,
              padding: EdgeInsets.only(top: D.default_30, bottom: D.default_30),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
            )),
            Container(
              height: D.default_40,
              child: Center(
                child: Text(
                    categoriesProviderModel!.categoriesList[index].name!,
                    style: S.h3(color: Colors.white)),
              ),
            )
          ],
        ));
  }

  Widget _shopItem() {
    return InkWell(
      onTap: (){
        MyUtils.navigate(context, ServiceProviderDetailsScreen(serviceProvidersProviderModel!.currentSelectedShop!));
      },
      child: Container(
          margin: EdgeInsets.all(D.default_10),
          padding: EdgeInsets.all(D.default_10),
          height: D.default_100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(D.default_10)),
              border: Border.all(color: Color(int.parse(selectedCategory!.color!.replaceAll("#", "0xff")))),
              color: Colors.white,
              boxShadow:[BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset:Offset(4,4),
                  blurRadius:4,
                  spreadRadius: 2
              )]
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(D.default_10)),
                  color: Colors.white,
                  border: Border.all(color: Color(int.parse(selectedCategory!.color!.replaceAll("#", "0xff"))))
                ),
                margin: EdgeInsets.all(D.default_10),
                child: TransitionImage(
                  "${serviceProvidersProviderModel!.currentSelectedShop!.photo}",
                  fit: BoxFit.cover,
                  radius: D.default_10,
                ),
              ),
              Expanded(
                  child: Text(
                "${serviceProvidersProviderModel!.currentSelectedShop!.name}",
                style: S.h4(color: Color(int.parse(selectedCategory!.color!.replaceAll("#", "0xff"))))),
              )
            ],
          )),
    );
  }
}
