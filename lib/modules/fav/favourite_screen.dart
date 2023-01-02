import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/data/categories_model.dart';
import 'package:alefakaltawinea_animals_app/modules/homeTabsScreen/provider/bottom_bar_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/items/service_provider_list_item.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/provider/sevice_providers_provicer_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/action_bar_widget.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'fav_list_item.dart';


class FavScreen extends StatefulWidget {
  FavScreen();
  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen>  {
  BottomBarProviderModel?bottomBarProviderModel;
  ServiceProvidersProviderModel? serviceProvidersProviderModel;
  int _currentLoadedPage=1;
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  GlobalKey _contentKey = GlobalKey();
  GlobalKey _refresherKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    ///bottom bar selection
    bottomBarProviderModel=Provider.of<BottomBarProviderModel>(context,listen: false);
    bottomBarProviderModel!.setSelectedScreen(1);

    ///service providers data
    serviceProvidersProviderModel=Provider.of<ServiceProvidersProviderModel>(context,listen: false);
    serviceProvidersProviderModel!.getFavsList();
  }
  @override
  Widget build(BuildContext context) {
    serviceProvidersProviderModel=Provider.of<ServiceProvidersProviderModel>(context,listen: true);
    return BaseScreen(
        tag: "FavScreen",
        showBottomBar: true,
        showSettings: false,
        body: Column(children: [
          ActionBarWidget(tr('fav_screen_title'), context),
          Expanded(child:serviceProvidersProviderModel!.isLoading?LoadingProgress():SmartRefresher(
            key: _refresherKey,
            controller: _refreshController,
            enablePullUp: true,
            child: _listitem(),
            physics: BouncingScrollPhysics(),
            footer: ClassicFooter(
              loadStyle: LoadStyle.ShowWhenLoading,
              completeDuration: Duration(milliseconds: 500),
            ),
            onRefresh: () async {
              serviceProvidersProviderModel!.getFavsList();
            },
            onLoading: () async {
              serviceProvidersProviderModel!.getFavsList();

              //_refreshController.loadFailed();
            },
          )
            ,)
        ],));
  }
  Widget _listitem(){
    return serviceProvidersProviderModel!.favList.isNotEmpty?Container(
      color: C.BASE_ORANGE,
      child: ListView.builder(
        itemCount: serviceProvidersProviderModel!.favList.length,
        padding: EdgeInsets.all(D.default_10),
        itemBuilder: (context,index){
          return  FavListItem(index,serviceProvidersProviderModel);
        }),):_noData();
  }
Widget _noData(){
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(tr('FAV_EMPTY'),style: S.h2(color: C.BASE_BLUE),),
        Text(tr('there_is_no_fav'),style: S.h4(color: Colors.grey),)

      ],),);
}
}
