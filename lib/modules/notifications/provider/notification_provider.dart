
import 'dart:async';

import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/fav/data/fav_api.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/details_screen/service_provider_details_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/getServiceProvidersApi.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/notification_model.dart';
import '../data/notifications_api.dart';


class NotificationProvider with ChangeNotifier {
  ///.....ui controllers.........
  bool isLoading=false;


  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
  List<NotificationModel> notificationsList=[];
  /// ..........categories...........
  NotificationApi notificationApi=NotificationApi();
  getNotificationsList() async {
    notificationsList.clear();
    setIsLoading(true);
    MyResponse<List<NotificationModel>> response =
    await notificationApi.getNotification();
    if (response.status == Apis.CODE_SUCCESS &&response.data!=null){
      notificationsList.addAll(response.data);
      setIsLoading(false);
    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      setIsLoading(false);
    }else{
      setIsLoading(false);
    }
    notifyListeners();

  }







}