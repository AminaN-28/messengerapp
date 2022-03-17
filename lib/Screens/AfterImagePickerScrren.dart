import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_platform_interface/src/types/picked_file/unsupported.dart';
import 'package:messenger_app/Models/Contact.dart';
import 'package:messenger_app/Providers/RegisterProviders.dart';
import 'package:messenger_app/networkings/Networking.dart';
import 'package:messenger_app/networkings/data.dart';
import 'package:provider/provider.dart';

class AfterImagePickerScreen extends StatelessWidget {
  //AfterImagePickerScreen({Key key}) : super(key: key);
  TextEditingController commentController;

  Contact contact;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // var picked = Provider<Registers>.of(context, listen: false);
    return Consumer<RegisterProviders>(
      builder: (_, model, __) 
      {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
              //alignment: Alignment.center,
              children: <Widget>[
                Container(
                    height: size.height,
                    width: size.width,
                    //alignment: Alignment.center,
                    child: model.filePath != null
                        ? 
                        // Text(model.filePath.toString())
                        Image.file(
                          model.filePath,
                           height: size.height,
                           width: size.width
                         
                          )
                        :
                          CircleAvatar(
                            radius: 50,
                            child: Icon(
                              Icons.image,
                              size: 50,
                            )
                        )
                          ),
                Positioned(
                  top: 0.0,
                  child: Material(
                    color: Colors.black,
                    elevation: 6.0,
                    //shadowColor: Colors.white,
                    child: Container(
                      width: size.width,
                      padding: EdgeInsets.only(
                          top: size.height * 0.007,
                          bottom: size.height * 0.011),
                      color: Colors.black,
                      child: Row(
                        children: [
                          IconButton(
                              color: Colors.white,
                              iconSize: size.height * 0.035,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back)),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          CircleAvatar(
                              radius: size.height * 0.022,
                              backgroundImage: NetworkImage(data
                                  .myUrlAvatar) //"https://pbs.twimg.com/profile_images/1119734856404090881/jhvo_wO6_400x400.jpg"),
                              ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Text(data.myUsername,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: size.height * 0.023,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0.0,
                    child: Material(
                      color: Colors.white,
                      elevation: 5.0,
                      shadowColor: Colors.white,
                      child: Container(
                        //decoration: ,
                        padding: EdgeInsets.only(
                          top: size.height * 0.011,
                          bottom: size.height * 0.005,
                        ),
                        color: Colors.black,
                        width: size.width,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Expanded(
                              child: TextField(
                                // textInputAction: TextInputAction.done,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                                textAlign: TextAlign.center,
                                controller: model.message,
                                onChanged: (value) => commentController.text,
                                decoration: InputDecoration(
                                    //contentPadding: EdgeInsets.symmetric(vertical: size.height*0.014),
                                    hintText: "Add a comment...",
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: size.height * 0.018,
                                      
                                    ),

                                    //enabledBorder: InputBorder.none,
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            // Consumer<RegisterProviders>(
                            //   builder: (context, model, _) {
                             FloatingActionButton(
                                  splashColor: Colors.white.withOpacity(0.2),
                                  onPressed: () async {
                                    await Networking.sendMessage(
                                        userName: model
                                            .usernametextEditingController.text,
                                        email: model
                                            .emailtextEditingController.text,
                                        context: context,
                                        isImage: true);

                                    //messageController.clear();
                                  },
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  backgroundColor: Colors.blue,
                                  //elevation: ,
                                )
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    )),
              ]),
        ),
      );
    });
  }
}
