import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/Providers/RegisterProviders.dart';
import 'package:messenger_app/Widgets/ImagePickerWidget.dart';
import 'package:messenger_app/networkings/Networking.dart';
import 'package:provider/provider.dart';

import '../RouteGenerator.dart';

class BottomWidget extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController messageController = TextEditingController();
  //UserCredential user;
  String uid;
  String date;
  String message = '';

  // void sendinGMessage() async {
  //   await Networking.uploadMessage(uid, message);
  //   //messageController.clear();
  // }

  @override
  Widget build(BuildContext context) {
    //FirebaseAuth.instance.
    //date = DateTime.now().toIso8601String().toString();
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width) / 1,
            child: Row(
              children: <Widget>[
                Consumer<RegisterProviders>(
                  builder: (_, registerProvider, __) {
                    return GestureDetector(
                      onTap: () {
                        registerProvider.getNewImagePicker(context: context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: messageController,
                    onChanged: (value) => messageController.text,
                    decoration: InputDecoration(
                        hintText: "Say Something...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Consumer<RegisterProviders>(
                  builder: (_, registerProvider, __) {
                    return FloatingActionButton(
                      onPressed: () async {
                        message = messageController.text;
                        print(message);
                        await Networking.sendMessage(
                            userName: registerProvider
                                .usernametextEditingController.text,
                            email: registerProvider
                                .emailtextEditingController.text,
                            context: context,
                            isImage: false);

                        messageController.clear();
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: Colors.blue,
                      //elevation: 0,
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
// return Container(
//         height: 80,
//         width: double.infinity,
//         decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Container(
//               width: (MediaQuery.of(context).size.width) / 1,
//               child: Row(
//                 children: <Widget>[
//                   Consumer<RegisterProviders>(
//                     builder: (context, registerProvider, __) {
//                       return Container
//                       (
//                         child: Column(
                          
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 //  Navigator.pushNamed(
//                                 //  context, RouteGenerator.imageScreen);
//                                 registerProvider.getNewImagePicker(
//                                     context: context);
//                                 //ImagePIckerWiget();
//                               },
//                               child: Container(
//                                 height: 40,
//                                 width: 40,
//                                 decoration: BoxDecoration(
//                                   color: Colors.lightBlue,
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 child: Icon(
//                                   Icons.add,
//                                   color: Colors.white,
//                                   size: 20,
//                                 ),
//                               ),
//                             )
//                             ]));
//                             }),
                           
                           
//                             SizedBox(
//                               width: 15,
//                             ),
//                             Expanded(
                              
//                               child: SizedBox(
//                                 height :300.0,
//                                 child: TextField(
                                  
//                                   controller: messageController,
//                                   onChanged: (value) => messageController.text,
//                                   decoration: InputDecoration(
//                                       hintText: "Say Something...",
//                                       hintStyle: TextStyle(color: Colors.black54),
//                                       border: InputBorder.none),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 15,
//                             ),
//                             FloatingActionButton(
//                               onPressed: () async {
//                                 message = messageController.text;

//                                 // await Networking.sendMessage(
//                                 //     userName: registerProvider
//                                 //         .usernametextEditingController.text,
//                                 //     email: registerProvider
//                                 //         .emailtextEditingController.text,
//                                 //     context: context,
//                                 //     isImage: false);

//                                 messageController.clear();
//                               },
//                               child: Icon(
//                                 Icons.send,
//                                 color: Colors.white,
//                                 size: 18,
//                               ),
//                               backgroundColor: Colors.blue,
//                               //elevation: 0,
//                             ),
//                           ],
//                         ),
//                       );
//                      },
//               )
//                 ],
//               ),
//             );
        
        