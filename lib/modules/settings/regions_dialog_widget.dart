import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

import '../../utils/my_utils/baseDimentions.dart';
import '../../utils/my_utils/baseTextStyle.dart';
import '../../utils/my_utils/constants.dart';
import '../../utils/my_utils/myColors.dart';
import '../login/data/user_data.dart';
import '../login/provider/user_provider_model.dart';
import '../spalshScreen/data/regions_model.dart';

class RegionsDialogWidget extends StatefulWidget {
  Function(Get_states) onItemSelect;
   RegionsDialogWidget({required this.onItemSelect,Key? key}) : super(key: key);

  @override
  _RegionsDialogWidgetState createState() => _RegionsDialogWidgetState();
}

class _RegionsDialogWidgetState extends State<RegionsDialogWidget> {
  UserProviderModel? userProviderModel;
  Get_states? selectedState;
  TextEditingController _searchController=TextEditingController();
  List<Get_states> filteredStates=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProviderModel=Provider.of<UserProviderModel>(context,listen: false);
    filteredStates.addAll(Constants.STATES);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width:double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(1, 1),
                  blurRadius: 1,
                  spreadRadius: 1)
            ]),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left:D.default_10,right: D.default_10,top: D.default_20,bottom: D.default_20),
              child: Text(tr("select_city"),style: S.h1(color: C.BASE_BLUE),textAlign:TextAlign.center ,),),
            Container(width: double.infinity,height: D.default_1,color: Colors.grey,),
            _searchBar(),
            Container(
              height: D.default_260,
              width:D.default_300 ,
              child: ListView.builder(
                  itemCount: filteredStates.length,
                  itemBuilder:(context,index){
                    return Container(
                        child: Row(children: [
                          Radio(value: true, groupValue:filteredStates[Constants.utilsProviderModel!.currentStateIndex].id==filteredStates[index].id,toggleable: true,activeColor:C.BASE_BLUE, onChanged: ( val ){
                            bool currentValue=val as bool ;
                            if(currentValue){
                              Constants.utilsProviderModel!.setCurrentStateIndex(index);
                             // Constants.utilsProviderModel!.setCurrentRegionIndex(Constants.REGIONS.indexOf(Constants.REGIONS.where((element) => element.id==filteredStates[index].regionId).first));
                              setState(() {

                              });
                            }
                          }),
                          Text(filteredStates[index].name!, style: S.h2(color: Colors.black))
                        ],));
                  }),),
            Container(width: double.infinity,height: D.default_1,color: Colors.grey,),
            Container(
                padding: EdgeInsets.only(left:D.default_10,right: D.default_10,top: D.default_10,bottom: D.default_10),
                child:Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                  InkWell(onTap: ()async{
                    widget.onItemSelect(filteredStates[Constants.currentState]);
                    Navigator.pop(context);
                  },child: Container(
                      padding: EdgeInsets.all(D.default_15),
                      child: Text(tr("confirm"), style: S.h1(color: C.BASE_BLUE))),),
                  InkWell(onTap: (){
                    Navigator.pop(context);
                  },child: Container(
                      padding: EdgeInsets.all(D.default_15),
                      child: Text(tr("cancel"), style: S.h1(color: Colors.red))),)
                ],))

          ],));
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
                setState(() {
                  Constants.utilsProviderModel!.setCurrentStateIndex(0);
                  filteredStates.clear();
                  filteredStates.addAll(Constants.STATES.where((element) => (element.name??"").toLowerCase().contains(value.toLowerCase())).toList());
                });
              },

            ))

          ],),
      ),
    );
  }

}
