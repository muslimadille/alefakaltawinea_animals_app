import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/transition_image.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: D.default_10,
            mainAxisSpacing: D.default_10,
            childAspectRatio: 1.5,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return InkWell(
                  child: Container(
                      child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              margin:EdgeInsets.only(left:D.default_20,right:D.default_20,top: D.default_10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(D.default_10),
                                  color: Colors.white,
                                  boxShadow:[BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset:Offset(2,2),
                                      blurRadius:2,
                                      spreadRadius:1
                                  )]
                              ),
                              child: Stack(children: [
                                TransitionImage(
                                  "https://creditkarma-cms.imgix.net/wp-content/uploads/2018/03/options-huge-vet-bill.jpg",
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(D.default_10),
                                      color: Colors.black.withOpacity(0.7),
                                  ),
                                ),

                              ],
                                  ),
                                ),
                            Container(
                              height: D.default_40,
                              margin:EdgeInsets.only(left:D.default_20,right:D.default_20,top: D.default_10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight:Radius.circular(D.default_10),
                                      topLeft:Radius.circular(D.default_10),
                                  bottomLeft: Radius.circular(D.default_10),
                                      bottomRight: Radius.circular(D.default_10)),
                                  color: Colors.white,
                                  boxShadow:[BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset:Offset(2,0),
                                      blurRadius:2,
                                      spreadRadius:1
                                  )]
                              ),
                              child: Center(child: Text("عيادات طبية",style:S.h4(color: C.BASE_BLUE)),),
                            ),
                          ])),
                  onTap: () {

                  });
            },
            childCount: 5,
            semanticIndexOffset: 1,
          )),

    ]);
  }
}
