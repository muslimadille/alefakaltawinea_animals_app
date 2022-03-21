import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseDimentions.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/constants.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myColors.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/myUtils.dart';
import 'package:alefakaltawinea_animals_app/utils/my_utils/providers.dart';
import 'package:alefakaltawinea_animals_app/utils/my_widgets/action_bar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TermsScreen extends StatefulWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BaseScreen(
        showSettings: false,
        showBottomBar: true,
        tag: "TermsScreen",
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActionBarWidget(tr("Terms_and_Conditions"), context),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(D.default_20),
                  child: Text(tr("Terms_and_Conditions"),style: S.h4(color: Colors.grey[400]),),),
              )
            ],
          ),
        ),
      ),
    ],);
  }

}
