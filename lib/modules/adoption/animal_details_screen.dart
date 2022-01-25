import 'package:alefakaltawinea_animals_app/modules/adoption/provider/adoption_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/action_bar_widget.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/animal_pager_list_model.dart';

class AnimalDetailsScreen extends StatefulWidget {
  int index;
   AnimalDetailsScreen(this.index);

  @override
  _AnimalDetailsScreenState createState() => _AnimalDetailsScreenState();
}

class _AnimalDetailsScreenState extends State<AnimalDetailsScreen> {
  AdoptionProviderModel? adoptionProviderModel;
  void initState() {
    super.initState();
    adoptionProviderModel=Provider.of<AdoptionProviderModel>(context,listen: false);

  }

  @override
  Widget build(BuildContext context) {
    adoptionProviderModel=Provider.of<AdoptionProviderModel>(context,listen: true);
    return BaseScreen(
      showSettings: false,
      showBottomBar: true,
      tag: "AdoptionScreen",
      body: Column(
        children: [
          ActionBarWidget(tr("adoption"), context),
          Expanded(
              child: Container(
                color: C.BASE_BLUE_WHITE,
                  child: Stack(

                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          TransitionImage(
                            Res.ANIMALS_BG,
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width-D.default_50,
                            height: D.default_90,
                          )              ],),
                      _greenCOntainer(), _whiteContainer()],
                  )))
        ],
      ),
    );
  }
  Widget _greenCOntainer() {
    return Container(
      margin: EdgeInsets.only(top: D.default_90),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(D.default_80),
              topRight: Radius.circular(D.default_80)),
          color: C.BASE_BLUE,
          ),
      child: Column(
        children: [],
      ),
    );
  }

  Widget _whiteContainer() {
    return Container(
      margin: EdgeInsets.only(top: D.default_180),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(D.default_80),
              topRight: Radius.circular(D.default_80)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(1, 1),
                blurRadius: 1,
                spreadRadius: 0.5)
          ]),
      child: detailsCrd(),
    );
  }
  Widget detailsCrd(){
    AnimalData data=adoptionProviderModel!.animalPagerListModel!.data![widget.index];
    return SingleChildScrollView(child: Container(
      margin: EdgeInsets.only(top:D.default_50,bottom: D.default_50,left: D.default_80,right: D.default_80),
      padding: EdgeInsets.all(D.default_2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(D.default_10),
        border: Border.all(color: Colors.grey, width: D.default_1),
        color: Colors.white,
      ),
      child: Column(
        children: [
          TransitionImage(
            adoptionProviderModel!.animalPagerListModel!.data![widget.index].photo!,
            radius: D.default_10,
            fit: BoxFit.cover,
            width: double.infinity,
            height: D.default_180,

          ),
          _infoItem(tr("age"),data.age!),
          _infoItem(tr("gendar"),data.gender!),
          _infoItem(tr("type"),data.type!),
          _infoItem(tr("vaccation"),data.vaccination!),
          _infoItem(tr("city"),data.city!),
          _infoItem(tr("reason"),data.reasonToGiveUp!),
          _infoItem(tr("status"),data.healthStatus!),
          _infoItem(tr("condition"),data.conditions!),
        ],
      ),
    ),);
  }
  Widget _infoItem(String title,String content){
    return Container(
      padding: EdgeInsets.only(left: D.default_10,right: D.default_10,top:D.default_5,bottom: D.default_5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("${title}:  ",style: S.h3(color: C.BASE_BLUE),),
          Text("${content}",style: S.h4(color: Colors.black54),),
        ],),);
  }
}
