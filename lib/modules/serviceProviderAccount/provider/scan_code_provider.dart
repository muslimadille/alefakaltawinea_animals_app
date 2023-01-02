import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../data/dio/my_rasponce.dart';
import '../../../utils/my_utils/apis.dart';
import '../../../utils/my_widgets/web_view.dart';
import '../../offers/offer_details/offer_code_model.dart';
import '../data/scan_code_api.dart';
import '../data/scan_code_model.dart';


class ScanCodeProvider with ChangeNotifier{
  ///.....ui controllers.........
  bool isLoading=false;
  bool isFirst=true;

  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
  ScanCodeModel? scanCodeModel;
  ScanCodeApi scanCodeApi=ScanCodeApi();
  Future<bool> scanCode(BuildContext ctx,String code,int confirm) async {
    bool value=false;
    scanCodeModel=null;
     isFirst=true;
    setIsLoading(true);
    MyResponse<ScanCodeModel> response =
    await scanCodeApi.scanCode(code,confirm: confirm);
    if (response.status == Apis.CODE_SUCCESS){
      if(confirm==0){scanCodeModel=response.data as ScanCodeModel;
      setIsLoading(false);
      }
      else{
        setIsLoading(false);

        await Fluttertoast.showToast(msg: "${response.msg}");
        value=true;
      }

    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      isFirst=false;
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }else{
      isFirst=false;
      setIsLoading(false);
      await Fluttertoast.showToast(msg: "${response.msg}");
    }
    notifyListeners();
    return value;
  }



}