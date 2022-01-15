
import 'package:flutter/cupertino.dart';
import 'package:flutter_intro/flutter_intro.dart';

class IntroProviderModel with ChangeNotifier {
  Intro? intro;
  setIntro(Intro introModel){
    intro=introModel;
    notifyListeners();
  }
}