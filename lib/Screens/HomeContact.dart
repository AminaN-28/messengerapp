import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/Models/Contact.dart';
import 'package:messenger_app/Widgets/AppBarMessenger.dart';
import 'package:messenger_app/Widgets/CustomTextField.dart';
import 'package:messenger_app/Widgets/ListViewAllContact.dart';

class HomeContact extends StatefulWidget {
  @override
  _HomeContactState createState() => _HomeContactState();
}
class _HomeContactState extends State<HomeContact> {
  CollectionReference contact =
      FirebaseFirestore.instance.collection("contact");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AppBarMessenger(),
                SizedBox(
                    height: 10,
                  ),
                  CustomTextField(),
                  SizedBox(
                    height: 30,
                  ),
                Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: contact.snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Text("Loading");
                          }
        
                          List<Contact> allContact = [];
                          for (var document in snapshot.data.docs) {
                            allContact.add(Contact.fromMap(document.data()));
                          }
                          return ListViewAllContact(allContact);
                })),
              ],
            ),
          ),
        );
  }
}
