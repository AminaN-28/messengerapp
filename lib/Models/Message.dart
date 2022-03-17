import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Message {
   String message;
   String urlAvatar;
   String username;
  bool isSender;
   String date;

   Message({
    @required this.urlAvatar,
    @required this.username,
    @required this.message,
    @required this.date,
    @required this.isSender,
  });

}
