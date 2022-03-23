import 'dart:convert';

import '../../../data/dio/dio_utils.dart';
import '../../../data/dio/my_rasponce.dart';
import '../../../utils/my_utils/apis.dart';
import '../../serviceProviders/list_screen/data/serviceProvidersModel.dart';
import 'notification_model.dart';

class NotificationApi{

  Future<MyResponse<List<Data>>> getNotification() async {
    final url = "${Apis.GET_NOTIFICATIONS}";
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_GET, url);
    if (response != null && response.statusCode == 200) {
      return MyResponse<List<Data>>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<List<Data>>.init(Apis.CODE_ERROR, "", null);
    }
  }


}