import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/Models/Contact.dart';
import 'package:messenger_app/Models/Message.dart';
import 'package:messenger_app/Providers/RegisterProviders.dart';
import 'package:messenger_app/Widgets/BottomWidget.dart';
import 'package:messenger_app/Widgets/Memessage.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final Contact contact;
  List<Message> message;
  //final String username;
  CollectionReference contacts =
      FirebaseFirestore.instance.collection("contact");
  FirebaseAuth statutUser = FirebaseAuth.instance;
  // DetailsScreen(this.contact);
  DetailsScreen({Key key, @required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>RegisterProviders(),
      child: Scaffold(
        appBar: AppBar(
        //  elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.grey.withOpacity(0.8),
          ),
          title: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(contact.Image
                            //"https://pbs.twimg.com/profile_images/1119734856404090881/jhvo_wO6_400x400.jpg"
                            ))),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //"Next",
                    contact.UserName,
                    //username,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: contacts.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.none) {
                          //return Text(contact.Status);
                          return Text(
                            // "Online",
                            "Offline",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.5)),
                          );
                        }
                        return Text(
                          "Online",
                          //contact.Status,
                          style: TextStyle(
                              fontSize: 12, color: Colors.black.withOpacity(0.5)),
                        );
                      })
                ],
              )
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, int position) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Memessage(
                  isMe: position % 2 == 0,
                ),
              );
            }),
        bottomSheet: BottomWidget(),
      ),
    );
  }
}


