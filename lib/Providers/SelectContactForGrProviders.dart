import 'package:flutter/material.dart';

class SelectProvider extends ChangeNotifier{
  List<String> _selecteItems;
  SelectProvider(this._selecteItems);
  List<String> get selectedItems => _selecteItems;

  bool isHaveItem(String value) => _selecteItems.contains(value);

  addItem(String value) {
    if (!isHaveItem(value)) {
      _selecteItems.add(value);
      notifyListeners();
    }
  }

  removeItem(String value) {
    if (isHaveItem(value)) {
      _selecteItems.remove(value);
      notifyListeners();
    }
  }



}