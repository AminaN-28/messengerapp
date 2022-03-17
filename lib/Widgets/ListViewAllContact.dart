import 'package:flutter/material.dart';
import 'package:messenger_app/Models/Contact.dart';
import 'package:messenger_app/Screens/DetailScreen.dart';

import '../RouteGenerator.dart';
import 'OneRowContactMessage.dart';

// ignore: must_be_immutable
class ListViewAllContact extends StatelessWidget {
  List<Contact> allContact;
  ListViewAllContact(this.allContact);
  //Contact contact;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children :[ 
            //Text(contact.UserName),
            GestureDetector(
              onTap: () {
               // Navigator.pushNamed(context, RouteGenerator.detailScreen);
                
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(contact: allContact[index])));
              },
              child: OneRowContactMessage(allContact[index])
              ),
          ]
        );
      },
      itemCount: allContact.length,
    );
  }
}



//lecture ou affichage des datas de la bd mais pas en temps reel
//To read a collection or document once, call the Query.get or DocumentReference.get methods
   // CollectionReference users = FirebaseFirestore.instance.collection("users");

//lecture ou affichage a temps reel des datas de la bd
    // Stream collectionStream =
    //FirebaseFirestore.instance.collection('users').snapshots();


