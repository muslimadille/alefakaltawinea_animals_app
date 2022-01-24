import 'package:alefakaltawinea_animals_app/modules/adoption/provider/adoption_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/action_bar_widget.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_adoption_screen.dart';
import 'animal_details_screen.dart';

class AdoptionScreen extends StatefulWidget {
  const AdoptionScreen({Key? key}) : super(key: key);

  @override
  _AdoptionScreenState createState() => _AdoptionScreenState();
}

class _AdoptionScreenState extends State<AdoptionScreen> {
  AdoptionProviderModel? adoptionProviderModel;
  @override
  void initState() {
    super.initState();
    adoptionProviderModel=Provider.of<AdoptionProviderModel>(context,listen: false);
    adoptionProviderModel!.getCategoriesList();

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
                  child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [_greenCOntainer(), _whiteContainer()],
          )))
        ],
      ),
    );
  }

  Widget _addBtn() {
    return InkWell(
      onTap: () {
        MyUtils.navigate(context, AddAdoptionScreen());
      },
      child: Container(
          width: D.default_200,
          margin: EdgeInsets.all(D.default_20),
          padding: EdgeInsets.all(D.default_10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(D.default_15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    spreadRadius: 2)
              ]),
          child: Center(
            child: Text(
              tr("add_adoption"),
              style: S.h3(color: C.BASE_BLUE),
              textAlign: TextAlign.center,
            ),
          )),
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
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(1, 1),
                blurRadius: 1,
                spreadRadius: 0.5)
          ]),
      child: Column(
        children: [_addBtn()],
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
      child: Column(
        children: [
          _categoryList(),
          adoptionProviderModel!.isLoading?Expanded(child: LoadingProgress()): Expanded(flex: 1,child: _animalsList())
        ],
      ),
    );
  }

  Widget _categoryList() {
    return Container(
      margin: EdgeInsets.all(D.default_20),
      height: D.default_90,
      width: double.infinity,
      child: ListView.builder(
          itemCount: adoptionProviderModel!.categoriesList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.all(D.default_10),
                child: InkWell(
                  onTap: (){
                    adoptionProviderModel!.setSelectedCategoryIndex(index);
                    adoptionProviderModel!.getAnimals(adoptionProviderModel!.categoriesList[index].id!);
                  },
                  child: TransitionImage(
                  adoptionProviderModel!.categoriesList[index].photo!,
                  radius: D.default_200,
                  width: D.default_70,
                  height: D.default_70,
                  strokeColor: adoptionProviderModel!.selectedCategoryIndex==index?C.BASE_BLUE:Colors.grey,
                  fit: BoxFit.fitWidth,
                  padding: EdgeInsets.all(D.default_5),
                ),));
          }),
    );
  }

  Widget _animalsList() {
    return adoptionProviderModel!.animalPagerListModel!=null&&adoptionProviderModel!.animalPagerListModel!.data!.isNotEmpty?Container(
      padding: EdgeInsets.all(D.default_10),
      child: CustomScrollView(slivers: [
      SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: D.default_10,
            mainAxisSpacing: D.default_10,
            childAspectRatio: 0.8,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return _animalsListItem(index);
            },
            childCount: adoptionProviderModel!.animalPagerListModel!.data!.length,
            semanticIndexOffset: 1,
          )),
    ]),):_noData();
  }
Widget _noData(){
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TransitionImage(Res.OFFER_ICON,
          width: D.default_80,
          height: D.default_80,
        ),
        SizedBox(height: D.default_20,),
        Text("لا توجد حيوانات متاحة حاليا في هذا القسم",style: S.h3(color: C.BASE_BLUE),)
      ],),);
}
  Widget _animalsListItem(int index) {
    return Container(
      width: D.default_80,
      margin: EdgeInsets.all(D.default_5),
      padding: EdgeInsets.all(D.default_2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(D.default_10),
        border: Border.all(color: Colors.grey, width: D.default_1),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
              child: TransitionImage(
                adoptionProviderModel!.animalPagerListModel!.data![index].photo!,
            radius: D.default_10,
                fit: BoxFit.cover,
                width: double.infinity,
          )),
          Container(
            padding: EdgeInsets.all(D.default_5),
            child: Center(
              child: Text(
                adoptionProviderModel!.animalPagerListModel!.data![index].type!,
                style: S.h4(color: C.BASE_BLUE),
              ),
            ),
          ),
          InkWell(
              onTap: () {
                MyUtils.navigate(context, AnimalDetailsScreen(index));
              },
              child: Container(
                  margin: EdgeInsets.all(D.default_5),
                  padding: EdgeInsets.all(D.default_5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(D.default_15),
                      color: C.BASE_BLUE,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            spreadRadius: 2)
                      ]),
                  child: Center(
                    child: Text(
                      tr("details"),
                      style: S.h5(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )))
        ],
      ),
    );
  }

  List<adoptionCategory> categories = [
    adoptionCategory(),
    adoptionCategory(),
    adoptionCategory(),
    adoptionCategory(),
    adoptionCategory(),
    adoptionCategory(),
    adoptionCategory()
  ];
}

class adoptionCategory {
  String name = "test";
  String image = Res.IC_FAV_GREY;
}
