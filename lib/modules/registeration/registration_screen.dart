import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/modules/login/provider/user_provider_model.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/input%20_validation_mixing.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/laoding_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> with InputValidationMixin {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool passwordobsecure = true;
  bool confirmpasswordobsecure = true;
  bool _accept = false;
  bool _showTermsError = false;
  UserProviderModel? userProviderModel;
  final _registerFormGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    userProviderModel = Provider.of<UserProviderModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    userProviderModel = Provider.of<UserProviderModel>(context, listen: true);

    return BaseScreen(
        showSettings: false,
        showBottomBar: false,
        tag: "RegistrationScreen",
        body: userProviderModel!.isLoading
            ? LoadingProgress()
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: D.default_200,
                        child: Center(
                          child: Text(
                            tr("register_header"),
                            style: S.h1(color: C.BASE_BLUE),
                            textAlign: TextAlign.center,
                          ),
                        )),
                    _header(),
                    Container(
                      padding: EdgeInsets.all(D.default_20),
                      child: Form(
                        key: _registerFormGlobalKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _name(),
                            _email(),
                            _phone(),
                            _password(),
                            _confirmPassword(),
                            _coditions(),
                            _registerBtn(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }

  Widget _coditions() {
    return Container(
        padding: EdgeInsets.all(D.default_10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Radio(
                    value: true,
                    groupValue: _accept,
                    toggleable: true,
                    activeColor: C.BASE_BLUE,
                    onChanged: (val) {
                      setState(() {
                        _accept = val as bool;
                      });
                    }),
                Text(tr("accept_terms"), style: S.h2(color: Colors.black))
              ],
            ),
            _showTermsError
                ? Container(
                    padding: EdgeInsets.only(
                        left: D.default_20, right: D.default_20),
                    child: Text(
                      tr("terms_error"),
                      style: S.h4(color: Colors.red),
                    ),
                  )
                : Container()
          ],
        ));
  }

  Widget _name() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _nameController,
          validator: (name) {
            if (isFieldNotEmpty(name!)) {
              return null;
            } else {
              return tr("enter_name");
            }
          },
          decoration: InputDecoration(
            hintText: tr("enter_name"),
            hintStyle: S.h2(color: Colors.grey),
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
          ),
          keyboardType: TextInputType.text,
          obscureText: false,
          cursorColor: C.BASE_BLUE,
          autofocus: false,
        ));
  }

  Widget _email() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _emailController,
          validator: (email) {
            if (isFieldNotEmpty(email!)) {
              return null;
            } else {
              return tr("enter_email");
            }
          },
          decoration: InputDecoration(
            hintText: tr("enter_email"),
            hintStyle: S.h2(color: Colors.grey),
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
          ),
          keyboardType: TextInputType.text,
          obscureText: false,
          cursorColor: C.BASE_BLUE,
          autofocus: false,
        ));
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
              return tr("enter_password");
            }
          },
          style: S.h4(color: Colors.black),
          decoration: InputDecoration(
              hintText: tr("enter_password"),
              hintStyle: S.h2(color: Colors.grey),
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

  Widget _confirmPassword() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _confirmPasswordController,
          validator: (confirm) {
            if (isFieldNotEmpty(confirm!)) {
              if (isTowFieldsMached(_passwordController.text, confirm)) {
                return null;
              } else {
                return tr("not_confirm");
              }
            } else {
              return tr("confirm_password");
            }
          },
          style: S.h4(color: Colors.black),
          decoration: InputDecoration(
              hintText: tr("confirm_password"),
              hintStyle: S.h2(color: Colors.grey),
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
                    confirmpasswordobsecure
                        ? confirmpasswordobsecure = false
                        : confirmpasswordobsecure = true;
                  });
                },
                icon: Icon(
                  (confirmpasswordobsecure ?? false)
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey,
                ),
              )),
          keyboardType: TextInputType.text,
          obscureText: confirmpasswordobsecure,
          cursorColor: C.BASE_BLUE,
          autofocus: false,
        ));
  }

  Widget _phone() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _phoneController,
          validator: (phone) {
            if (isFieldNotEmpty(phone!)) {
              if (isPhoneValide(phone)) {
              } else {
                return tr("enter_10_numbers");
              }
            } else {
              return tr("enter_phone");
            }
          },
          decoration: InputDecoration(
            hintText: tr("enter_phone"),
            hintStyle: S.h2(color: Colors.grey),
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
          ),
          keyboardType: TextInputType.phone,
          obscureText: false,
          cursorColor: C.BASE_BLUE,
          autofocus: false,
        ));
  }

  Widget _registerBtn() {
    return Center(
      child: InkWell(
        onTap: () {
          _onRegisterClicked();
        },
        child: Container(
          width: D.default_300,
          margin: EdgeInsets.all(D.default_30),
          padding: EdgeInsets.only(
              left: D.default_20,
              right: D.default_20,
              top: D.default_10,
              bottom: D.default_10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(D.default_10),
              color: C.BASE_BLUE,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    spreadRadius: 2)
              ]),
          child: Text(
            tr("create_new_account"),
            style: S.h2(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: EdgeInsets.all(D.default_10),
      color: C.BASE_BLUE,
      child: Center(
        child: Text(
          tr("profile_info"),
          style: S.h1(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _onRegisterClicked() {
    if (_registerFormGlobalKey.currentState!.validate()) {
      _registerFormGlobalKey.currentState!.save();
      if (_accept) {
        setState(() {
          _showTermsError = false;
        });
      } else {
        setState(() {
          _showTermsError = true;
        });
      }
      //call register api
      userProviderModel!.register(
          context,
          _nameController.text,
          _emailController.text,
          _phoneController.text,
          _passwordController.text,
          _confirmPasswordController.text);
    } else {
      if (_accept) {
        setState(() {
          _showTermsError = false;
        });
      } else {
        setState(() {
          _showTermsError = true;
        });
      }
    }
  }
}
