import 'package:alefakaltawinea_animals_app/modules/categories_screen/provider/categories_provider_model.dart';
import 'package:alefakaltawinea_animals_app/modules/serviceProviders/list_screen/service_providers_list_screen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/resources.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class CategoryListItem extends StatefulWidget {
  int index;
  OnItemClickListener? onItemClickListener;
  CategoriesProviderModel? categoriesProviderModel;

  CategoryListItem(
      this.index, this.categoriesProviderModel, this.onItemClickListener);

  @override
  _CategoryListItemState createState() => _CategoryListItemState(index);
}

class _CategoryListItemState extends State<CategoryListItem> {
  _CategoryListItemState(this.index);

  int index;
  GlobalKey _keyRed = GlobalKey();
  double height = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onItemClickListener,
      child: _newIem(),
    );
  }

  Widget _old() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
          key: _keyRed,
          margin: EdgeInsets.only(
              left: D.default_5, right: D.default_5, top: D.default_10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(D.default_10),
              color: Color(int.parse(widget
                  .categoriesProviderModel!.categoriesList[widget.index].color!
                  .replaceAll("#", "0xFF"))),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(1, 1),
                    blurRadius: 1,
                    spreadRadius: 1)
              ]),
          child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  child: widget.categoriesProviderModel!
                          .categoriesList[widget.index].photo!.isNotEmpty
                      ? TransitionImage(
                          widget.categoriesProviderModel!
                              .categoriesList[widget.index].photo!,
                          fit: BoxFit.cover,
                          height: height + D.default_10,
                        )
                      : Container(),
                  bottom: 0,
                  right: -D.default_16,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: widget.categoriesProviderModel!
                            .categoriesList[widget.index].photo!.isNotEmpty
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(D.default_20),
                          child: Text(
                              widget.categoriesProviderModel!
                                  .categoriesList[widget.index].name!,
                              style: S.h3(color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                ),
              ])),
    );
  }

  Widget _newIem() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          color: widget.categoriesProviderModel!.categoriesList[widget.index].color!=null?Color(int.parse("${widget.categoriesProviderModel!.categoriesList[widget.index].color!.replaceAll("#", "0xff")}")) : Color(0xffF38183),),
        Positioned(
            child: TransitionImage(
              widget.categoriesProviderModel!.categoriesList[widget.index]
                  .photo!.isNotEmpty
                  ? widget.categoriesProviderModel!
                  .categoriesList[widget.index].photo!
                  : Res.SHOP_IC,
              fit: BoxFit.fitHeight,
              padding: EdgeInsets.only(top:D.default_30,bottom:D.default_30),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
            )),
        Container(
          height: D.default_40,
          child: Center(
          child: Text(
              widget.categoriesProviderModel!
                  .categoriesList[widget.index].name!,
              style: S.h3(color: Colors.white)),
        ),)
      ],
    );
  }
}
