import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/data/categories_model.dart';
import 'package:alefakaltawinea_animals_app/modules/homeTabsScreen/provider/bottom_bar_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/items/service_provider_list_item.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/provider/sevice_providers_provicer_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceProviderListScreen extends StatefulWidget {
  CategoriesDataModel? selectedCategory;
  String title;
   ServiceProviderListScreen(this.selectedCategory,this.title);

  @override
  _ServiceProviderListScreenState createState() => _ServiceProviderListScreenState();
}

class _ServiceProviderListScreenState extends State<ServiceProviderListScreen> {
  BottomBarProviderModel?bottomBarProviderModel;
  ServiceProvidersProviderModel? serviceProvidersProviderModel;
  int _currentLoadedPage=1;

  @override
  void initState() {
    super.initState();
    ///bottom bar selection
    bottomBarProviderModel=Provider.of<BottomBarProviderModel>(context,listen: false);
    bottomBarProviderModel!.setSelectedScreen(0);

    ///service providers data
    serviceProvidersProviderModel=Provider.of<ServiceProvidersProviderModel>(context,listen: false);
    serviceProvidersProviderModel!.getServiceProvidersList(widget.selectedCategory!.id!, _currentLoadedPage);
  }
  @override
  Widget build(BuildContext context) {
    serviceProvidersProviderModel=Provider.of<ServiceProvidersProviderModel>(context,listen: true);
    return BaseScreen(
      tag: "ServiceProviderListScreen",
      showBottomBar: true,
      showSettings: false,
        body: Column(children: [
          _actionBar(),
      Expanded(child:serviceProvidersProviderModel!.isLoading?LoadingProgress(): serviceProvidersProviderModel!.serviceProviderModel!.data!.isNotEmpty?ListView.builder(
          itemCount: serviceProvidersProviderModel!.serviceProviderModel!.data!.length,
          padding: EdgeInsets.all(D.default_10),
          itemBuilder: (context,index){
            return  ServiceProviderListItem(index,serviceProvidersProviderModel);
          }):Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            TransitionImage(Res.OFFER_ICON,
            width: D.default_80,
              height: D.default_80,
            ),
        SizedBox(height: D.default_20,),
        Text("لا توجد عروض متاحة حاليا في هذا القسم",style: S.h3(color: C.BASE_BLUE),)
      ],),),)
    ],));
  }
  Widget _actionBar(){
    return Container(
      height: D.default_70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
          boxShadow:[BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset:Offset(2,2),
              blurRadius:2,
              spreadRadius: 2
          )]
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(child: Center(child: Text("${widget.title}",style: S.h1(color: C.BASE_BLUE),),))

          ],),
      ),
    );
  }

}
