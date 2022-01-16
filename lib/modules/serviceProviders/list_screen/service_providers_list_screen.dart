import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/data/categories_model.dart';
import 'package:alefakaltawinea_animals_app/modules/homeTabsScreen/provider/bottom_bar_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/items/service_provider_list_item.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/provider/sevice_providers_provicer_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceProviderListScreen extends StatefulWidget {
  CategoriesDataModel? selectedCategory;
   ServiceProviderListScreen(this.selectedCategory);

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
      showSettings: true,
        body: Column(children: [
      Expanded(child:serviceProvidersProviderModel!.isLoading?LoadingProgress(): ListView.builder(
          itemCount: serviceProvidersProviderModel!.serviceProviderModel!.data!.length,
          padding: EdgeInsets.all(D.default_10),
          itemBuilder: (context,index){
            return  ServiceProviderListItem(index,serviceProvidersProviderModel);
          }),)
    ],));
  }
}
