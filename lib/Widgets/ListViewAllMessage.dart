import 'package:flutter/material.dart';
import 'package:messenger_app/Models/Contact.dart';
import 'package:messenger_app/Models/Message.dart' as message;
import 'package:messenger_app/Screens/DetailScreen.dart';
import 'package:messenger_app/Widgets/OneRowMessage.dart';

import '../RouteGenerator.dart';

class ListViewAllMessage extends StatelessWidget {
  //List<Message> allmessage;
  List<Contact> allcontact;
  //List<Message> allMessage;

  List<message.Message> allMessage;

  ListViewAllMessage(this.allMessage);

  //ListViewAllMessage(this.allMessage);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            GestureDetector(
                onTap: () {
                  //   Navigator.pushNamed(context, RouteGenerator.detailScreen);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(contact: allcontact[index])));
                },
                child: OneRowMessage(allMessage[index])
                ),
          ],
        );
      },
      itemCount: allMessage.length,
    );
  }
}
