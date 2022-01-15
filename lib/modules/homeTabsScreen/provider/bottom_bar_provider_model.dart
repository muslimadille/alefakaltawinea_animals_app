import 'package:flutter/cupertino.dart';

class BottomBarProviderModel with ChangeNotifier {
  int? selectedScreen=0;
  setSelectedScreen(int value){
    selectedScreen=value;
    notifyListeners();
  }
}