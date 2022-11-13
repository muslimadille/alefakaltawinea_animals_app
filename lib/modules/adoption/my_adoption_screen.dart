import 'package:alefakaltawinea_animals_app/modules/adoption/data/animal_pager_list_model.dart';
import 'package:alefakaltawinea_animals_app/modules/adoption/provider/adoption_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/profile/no_profile_screen.dart';
import 'package:alefakaltawinea_animals_app/modules/registeration/registration_screen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
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

class MyAdoptionScreen extends StatefulWidget {
  const MyAdoptionScreen({Key? key}) : super(key: key);

  @override
  _MyAdoptionScreenState createState() => _MyAdoptionScreenState();
}

class _MyAdoptionScreenState extends State<MyAdoptionScreen> {
  AdoptionProviderModel? adoptionProviderModel;
  int selectedTab=0;
  @override
  void initState() {
    super.initState();
    adoptionProviderModel=Provider.of<AdoptionProviderModel>(context,listen: false);

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await adoptionProviderModel!.getCategoriesList();
      await adoptionProviderModel!.getMyAnimals();
    });


  }
  @override
  Widget build(BuildContext context) {
    adoptionProviderModel=Provider.of<AdoptionProviderModel>(context,listen: true);
    return BaseScreen(
      showSettings: false,
      showBottomBar: true,
      tag: "MyAdoptionScreen",
      body: Column(
        children: [
          ActionBarWidget("", context,backgroundColor: Colors.white,textColor: C.BASE_BLUE,enableShadow: false,showShare: true,),
          Expanded(
              child:Container(
                color: Colors.white,
                child: Column(
                  children: [
                    _categoryList(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      _myOffersBtn()
                    ],),
                    adoptionProviderModel!.isLoading?Expanded(flex:1,child: LoadingProgress(),): Expanded(flex: 1,child: _animalsList())
                  ],
                ),))
        ],
      ),
    );
  }

  Widget _addBtn() {
    return InkWell(
      onTap: () {
        if(Constants.currentUser!=null){
          MyUtils.navigate(context, AddAdoptionScreen());
        }else{
          MyUtils.navigate(context, RegistrationScreen());
        }
      },
      child: Container(
        width: D.default_200,
          margin: EdgeInsets.only(left:D.default_10,right:D.default_10),
          padding: EdgeInsets.only(top:D.default_10,bottom:D.default_10,left:D.default_20,right:D.default_20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_15),
            color: C.ADAPTION_COLOR,
          ),
          child: Center(
            child: Text(
              tr("add_adoption"),
              style: S.h1(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
  Widget _myOffersBtn() {
    return Container(
        margin: EdgeInsets.only(left:D.default_10,right:D.default_10),
        padding: EdgeInsets.only(top:D.default_8,bottom:D.default_8,left:D.default_30,right:D.default_30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_15),
          color: C.ADAPTION_COLOR,
        ),
        child: Center(
          child: Text(
            tr("my_adoption"),
            style: S.h2(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ));
  }




  Widget _categoryList() {
    return Container(
      margin: EdgeInsets.only(left:D.default_10,right:D.default_10),
      height: D.default_80,
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
                    adoptionProviderModel!.setMyAnimalsFilteredList(adoptionProviderModel!.categoriesList[index].id!.toString())();
                  },
                  child: TransitionImage(
                    adoptionProviderModel!.categoriesList[index].photo!,
                    radius: D.default_200,
                    width: D.default_60,
                    height: D.default_60,
                    strokeColor: adoptionProviderModel!.selectedCategoryIndex==index?C.ADAPTION_COLOR:Colors.grey[400],
                    backgroundColor: adoptionProviderModel!.selectedCategoryIndex==index?C.ADAPTION_COLOR:Colors.grey[400],
                    fit: BoxFit.fitWidth,
                    padding: EdgeInsets.all(D.default_5),
                  ),));
          }),
    );
  }

  Widget _animalsList() {
    return adoptionProviderModel!.isLoading?LoadingProgress():adoptionProviderModel!.myAnimalsPagerListModel!=null&&adoptionProviderModel!.myAnimalsFilteredList.isNotEmpty?Container(
      padding: EdgeInsets.all(D.default_10),
      child: CustomScrollView(slivers: [
        SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: D.default_5,
              mainAxisSpacing: D.default_5,
              childAspectRatio: 1.18,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return _animalsListItem(index);
              },
              childCount: adoptionProviderModel!.myAnimalsFilteredList.length,
              semanticIndexOffset: 1,
            )),
      ]),):_noData();
  }
  Widget _noData(){
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(tr("empty_adoption"),style: S.h1Bold(color: C.ADAPTION_COLOR),),
        Text(tr("u_dont_add_adoption"),style: S.h3(color: Colors.grey),),
        SizedBox(height: D.default_20,),
        Container(
          margin: EdgeInsets.all(D.default_30),
          child: _addBtn(),)
      ],),);
  }
  Widget _animalsListItem(int index) {
    return InkWell(
        onTap: () {
          if(Constants.currentUser!=null){
            MyUtils.navigate(context, AddAdoptionScreen(data:adoptionProviderModel!.myAnimalsFilteredList[index]));
          }else{
            MyUtils.navigate(context, RegistrationScreen());
          }
        },
        child:Container(
          margin: EdgeInsets.all(D.default_5),
          padding: EdgeInsets.all(D.default_2),

          child: Column(
            children: [
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(D.default_150),
                        color: Colors.white,
                        boxShadow:[BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset:Offset(1,1),
                            blurRadius:2,
                            spreadRadius: 2
                        )]
                    ),
                    child: TransitionImage(
                      adoptionProviderModel!.myAnimalsFilteredList[index].photo!.isNotEmpty?adoptionProviderModel!.myAnimalsFilteredList[index].photo!:Res.DEFAULT_IMAGE,
                      radius: D.default_150,
                      fit: BoxFit.cover,
                      width: D.default_110,
                      height: D.default_110,

                    ),)),
              Container(
                child: Center(
                  child: Text(
                    adoptionProviderModel!.myAnimalsFilteredList[index].type!,
                    style: S.h1(color: C.BASE_BLUE),
                  ),
                ),
              ),
              Text(
                tr("more"),
                style: S.h4(color: Colors.grey),
              )

            ],
          ),
        ));
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
