
import 'dart:convert';
import 'package:alefakaltawinea_animals_app/data/dio/dio_utils.dart';
import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/login/data/user_data.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';

class RegisterationApi{

  Future<MyResponse<UserData>> register(String name,String email,String phone,String password,String confirmPass,{int regionId=1,int stateId=1}) async {
    final url = "${Apis.REGISTER}";
    Map<String,dynamic>body={
      "username":name,
      "username":email,
      "phone":phone,
      "region_id":regionId,
      "state_id":stateId,
      "password":password,
      "password_confirmation":confirmPass
    };
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<UserData>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<UserData>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }
}