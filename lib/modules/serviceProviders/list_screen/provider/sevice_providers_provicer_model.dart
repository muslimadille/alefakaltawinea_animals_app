
import 'dart:async';

import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/getServiceProvidersApi.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ServiceProvidersProviderModel with ChangeNotifier {
  ///.....ui controllers.........
  bool isLoading=false;

  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
  Set<Marker> markers = {};
  CameraPosition? currentCameraPosition;
  Completer<GoogleMapController> mapController=Completer();

  /// ..........categories...........
  ServiceProviderModel? serviceProviderModel;
  GetServiceProvidersApi getServiceProvidersApi=GetServiceProvidersApi();
  getServiceProvidersList(int categoryId,int page) async {
    if(page==1) {
      serviceProviderModel = null;
    }
    setIsLoading(true);
    MyResponse<ServiceProviderModel> response =
    await getServiceProvidersApi.getServiceProviders(categoryId, page);
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null){
        setServiceProviderModel(response.data);
      setIsLoading(false);
    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      setIsLoading(false);
    }else{
      setIsLoading(false);
    }
    notifyListeners();

  }
  getClosestList(int categoryId,String lat,String long) async {
    setIsLoading(true);
    MyResponse<List<Data>> response =
    await getServiceProvidersApi.getClosest(categoryId,lat,long);

    if (response.status == Apis.CODE_SUCCESS &&response.data!=null){
        setMarkers(response.data);
      setIsLoading(false);
    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      setIsLoading(false);
    }else{
      setIsLoading(false);
    }
    notifyListeners();

  }

  void setServiceProviderModel(ServiceProviderModel value){
    if(serviceProviderModel==null){
      serviceProviderModel=value;
    }else{
      if(value.data!.isNotEmpty){
        for(int i=0;i<value.data!.length;i++){
          for(int n=0;n<serviceProviderModel!.data!.length;n++){
            if(serviceProviderModel!.data![n].id!=value.data![i].id){
              serviceProviderModel!.data!.add(value.data![i]);

            };
          }

        }
      }
    }
    notifyListeners();
  }
  void setMarkers(List<Data> value)async{
    setIsLoading(true);
    markers.clear();

      if(value.isNotEmpty){
        for(int i=0;i<value.length;i++){
          LatLng latlng=LatLng(double.parse(value[i].latitude!), double.parse(value[i].longitude!));
          markers.add(Marker(
            markerId: MarkerId("${value[i].id}"),
            position: latlng,
            infoWindow: InfoWindow(
              title: "${value[i].name}",
            ),
            icon: BitmapDescriptor.defaultMarker,
          ));
        }
        currentCameraPosition=CameraPosition(
            bearing: 0.0,
            tilt: 0.0,
            zoom: 9,
            target: LatLng(double.parse(value[0].latitude!), double.parse(value[0].longitude!)));
        final GoogleMapController controller=await mapController.future;

        await controller.animateCamera(CameraUpdate.newCameraPosition(currentCameraPosition!));

      }
setIsLoading(false);
    notifyListeners();
  }

}