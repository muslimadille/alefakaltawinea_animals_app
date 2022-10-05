import 'package:alefakaltawinea_animals_app/utils/my_utils/baseTextStyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/my_utils/baseDimentions.dart';
import '../../utils/my_utils/constants.dart';
import '../../utils/my_utils/myColors.dart';
import '../../utils/my_utils/myUtils.dart';
import '../../utils/my_widgets/transition_image.dart';
import '../baseScreen/baseScreen.dart';
import '../cart/add_cart_screen.dart';
import '../categories_screen/mainCategoriesScreen.dart';

class IntroWizardScreen extends StatefulWidget {
  const IntroWizardScreen({Key? key}) : super(key: key);

  @override
  State<IntroWizardScreen> createState() => _IntroWizardScreenState();
}

class _IntroWizardScreenState extends State<IntroWizardScreen> {
  final _controller = PageController();
  int _currentSliderPager=0;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
