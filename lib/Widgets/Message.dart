import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/Models/Message.dart';
import 'package:messenger_app/Providers/RegisterProviders.dart';
import 'package:messenger_app/Screens/CreateGroupChat.dart';
import 'package:provider/provider.dart';

import 'AppBarMessenger.dart';
import 'BubbleMessage.dart';
import 'BubbleMessageReceiver.dart';
import 'CustomTextField.dart';
import 'ListViewAllMessage.dart';

class MessageTile extends StatefulWidget {
  // String message;
  // String sender;
  // bool ByMe;

  bool isMe;
  Message message;
  final String uid;

  MessageTile({@required this.isMe, this.message, this.uid});

  // MessageTile({this.message, this.sender, this.ByMe});
  //const MessageTile({ Key key }) : super(key: key);

  @override
  _MessageTileState createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                                      .doc('groups')
                                      .collection("messagesGroups")
                                      .snapshots(),
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.none:
                                      case ConnectionState.waiting:
                                        return Text("Please waiting...");
                                      default:
                                        if (snapshot.hasData) {
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
                                                      message: message[index]
                                                          .message,
                                                      username: message[index]
                                                          .username,
                                                      size: size,
                                                      date: message[index].date,
                                                      urlAvatar: message[index]
                                                          .urlAvatar);
                                                } else {
                                                  return ReceiverMessageBubble(
                                                      message: message[index]
                                                          .message,
                                                      username: message[index]
                                                          .username,
                                                      size: size,
                                                      date: message[index].date,
                                                      urlAvatar: message[index]
                                                          .urlAvatar);
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
