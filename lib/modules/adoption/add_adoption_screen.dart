
import 'dart:convert';

import 'package:alefakaltawinea_animals_app/modules/adoption/provider/adoption_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/apis.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/input%20_validation_mixing.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/action_bar_widget.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';


class AddAdoptionScreen extends StatefulWidget {
   AddAdoptionScreen();

  @override
  _AddAdoptionScreenState createState() => _AddAdoptionScreenState();
}

class _AddAdoptionScreenState extends State<AddAdoptionScreen> with InputValidationMixin{
  AdoptionProviderModel? adoptionProviderModel;

  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _vaccitionController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _reasonController = TextEditingController();
  TextEditingController _statusController = TextEditingController();
  TextEditingController _conditionsController = TextEditingController();
  final _registerFormGlobalKey = GlobalKey<FormState>();
  File? _cLassImage = null;
  bool imageValid=true;
  var imageFile;

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
          ActionBarWidget("", context,backgroundColor: C.ADAPTION_COLOR,),
          Expanded(
              child: Container(
                  color: C.ADAPTION_COLOR,
                  child: Stack(

                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      _whiteContainer(),
                      Positioned(child:
                      Container(
                        width: D.default_130,
                        height: D.default_130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(D.default_200)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: Offset(1, 1),
                                  blurRadius: 1,
                                  spreadRadius: 0.5)
                            ]),
                        child: InkWell(
                            onTap: () {
                              _imgFromGallery();
                            },
                            child: _cLassImage!=null?TransitionImage(Res.DEFAULT_ADD_IMAGE,
                                fit: BoxFit.cover,
                                file:_cLassImage,
                                radius: D.default_200,
                                width: D.default_130,
                                height: D.default_130,
                                padding: EdgeInsets.all(D.default_10),
                                placeHolderImage: Res.DEFAULT_IMAGE,
                                strokeColor: imageValid?Colors.white:Colors.red,
                                strokeWidth: D.default_2):Center(child: Icon(Icons.camera_alt_outlined,size: D.default_50,color: C.ADAPTION_COLOR,),)),),top:D.default_100),
                      Positioned(child: Text(tr("add_adoption_title"),style: S.h2(color: Colors.white),),top: D.default_30,)
                    ],
                  )))
        ],
      ),
    );
  }

  Widget _whiteContainer() {
    return Container(
      margin: EdgeInsets.only(top: D.default_180),
      padding: EdgeInsets.only(top: D.default_10,bottom: D.default_10,left: D.default_20,right:D.default_20),

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
      child: Column(children: [
        Expanded(child: _dataForm()),
        _addBtn()
      ],),
    );
  }
  Widget _dataForm(){
    return SingleChildScrollView(child: Form(
      key: _registerFormGlobalKey,
      child: Container(
        margin: EdgeInsets.only(left: D.default_20,right: D.default_20,top: D.default_50,bottom: D.default_10),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _age(),
          _gender(),
          _type(),
          _vacation(),
          _city(),
          _reason(),
          _status(),
          _conditions(),

        ],
      ),),
    ),);
  }
  Widget _age() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _ageController,
          validator: (name) {
            if (isFieldNotEmpty(name!)) {
              return null;
            } else {
              return tr("");
            }
          },
          decoration: InputDecoration(
            hintText: tr("age"),
            hintStyle: S.h4(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: C.ADAPTION_COLOR),
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: C.ADAPTION_COLOR)),
            errorStyle: S.h4(color: Colors.red),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          ),
          keyboardType: TextInputType.text,
          obscureText: false,
          cursorColor: C.ADAPTION_COLOR,
          autofocus: false,
        ));
  }
  Widget _gender() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _genderController,
          validator: (name) {
            if (isFieldNotEmpty(name!)) {
              return null;
            } else {
              return tr("");
            }
          },
          decoration: InputDecoration(
            hintText: tr("gendar"),
            hintStyle: S.h4(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: C.ADAPTION_COLOR),
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: C.ADAPTION_COLOR)),
            errorStyle: S.h4(color: Colors.red),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          ),
          keyboardType: TextInputType.text,
          obscureText: false,
          cursorColor: C.ADAPTION_COLOR,
          autofocus: false,
        ));
  }
  Widget _type() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _typeController,
          validator: (name) {
            if (isFieldNotEmpty(name!)) {
              return null;
            } else {
              return tr("");
            }
          },
          decoration: InputDecoration(
            hintText: tr("type"),
            hintStyle: S.h4(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: C.ADAPTION_COLOR),
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: C.ADAPTION_COLOR)),
            errorStyle: S.h4(color: Colors.red),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          ),
          keyboardType: TextInputType.text,
          obscureText: false,
          cursorColor: C.ADAPTION_COLOR,
          autofocus: false,
        ));
  }
  Widget _vacation() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _vaccitionController,
          validator: (name) {
            if (isFieldNotEmpty(name!)) {
              return null;
            } else {
              return tr("");
            }
          },
          decoration: InputDecoration(
            hintText: tr("vaccation"),
            hintStyle: S.h4(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: C.ADAPTION_COLOR),
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: C.ADAPTION_COLOR)),
            errorStyle: S.h4(color: Colors.red),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          ),
          keyboardType: TextInputType.text,
          obscureText: false,
          cursorColor: C.ADAPTION_COLOR,
          autofocus: false,
        ));
  }
  Widget _city() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _cityController,
          validator: (name) {
            if (isFieldNotEmpty(name!)) {
              return null;
            } else {
              return tr("");
            }
          },
          decoration: InputDecoration(
            hintText: tr("city"),
            hintStyle: S.h4(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: C.ADAPTION_COLOR),
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: C.ADAPTION_COLOR)),
            errorStyle: S.h4(color: Colors.red),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          ),
          keyboardType: TextInputType.text,
          obscureText: false,
          cursorColor: C.ADAPTION_COLOR,
          autofocus: false,
        ));
  }
  Widget _reason() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _reasonController,
          validator: (name) {
            if (isFieldNotEmpty(name!)) {
              return null;
            } else {
              return tr("");
            }
          },
          decoration: InputDecoration(
            hintText: tr("reason"),
            hintStyle: S.h4(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: C.ADAPTION_COLOR),
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: C.ADAPTION_COLOR)),
            errorStyle: S.h4(color: Colors.red),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          ),
          keyboardType: TextInputType.text,
          obscureText: false,
          cursorColor: C.ADAPTION_COLOR,
          autofocus: false,
        ));
  }
  Widget _status() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _statusController,
          validator: (name) {
            if (isFieldNotEmpty(name!)) {
              return null;
            } else {
              return tr("");
            }
          },
          decoration: InputDecoration(
            hintText: tr("status"),
            hintStyle: S.h4(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: C.ADAPTION_COLOR),
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: C.ADAPTION_COLOR)),
            errorStyle: S.h4(color: Colors.red),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          ),
          keyboardType: TextInputType.text,
          obscureText: false,
          cursorColor: C.ADAPTION_COLOR,
          autofocus: false,
        ));
  }
  Widget _conditions() {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: _conditionsController,
          validator: (name) {
            if (isFieldNotEmpty(name!)) {
              return null;
            } else {
              return tr("");
            }
          },
          decoration: InputDecoration(
            hintText: tr("condition"),
            hintStyle: S.h4(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: C.ADAPTION_COLOR),
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: C.ADAPTION_COLOR)),
            errorStyle: S.h4(color: Colors.red),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          ),
          keyboardType: TextInputType.text,
          obscureText: false,
          cursorColor: C.ADAPTION_COLOR,
          autofocus: false,
        ));
  }

  _imgFromGallery() async {
    ImagePicker? imagePicker = ImagePicker();
    PickedFile? compressedImage = await imagePicker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      _cLassImage = File(compressedImage!.path);

    });
    String fileName = _cLassImage!.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file":
      await MultipartFile.fromFile(_cLassImage!.path, filename:fileName),
    });
    imageFile=formData;
    _cLassImage!.length().then((value) => print("image size ${value}"));
  }

Widget _addBtn(){
    return InkWell(onTap: () async {
      if(_cLassImage!=null){
        if (_registerFormGlobalKey.currentState!.validate()) {
          _registerFormGlobalKey.currentState!.save();
          MultipartFile mFile = await MultipartFile.fromFile(
            _cLassImage!.path, filename:  _cLassImage!.path.split('/').last,
            contentType: MediaType("image",  _cLassImage!.path.split('/').last.split(".").last),);
          FormData formData =  FormData.fromMap({
            "category_id":adoptionProviderModel!.categoriesList[adoptionProviderModel!.selectedCategoryIndex].id,
            "age":_ageController.text,
            "type":_typeController.text,
            "gender":_genderController.text,
            "vaccination":_vaccitionController.text,
            "city":_cityController.text,
            "reason_to_give_up":_reasonController.text,
            "health_status":_statusController.text,
            "conditions":_conditionsController.text,
            "photo": mFile,
          });
          adoptionProviderModel!.setAnimal(context,formData,adoptionProviderModel!.categoriesList[adoptionProviderModel!.selectedCategoryIndex].id!);
        }
      }else{
        setState(() {
          imageValid=false;
        });
      }

    },child: Container(
        width: D.default_200,
        margin: EdgeInsets.all(D.default_20),
        padding: EdgeInsets.all(D.default_10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_15),
            color: C.ADAPTION_COLOR,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(1, 1),
                  blurRadius: 1,
                  spreadRadius: 1)
            ]),
        child: Center(
          child: Text(
            tr("add_adoption"),
            style: S.h3(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        )),);
}

}
