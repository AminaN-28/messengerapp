import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/Models/Contact.dart';
import 'package:messenger_app/Models/Message.dart';
import 'package:messenger_app/Providers/SelectContactForGrProviders.dart';
import 'package:messenger_app/Widgets/AppBarMessenger.dart';
import 'package:messenger_app/Widgets/CircularImageUser.dart';
import 'package:messenger_app/Widgets/CustomTextField.dart';
import 'package:messenger_app/Widgets/ListContactForGroups.dart';
import 'package:messenger_app/Widgets/ListViewAllContact.dart';
import 'package:messenger_app/Widgets/ListViewAllMessage.dart';
import 'package:messenger_app/Widgets/OneRowMessage.dart';
import 'package:provider/provider.dart';

import '../RouteGenerator.dart';
import 'CreateGroupChat.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  //String uid;

  CollectionReference contact =
      FirebaseFirestore.instance.collection("contact");

  //List<Contact> allContact;
  //ListViewAllContact(this.allContact);
  Contact contacts;
  @override
  Widget build(BuildContext context) {
    final _multipleNotifier = Provider.of<SelectProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          AppBarMessenger(),
          SizedBox(
            height: 10,
          ),
          CustomTextField(),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("chat")
                    .doc('amin')
                    .collection("messages")
              
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Text("Please waiting...");
                    default:
                      if (snapshot.hasData) {
                        List<Message> allMessage = [];
                        for (int i = 0; i < snapshot.data.docs.length; i++) {
                          Message messageolder = Message(
                              urlAvatar: snapshot.data.docs[i]['urlAvatar'],
                              username: snapshot.data.docs[i]['username'],
                              message: snapshot.data.docs[i]['message'],
                              date: snapshot.data.docs[i]['date'],
                              isSender: snapshot.data.docs[i]['isSender']);

                          messageolder.date = snapshot.data.docs[i]['date'];
                          messageolder.urlAvatar =
                              snapshot.data.docs[i]['urlAvatar'];
                          messageolder.isSender =
                              snapshot.data.docs[i]['isSender'];
                          messageolder.message =
                              snapshot.data.docs[i]['message'];
                          messageolder.username =
                              snapshot.data.docs[i]['username'];
                          //allMessage.add(Message.fromJson(document.data()));
                          print(allMessage.length);
                          allMessage.add(messageolder);
                          print(allMessage.length);
                        }
                        return ListViewAllMessage(allMessage);
                        // return ListView.builder(
                        //     itemCount: 3,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return
                        //     });
                      } else {
                        return Text("OMEGA not available");
                      }
                  }
                }),
          ),
          Material(
              child: RawMaterialButton(
                onPressed : (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> GroupChat()));
                },
                fillColor: Colors.blueAccent,
                focusColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9.0)),
                  //borderRadius = BorderRadius.zero  
                  ) ,
            child: Text("Create a group",
            
            ),
            
            textStyle: TextStyle(
              color: Colors.white,
              fontFamily: "Times",
              fontWeight: FontWeight.bold,
              // background: Colors.blueAccent,
            ),
            )
          )
        ]),
      )
      //RawMaterialButton(onPressed: () {})
      ,
    );
  }
}

//Navigator.pushNamed(context, RouteGenerator.allContactScreen);
//     Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => ListContactForGroups()));
//  // ListContactForGroups;

// StreamBuilder<QuerySnapshot>(
//   stream: FirebaseFirestore.instance
//       .collection("contact")
//       .snapshots(),
//   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot)
//   {
//     return ListView.builder(
//       itemCount: snapshot.data.docs.length,
//       itemBuilder: (context, index){

//         return  ListTile(
//           leading: CircleAvatar(
//             backgroundImage: snapshot.data.docs[0]['image'],),
//             title: snapshot.data.docs[0]['userName'],
//             subtitle: snapshot.data.docs[0]['email']
//         );

//     });

//   },
// // ),
// onPressed: () {
//               return Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 child: Container(
//                   child:
//                       //EdgeInsetsGeometry (const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0)),
//                       //contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
//                       //contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
//                       //content :ListViewAllContact(allContact),
//                       Column(
//                     children: [
//                       Expanded(
//                         child: StreamBuilder(
//                           stream: contact.snapshots(),
//                           builder: (context, snapshot) {
//                             List<Contact> allContact = [];
//                             for (var document in snapshot.data.docs) {
//                               print("ALLALLALALLALLA");
//                               print(document.data().toString());

//                               contacts = new Contact(
//                                   document.data()['uid'],
//                                   document.data()['email'],
//                                   document.data()['userName'],
//                                   document.data()['image'],
//                                   document.data()['statut'],
//                                   document.data()['message'],
//                                   document.data()['lastMessageTime'],
//                                   document.data()['isChoosen']);

//                               print(contacts.Email);
//                               allContact.add(contacts);
//                               print(allContact.length);
//                             }
//                             // return ListcontactForGroups(allContact);
//                             return ListView.builder(
//                                 itemCount: allContact.length,
//                                 itemBuilder: (context, index) {
//                                   return ListTile(
//                                     leading: CircularImageUser(
//                                       urlImage: allContact[index].image,
//                                       radius: 35,
//                                     ),
//                                     title: Text(allContact[index].userName),
//                                     subtitle: Text(allContact[index].email),
//                                   );
//                                 });

//                             //return Text("data");
//                           },
//                         ),
//                       ),
                      
//                     ],
//                   ),
//                   // content: new Text("Hello World"),
//                 ),
//               );
//             },
          