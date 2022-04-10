
import 'dart:convert';
import 'package:alefakaltawinea_animals_app/data/dio/dio_utils.dart';
import 'package:alefakaltawinea_animals_app/data/dio/my_rasponce.dart';
import 'package:alefakaltawinea_animals_app/modules/login/data/user_data.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviderAccount/data/scan_code_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';

class ScanCodeApi{

  Future<MyResponse<ScanCodeModel>> scanCode(String code,{int confirm=0}) async {
    final url = "${Apis.SCAN_CODE}";
    Map<String,dynamic>body={
      "code":code,
      "confirm":confirm
    };
    final response = await BaseDioUtils.request(BaseDioUtils.REQUEST_POST, url,body: body);
    if (response != null && response.statusCode == 200) {
      return MyResponse<ScanCodeModel>.fromJson(
          json.decode(jsonEncode(response.data)));
    } else {
      return MyResponse<ScanCodeModel>.init(response!.statusCode.toString(),response.statusMessage!, null);
    }
  }

}