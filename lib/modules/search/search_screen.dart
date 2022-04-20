import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/data/categories_model.dart';
import 'package:alefakaltawinea_animals_app/modules/homeTabsScreen/provider/bottom_bar_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/search/search_List_item.dart';
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


class SearchScreen extends StatefulWidget {
  String title;
  SearchScreen(this.title);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>  {
  BottomBarProviderModel?bottomBarProviderModel;
  ServiceProvidersProviderModel? serviceProvidersProviderModel;
  int _currentLoadedPage=1;
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  GlobalKey _contentKey = GlobalKey();
  GlobalKey _refresherKey = GlobalKey();
  TextEditingController _searchController=TextEditingController();

  @override
  void initState() {
    super.initState();
    ///service providers data
    serviceProvidersProviderModel=Provider.of<ServiceProvidersProviderModel>(context,listen: false);
    serviceProvidersProviderModel!.getSearchList(int.parse(serviceProvidersProviderModel!.serviceProviderModel!.data![0].categoryId!), _currentLoadedPage,keyword: _searchController.text);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    serviceProvidersProviderModel=Provider.of<ServiceProvidersProviderModel>(context,listen: true);
    return BaseScreen(
        tag: "SearchScreen",
        showBottomBar: true,
        showSettings: false,
        body: Column(children: [
          ActionBarWidget(widget.title, context),
          _searchBar(),
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
              _currentLoadedPage=1;
              serviceProvidersProviderModel!.getSearchList(int.parse(serviceProvidersProviderModel!.serviceProviderModel!.data![0].categoryId!), _currentLoadedPage,keyword: _searchController.text);
            },
            onLoading: () async {
              _currentLoadedPage=_currentLoadedPage+1;
              serviceProvidersProviderModel!.getSearchList(int.parse(serviceProvidersProviderModel!.serviceProviderModel!.data![0].categoryId!), _currentLoadedPage,keyword: _searchController.text);

              //_refreshController.loadFailed();
            },
          )
            ,)
        ],));
  }
  Widget _listitem(){
    return serviceProvidersProviderModel!.searchServiceProviderModel!.data!.isNotEmpty?ListView.builder(
        itemCount: serviceProvidersProviderModel!.searchServiceProviderModel!.data!.length,
        padding: EdgeInsets.all(D.default_10),
        itemBuilder: (context,index){
          return  SearchListItem(index);
        }):Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TransitionImage(Res.OFFER_ICON,
          width: D.default_80,
          height: D.default_80,
        ),
        SizedBox(height: D.default_20,),
        Text("لا توجد نتائج",style: S.h3(color: C.BASE_BLUE),)
      ],),);
  }
  Widget _searchBar(){
    return Container(
      margin: EdgeInsets.only(top:D.default_10,bottom: D.default_10,left: D.default_20,right: D.default_20),
      padding: EdgeInsets.only(left:D.default_10,right: D.default_10),

      height: D.default_70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_10),
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
            IconButton(onPressed: (){}, icon: Icon(Icons.search,color: C.BASE_BLUE,)),
            Expanded(child:TextField(
              controller: _searchController,
              style: S.h3(color: Colors.grey),
              decoration: InputDecoration(
                hintText: tr("search"),
                hintStyle: S.h3(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color:Colors.transparent),
                ),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color:Colors.transparent)),
                errorStyle: S.h4(color: Colors.red),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              ),
              onChanged: (value){
                serviceProvidersProviderModel!.getSearchList(int.parse(serviceProvidersProviderModel!.serviceProviderModel!.data![0].categoryId!), _currentLoadedPage,keyword:value);
              },

            ))

          ],),
      ),
    );
  }

}
