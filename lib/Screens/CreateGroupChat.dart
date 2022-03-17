import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/Models/Contact.dart';
import 'package:messenger_app/Widgets/AppBarMessenger.dart';
import 'package:messenger_app/Widgets/CustomTextField.dart';
import 'package:messenger_app/Widgets/ListViewAllContact.dart';

class GroupChat extends StatefulWidget {
  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  CollectionReference contact =
      FirebaseFirestore.instance.collection("contact");
  List<Contact> selectedContact;
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        
          child: Column(
            
            children: [
              AppBarMessenger(),
            SizedBox(
              height: 20,
            ),
            CustomTextField(),
            SizedBox(
              height: 35,
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
