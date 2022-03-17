import 'package:flutter/material.dart';
import 'package:messenger_app/Screens/ChatScreen.dart';
import 'package:messenger_app/Screens/HomeContact.dart';
import 'package:messenger_app/Screens/HomeMessage.dart';
import 'package:messenger_app/Screens/MessageScreen.dart';
import 'package:messenger_app/Screens/ProfilScreen.dart';
import 'package:messenger_app/Widgets/Memessage.dart';
import 'package:messenger_app/Widgets/Message.dart';

class BottomProvider extends ChangeNotifier {
  int _currentTab = 0;
  //int _currentIndex = 0;

  var _screens = [HomeContact(),MessageScreen(), ChatPage()];

  //get currentIndex => _currentIndex;
  set currentTab(int tab) {
    this._currentTab = tab;
    notifyListeners();
  }

  get currentTab => this._currentTab;
  get currentScreen => this._screens[this._currentTab];
  /*changeSomething(int index) {
    _currentIndex = index;
    notifyListeners();
  }*/
}
