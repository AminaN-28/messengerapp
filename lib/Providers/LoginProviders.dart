import 'package:flutter/material.dart';
import 'package:messenger_app/networkings/Networking.dart';

class LoginProvider extends ChangeNotifier
{
  Networking networkingForimag = new Networking();
  GlobalKey<FormState> keyForm = new GlobalKey<FormState>();
  TextEditingController emailtextEditingController =
      new TextEditingController();
  TextEditingController passwordtextEditingController =
      new TextEditingController();


  notifyListeners();



}