import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/Models/Contact.dart';
import 'package:messenger_app/Models/Message.dart';
import 'package:messenger_app/Providers/RegisterProviders.dart';
import 'package:messenger_app/Widgets/BubbleMessageReceiver.dart';
import 'package:messenger_app/Widgets/FormWidget.dart';
import 'package:messenger_app/networkings/Networking.dart';
import 'package:provider/provider.dart';

import 'BubbleMessage.dart';

class Memessage extends StatelessWidget {
  bool isMe;
  Message message;
  final String uid;

  Memessage({@required this.isMe, this.message, this.uid});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //FormWidget any;

    return Consumer<RegisterProviders>(
      builder: (_, chatReg, __) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                  child: Container(
                      height: size.height,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection("chat")
                                      .doc('amin')
                                      .collection("messages")
                                      .snapshots(),
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.none:
                                      case ConnectionState.waiting:
                                        return Text("Please waiting...");
                                      default:
                                        if (snapshot.hasData) 
                                        {
                                          List<Message> message = [];
                                          for (int i = 0;
                                              i < snapshot.data.docs.length;
                                              i++) {
                                            Message messageolder = Message(
                                                urlAvatar: snapshot.data.docs[i]
                                                    ['urlAvatar'],
                                                username: snapshot.data.docs[i]
                                                    ['username'],
                                                message: snapshot.data.docs[i]
                                                    ['message'],
                                                date: snapshot.data.docs[i]
                                                    ['date'],
                                                isSender: snapshot.data.docs[i]
                                                    ['isSender']);
                                            messageolder.date =
                                                snapshot.data.docs[i]['date'];
                                            messageolder.urlAvatar = snapshot
                                                .data.docs[i]['urlAvatar'];
                                            messageolder.isSender = snapshot
                                                .data.docs[i]['isSender'];
                                            messageolder.message = snapshot
                                                .data.docs[i]['message'];
                                            messageolder.username = snapshot
                                                .data.docs[i]['username'];

                                            message.add(messageolder);
                                          }
                                          return ListView.builder(
                                              itemCount: message.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                if (message[index].isSender) {
                                                  return SendBubbleMessage(
                                                      message: message[index].message,
                                                      username: message[index].username,
                                                      size: size,
                                                      date: message[index].date,
                                                      urlAvatar: message[index].urlAvatar

                                                      );
                                                }
                                                else{
                                                  return ReceiverMessageBubble(
                                                      message: message[index].message,
                                                      username: message[index].username,
                                                      size: size,
                                                      date: message[index].date,
                                                      urlAvatar: message[index].urlAvatar
                                                      );
                                                }
                                              });
                                          // print(chatReg
                                          //     .emailtextEditingController.text);
                                          // print(chatReg
                                          //     .usernametextEditingController
                                          //     .text);
                                          // return Text("ALFA available");
                                        } else {
                                          return Text("OMEGA not available");
                                        }
                                    }
                                  })),
                          // SendBubbleMessage(
                          //   message: 'Hello World',
                          //   username: 'Amina',
                          //   size: size,
                          //   date: '280320',
                          //   urlAvatar: 'https://pbs.twimg.com/profile_images/1119734856404090881/jhvo_wO6_400x400.jpg',
                          // ),
                          // ReceiverMessageBubble(
                          //   message: 'Hello World',
                          //   username: 'Amina',
                          //   size: size,
                          //   date: '280320',
                          //   urlAvatar: 'https://pbs.twimg.com/profile_images/1119734856404090881/jhvo_wO6_400x400.jpg',
                          // ),
                        ],
                      )))
            ],
          ),
        );
      },
    );
  }
}


// if (snapshot.connectionState ==
                        //     ConnectionState.waiting) {
                        //   return CircularProgressIndicator();
                        // }

                        // if (snapshot.hasData) {
                        //   return ListView.builder(
                        //       itemCount: snapshot.data.docs[0]['message'],
                        //       itemBuilder: (context, index) {
                               
                        //       });
 // if (snapshot.connectionState ==
                        //     ConnectionState.waiting) {
                        //   return CircularProgressIndicator();
                        // }
                        // return Text(snapshot.data.docs[0]['message'],
                        //     style:
                        //         TextStyle(color: Colors.black, fontSize: 20));








//                         import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:messenger_app/Models/Contact.dart';
// import 'package:messenger_app/Models/Message.dart';
// import 'package:messenger_app/networkings/Networking.dart';

// import 'BubbleMessage.dart';

// class Memessage extends StatelessWidget {
//   bool isMe;
//   Message message;
//   final String uid;

//   Memessage({@required this.isMe, this.message, this.uid});

 

//   @override
//   Widget build(BuildContext context) {
//      Size size = MediaQuery.of(context).size;
//     if (isMe) {
//       return Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             Flexible(
//               child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.all(Radius.circular(40))),
//                   child: Padding(
//                       padding: const EdgeInsets.all(3.0),
//                       child: StreamBuilder<QuerySnapshot>(
//                           stream: FirebaseFirestore.instance
//                               .collection("message")
//                               .snapshots(),
//                           builder: (context, snapshot) {
//                             return Text(
//                               "Flutter is Better than",
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 20),
//                             );

//                             // return Text(snapshot.data.docs[0]['message'],
//                             //     style:
//                             //         TextStyle(color: Colors.black, fontSize: 20));
//                           }
//                           //  return Center(child: Text("Say hello"));
//                           ))),
//             ),
//           ],
//         ),
//       );
//     } else {
//       return Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Flexible(
//                 child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.tealAccent,
//                         borderRadius: BorderRadius.all(Radius.circular(40))),
//                     child: BubbleMessage(
//                       date: '',
//                       message: '',
//                       size: size.height,
//                       username: '',
//                     )
//                     //  Padding(
//                     //     padding: const EdgeInsets.all(3.0),
//                     //     child: StreamBuilder<QuerySnapshot>(
//                     //         stream: FirebaseFirestore.instance
//                     //             .collection("message")
//                     //             .snapshots(),
//                     //         builder: (context, snapshot) {

//                     //         return Text("snapshot.data",
//                     //           style: TextStyle(color: Colors.black, fontSize: 20),
//                     //         );
//                     //         }

//                     //         )),
//                     ))
//           ],
//         ),
//       );
//     }
//   }
// }


// if (snapshot.connectionState ==
                        //     ConnectionState.waiting) {
                        //   return CircularProgressIndicator();
                        // }

                        // if (snapshot.hasData) {
                        //   return ListView.builder(
                        //       itemCount: snapshot.data.docs[0]['message'],
                        //       itemBuilder: (context, index) {
                               
                        //       });
 // if (snapshot.connectionState ==
                        //     ConnectionState.waiting) {
                        //   return CircularProgressIndicator();
                        // }
                        // return Text(snapshot.data.docs[0]['message'],
                        //     style:
                        //         TextStyle(color: Colors.black, fontSize: 20));