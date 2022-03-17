import 'package:flutter/material.dart';
import 'package:messenger_app/Models/Contact.dart';
import 'package:messenger_app/Widgets/ImagePickerWidget.dart';
import 'package:messenger_app/Widgets/ListContactForGroups.dart';

import 'Screens/DetailScreen.dart';
import 'Screens/HomeMessage.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/RegisterScreen.dart';

class RouteGenerator {
  //static Contact contact;
  static const String registerScreen = "/";
  static const String imageScreen = "/imageScreen";
//static const String loginScreen = "/loginScreen";
  static const String homeScreen = "/homeScreen";
  static const String detailScreen = "/detailScreen";
  static const String allContactScreen = "/allContactScreen";
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    switch (settings.name) {
      case registerScreen:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      //case loginScreen:
      // return MaterialPageRoute(builder: (context) => LoginScreen());
      
      case homeScreen:
        return MaterialPageRoute(builder: (context) => HomeMessage());
      // case detailScreen:
      //   {
      //     // Contact contact = settings.arguments;
      //     // return MaterialPageRoute(
      //     //   builder: (context) => DetailsScreen(contact: contact),
      //     //   //builder: (context) => DetailsScreen(contact),
      //     //   //settings: RouteSettings(arguments: contact)
      //     //   );
      //   }
      case imageScreen:
        return MaterialPageRoute(builder: (context) => ImagePIckerWiget());
     
      // case allContactScreen:
      //   return MaterialPageRoute(builder: (context) => ListContactForGroups(contact: contact,));

      default:
        {
          return MaterialPageRoute(builder: (context) => null);
        }
    }
  }
}
