import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/categories_screen/data/categories_model.dart';
import 'package:alefakaltawinea_animals_app/modules/homeTabsScreen/provider/bottom_bar_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/notifications/provider/notification_provider.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/details_screen/service_provider_details_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/items/service_provider_list_item.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/provider/sevice_providers_provicer_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/my_fonts.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/action_bar_widget.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notification_details_screen.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen();

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  BottomBarProviderModel? bottomBarProviderModel;
  NotificationProvider? notificationProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      ///bottom bar selection
      bottomBarProviderModel =
          Provider.of<BottomBarProviderModel>(context, listen: false);

      ///notifications data
      notificationProvider =
          Provider.of<NotificationProvider>(context, listen: false);
      notificationProvider!.getNotificationsList();
    });

  }

  @override
  Widget build(BuildContext context) {
    notificationProvider =
        Provider.of<NotificationProvider>(context, listen: true);
    return BaseScreen(
        tag: "NotificationsScreen",
        showBottomBar: true,
        showSettings: false,
        body: Consumer<NotificationProvider>(builder: (context,provider,child){
          return Column(
            children: [
              ActionBarWidget(tr('noti_screen_title'), context),
              Expanded(
                child: provider.isLoading
                    ? LoadingProgress()
                    : _listitem(),
              )
            ],
          );
        },));
  }

  Widget _listitem() {
    return Consumer<NotificationProvider>(builder: (context,provider,child){
      return provider.notificationsList.isNotEmpty
          ? ListView.builder(
          itemCount: provider.notificationsList.length,
          padding: EdgeInsets.only(top: D.default_10, bottom: D.default_10),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                MyUtils.navigate(
                    context,
                    NotificationDetailsScreen(
                        provider.notificationsList[index]));
              },
              child: Container(
                margin:
                EdgeInsets.only(top: D.default_10, bottom: D.default_10),
                height: D.default_80,
                width: double.infinity,
                color: C.BASE_BLUE,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: D.default_10, right: D.default_10),
                      child: TransitionImage(
                        provider
                            .notificationsList[index].shop!.photo ??
                            "",
                        fit: BoxFit.cover,
                        width: D.default_80,
                        height: D.default_80,
                        padding: EdgeInsets.all(D.default_10),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Expanded(
                        child: Text(
                          provider.notificationsList[index].title!,
                          style: S.h4(color:Colors.white,font: MyFonts.VazirBlack),
                        ))
                  ],
                ),
              ),
            );
          })
          : _noData();
    },);
  }

  Widget _noData() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tr('noti_EMPTY'),
            style: S.h2(color: C.BASE_BLUE),
          ),
        ],
      ),
    );
  }
}
