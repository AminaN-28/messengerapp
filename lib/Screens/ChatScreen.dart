import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/Models/Contact.dart';
import 'package:messenger_app/Models/Message.dart';
import 'package:messenger_app/Providers/RegisterProviders.dart';
import 'package:messenger_app/Widgets/BottomWidget.dart';
import 'package:messenger_app/Widgets/Memessage.dart';
import 'package:messenger_app/Widgets/Message.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

   Contact contact;
  List<Message> message;
  //final String username;
  CollectionReference contacts =
      FirebaseFirestore.instance.collection("contact");
      
  //const ChatPage({ Key? key }) : super(key: key);

  // String groupId;
  // String userName;
  // String groupName;

  // ChatPage({this.groupId, this.groupName, this.userName});



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => RegisterProviders(),
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
            
            
              //   width: 40,
              //   height: 40,
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       image: DecorationImage(
              //           image: NetworkImage(contact.Image
              //               "https://pbs.twimg.com/profile_images/1119734856404090881/jhvo_wO6_400x400.jpg"
              //               ))),
              // ),
              // 
               SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Groups",
                    //"Next",
                   // contact.UserName,
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
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.5)),
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
                child: MessageTile(
                  isMe: position % 2 == 0,
                ),
              );
            }),
        bottomSheet: BottomWidget(),
      ),
    );
  }
}



    //  return Consumer<RegisterProviders>(
    //   builder: (_, chatReg, __) {
    //     return Padding(
    //       padding: const EdgeInsets.all(5.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: <Widget>[
    //           Flexible(
    //               child: Container(
    //                   height: size.height,
    //                   width: size.width,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.all(Radius.circular(40))),
    //                   child: Column(
    //                     children: <Widget>[
    //                       Expanded(
    //                           child: StreamBuilder(
    //                               stream: FirebaseFirestore.instance
    //                                   .collection("chat")
    //                                   .doc('groups')
    //                                   .collection("messages")
    //                                   .snapshots(),
    //                               builder: (context,
    //                                   AsyncSnapshot<QuerySnapshot> snapshot) {
    //                                 switch (snapshot.connectionState) {
    //                                   case ConnectionState.none:
    //                                   case ConnectionState.waiting:
    //                                     return Text("Please waiting...");
    //                                   default:
    //                                     if (snapshot.hasData) 
    //                                     {
    //                                       List<Message> message = [];
    //                                       for (int i = 0;
    //                                           i < snapshot.data.docs.length;
    //                                           i++) {
    //                                         Message messageolder = Message(
    //                                             urlAvatar: snapshot.data.docs[i]
    //                                                 ['urlAvatar'],
    //                                             username: snapshot.data.docs[i]
    //                                                 ['username'],
    //                                             message: snapshot.data.docs[i]
    //                                                 ['message'],
    //                                             date: snapshot.data.docs[i]
    //                                                 ['date'],
    //                                             isSender: snapshot.data.docs[i]
    //                                                 ['isSender']);
    //                                         messageolder.date =
    //                                             snapshot.data.docs[i]['date'];
    //                                         messageolder.urlAvatar = snapshot
    //                                             .data.docs[i]['urlAvatar'];
    //                                         messageolder.isSender = snapshot
    //                                             .data.docs[i]['isSender'];
    //                                         messageolder.message = snapshot
    //                                             .data.docs[i]['message'];
    //                                         messageolder.username = snapshot
    //                                             .data.docs[i]['username'];

    //                                         message.add(messageolder);
    //                                       }
    //                                       return ListView.builder(
    //                                           itemCount: message.length,
    //                                           itemBuilder:
    //                                               (BuildContext context,
    //                                                   int index) {
    //                                             if (message[index].isSender) {
    //                                               return SendBubbleMessage(
    //                                                   message: message[index].message,
    //                                                   username: message[index].username,
    //                                                   size: size,
    //                                                   date: message[index].date,
    //                                                   urlAvatar: message[index].urlAvatar

    //                                                   );
    //                                             }
    //                                             else{
    //                                               return ReceiverMessageBubble(
    //                                                   message: message[index].message,
    //                                                   username: message[index].username,
    //                                                   size: size,
    //                                                   date: message[index].date,
    //                                                   urlAvatar: message[index].urlAvatar
    //                                                   );
    //                                             }
    //                                           });
    //                                       // print(chatReg
    //                                       //     .emailtextEditingController.text);
    //                                       // print(chatReg
    //                                       //     .usernametextEditingController
    //                                       //     .text);
    //                                       // return Text("ALFA available");
    //                                     } else {
    //                                       return Text("OMEGA not available");
    //                                     }
    //                                 }
    //                               })),
                          
    //                     ],
    //                   )))
    //         ],
    //       ),
    //     );
    //   },
    // );
  