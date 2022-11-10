import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';
import '../../utils/my_utils/baseDimentions.dart';
import '../../utils/my_utils/baseTextStyle.dart';
import '../../utils/my_utils/input _validation_mixing.dart';
import '../../utils/my_utils/myColors.dart';
import '../../utils/my_widgets/laoding_view.dart';
import '../login/provider/user_provider_model.dart';

class DeletAcountPopupScreen extends StatefulWidget {
  const DeletAcountPopupScreen({Key? key}) : super(key: key);

  @override
  State<DeletAcountPopupScreen> createState() => _DeletAcountPopupScreenState();
}

class _DeletAcountPopupScreenState extends State<DeletAcountPopupScreen> with InputValidationMixin{
  UserProviderModel? userProviderModel;
  TextEditingController _passwordController = TextEditingController();
  bool passwordobsecure = true;


  @override
  void initState() {
    super.initState();
    userProviderModel=Provider.of<UserProviderModel>(context,listen:false);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(D.default_10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_10),
          color: Colors.white,
          boxShadow:[BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset:Offset(1,1),
              blurRadius:1,
              spreadRadius: 0.5
          )]
      ),
      child: Stack(
        alignment:AlignmentDirectional.center,
        children: [
        Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap:(){
                  Navigator.pop(context);
                },
                child: Icon(Icons.cancel,color: Colors.red,size: D.default_30,),)],),
          SizedBox(height:D.default_10),
          Text(tr("delete_message"),style: S.h4(),),
          SizedBox(height:D.default_10),
          _password(),
          SizedBox(height:D.default_10),
          Row(children: [
            Expanded(child: _acceptBtn(),),
            Expanded(child: _deleteBtn(),)
          ],)

        ],),
        userProviderModel!.isLoading?LoadingProgress():Container()

      ],),);
  }
  Widget _acceptBtn() {
    return InkWell(
      onTap: () async{
        userProviderModel!.deleteAccount(
          context,
          _passwordController.text,
        );
      },
      child: Container(
        margin: EdgeInsets.all(D.default_30),
        padding: EdgeInsets.only(
            left: D.default_10,
            right: D.default_10,
            top: D.default_5,
            bottom: D.default_5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_15),
            color: C.BASE_BLUE,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(1, 1),
                  blurRadius: 1,
                  spreadRadius: 1)
            ]),
        child: Text(
          tr("submit"),
          style: S.h3(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  Widget _deleteBtn() {
    return InkWell(
      onTap: () async{
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.all(D.default_30),
        padding: EdgeInsets.only(
            left: D.default_10,
            right: D.default_10,
            top: D.default_5,
            bottom: D.default_5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_15),
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(1, 1),
                  blurRadius: 1,
                  spreadRadius: 1)
            ]),
        child: Text(
          tr("cancel"),
          style: S.h3(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  Widget _password() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _passwordController,
          validator: (password) {
            if (isFieldNotEmpty(password!)) {
              if (isPasswordValide(password)) {
                return null;
              } else {
                return tr("password_length");
              }
            } else {
              return tr("");
            }
          },
          style: S.h4(color: Colors.black),
          decoration: InputDecoration(
              labelText: tr("enter_password"),
              labelStyle: S.h2(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: C.BASE_BLUE),
              ),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: C.BASE_BLUE)),
              errorStyle: S.h4(color: Colors.red),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    passwordobsecure
                        ? passwordobsecure = false
                        : passwordobsecure = true;
                  });
                },
                icon: Icon(
                  (passwordobsecure ?? false)
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey,
                ),
              )),
          keyboardType: TextInputType.text,
          obscureText: passwordobsecure,
          cursorColor: C.BASE_BLUE,
          autofocus: false,
        ));
  }



}
