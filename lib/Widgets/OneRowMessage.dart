import 'package:flutter/material.dart';
import 'package:messenger_app/Models/Contact.dart';
import 'package:messenger_app/Models/Message.dart';
import 'package:messenger_app/networkings/data.dart';

import 'CircularImageUser.dart';

class OneRowMessage extends StatelessWidget {
  Message message;
  //Contact contact;
  // final String messageU;
  // final String username;

  OneRowMessage(this.message);
  //OneRowMessage(this.contact);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CircularImageUser(urlImage: message.urlAvatar, radius: 60),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.username,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 115,
                child: Text(
                  message.message, //message.message
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
