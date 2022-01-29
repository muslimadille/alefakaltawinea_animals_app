
import 'dart:convert';
import 'package:alefakaltawinea_animals_app/data/dio/dio_utils.dart';
import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/login/data/user_data.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';

class OtpApi{

  Future<MyResponse<UserData>> activeAccount(String phone,String code) async {
    final url = "${Apis.ACTIVE_ACCOUNT}";
    Map<String,dynamic>body={
      "phone":phone,
      "activation_code":code
    };
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<UserData>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<UserData>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
  Future<MyResponse<dynamic>> getCodeToSetPassword(String phone) async {
    final url = "${Apis.GET_AUTH_CODE_TO_SET_PASSWORD}";
    Map<String,dynamic>body={
      "phone":phone,
    };
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<dynamic>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<dynamic>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
}