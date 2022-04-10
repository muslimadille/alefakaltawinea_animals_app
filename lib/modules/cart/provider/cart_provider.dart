import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/dio/my_rasponce.dart';
import '../../../utils/my_utils/apis.dart';
import '../../../utils/my_widgets/web_view.dart';
import '../../offers/offer_details/offer_code_model.dart';
import '../add_cart_model.dart';
import '../add_cart_respose_model.dart';
import '../cart_api.dart';
import '../my_carts_model.dart';


class CartProvider with ChangeNotifier{
  ///.....ui controllers.........
  bool isLoading=false;
  int selectedCategoryIndex=0;
  String offerCode="";
  void setIsLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
  List<MyCart>myCarts=[];
  CartApi cartApi=CartApi();
  addCart(BuildContext ctx,Carts body) async {
    setIsLoading(true);
    MyResponse<AddCartResponseModel> response =
    await cartApi.addCart(body);
    if (response.status == Apis.CODE_SUCCESS){
      setIsLoading(false);
      MyUtils.navigate(ctx, WebPage(response.data.url));
    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      setIsLoading(false);
    }else{
      setIsLoading(false);
    }
    notifyListeners();
  }
  getMyCart({int shop_id=0,int offer_id=0}) async {
    myCarts.clear();
    setIsLoading(true);
    MyResponse<MyCartsModel> response =
    await cartApi.getMyCarts();
    if (response.status == Apis.CODE_SUCCESS){
      setIsLoading(false);
      MyCartsModel data=response.data;
      myCarts.addAll(data.data!);
      if(shop_id>0){
        useCode(shop_id,offer_id,myCarts[0].id!);
      }
    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      setIsLoading(false);
    }else{
      setIsLoading(false);
    }
    notifyListeners();
  }
  useCode(int shop_id,int offer_id,int card_id) async {
    setIsLoading(true);
    MyResponse<OfferCodeModel> response =
    await cartApi.useCode(shop_id,offer_id,card_id);
    if (response.status == Apis.CODE_SUCCESS){
      setIsLoading(false);
      OfferCodeModel offerCodeModel=response.data;
      offerCode=offerCodeModel.code!;
    }else if(response.status == Apis.CODE_SUCCESS &&response.data==null){
      setIsLoading(false);
    }else{
      setIsLoading(false);
    }
    notifyListeners();
  }


}