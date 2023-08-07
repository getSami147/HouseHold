import 'package:flutter/cupertino.dart';

class FavorateServiceProvider with ChangeNotifier {
  List<int> _selecteItems = [];
  List<int> get selecteItems => _selecteItems;

  void setAddFavourate(int selectedValue) {
    _selecteItems.add(selectedValue);
    notifyListeners();
  }

  void setRemoveFavourate(int selectedValue) {
    _selecteItems.remove(selectedValue);
    notifyListeners();
  }
}
