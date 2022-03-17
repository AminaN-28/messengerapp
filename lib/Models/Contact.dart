import 'package:flutter/material.dart';
import 'package:messenger_app/Models/Message.dart';

class ContactField {
  static final String lastMessageTime = 'lastMessageTime';
}

class Contact {
  String uid;
  String email;
  String userName;
  String image;
  String statut = "offline";
  String message = "";
  DateTime lastMessageTime;
  bool isChoosen;

  //Contact(this.email, this.userName, this.isChoosen);

  Contact(this.uid, this.email, this.userName, this.image, this.statut,
      this.message, this.lastMessageTime, this.isChoosen);

  String get UserName {
    return this.userName;
  }

  String get Email {
    return this.email;
  }

  String get Image {
    return this.image;
  }

  String get Status {
    return this.statut;
  }

  String get Message {
    return this.message;
  }

  Contact.fromMap(dynamic obj) {
    uid = obj["uid"];
    email = obj["email"];
    userName = obj["userName"];
    image = obj["image"];
    statut = obj["statut"];
    message = obj["message"];

    lastMessageTime = obj["lastMessageTime"];

    //lastMessageTime = Utils.to obj["lastMessageTime"]
    // Utils.toDateTime(json['lastMessageTime']);

    // message = obj["message"];
  }
}
