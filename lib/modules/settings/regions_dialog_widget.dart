import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

import '../../utils/my_utils/baseDimentions.dart';
import '../../utils/my_utils/baseTextStyle.dart';
import '../../utils/my_utils/constants.dart';
import '../../utils/my_utils/myColors.dart';
import '../login/data/user_data.dart';
import '../login/provider/user_provider_model.dart';

class RegionsDialogWidget extends StatefulWidget {
  const RegionsDialogWidget({Key? key}) : super(key: key);

  @override
  _RegionsDialogWidgetState createState() => _RegionsDialogWidgetState();
}

class _RegionsDialogWidgetState extends State<RegionsDialogWidget> {
  UserProviderModel? userProviderModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProviderModel=Provider.of<UserProviderModel>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width:D.default_200,
        height: D.default_400,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(D.default_10),
              child: Text(tr("select_city"),style: S.h1(color: C.BASE_BLUE),textAlign:TextAlign.center ,),),
            Container(width: double.infinity,height: D.default_1,color: Colors.grey,),
            Container(
              height: D.default_260,
              width:D.default_300 ,
              child: ListView.builder(
                  itemCount: Constants.STATES.length,
                  itemBuilder:(context,index){
                    return Container(
                        child: Row(children: [
                          Radio(value: true, groupValue:Constants.STATES[Constants.utilsProviderModel!.currentStateIndex].id==Constants.STATES[index].id,toggleable: true,activeColor:C.BASE_BLUE, onChanged: ( val ){
                            bool currentValue=val as bool ;
                            if(currentValue){
                              Constants.utilsProviderModel!.setCurrentStateIndex(index);
                             // Constants.utilsProviderModel!.setCurrentRegionIndex(Constants.REGIONS.indexOf(Constants.REGIONS.where((element) => element.id==Constants.STATES[index].regionId).first));
                              setState(() {

                              });
                            }
                          }),
                          Text(Constants.STATES[index].name!, style: S.h2(color: Colors.black))
                        ],));
                  }),),
            Container(width: double.infinity,height: D.default_1,color: Colors.grey,),
            Container(
                child:Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                  InkWell(onTap: ()async{
                    UserData user=userProviderModel!.currentUser!;
                    user.regionId=Constants.STATES[Constants.utilsProviderModel!.currentRegionIndex].regionId.toString();
                    user.stateId=Constants.STATES[Constants.utilsProviderModel!.currentStateIndex].id.toString();
                    userProviderModel!.setCurrentUserData(user);
                    Navigator.pop(context);
                  },child: Container(
                      padding: EdgeInsets.all(D.default_15),
                      child: Text(tr("confirm"), style: S.h2(color: C.BASE_BLUE))),),
                  InkWell(onTap: (){
                    Navigator.pop(context);
                  },child: Container(
                      padding: EdgeInsets.all(D.default_15),
                      child: Text(tr("cancel"), style: S.h2(color: C.BASE_BLUE))),)
                ],))

          ],));
  }
}
