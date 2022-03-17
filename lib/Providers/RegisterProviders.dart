import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messenger_app/Models/Contact.dart';
import 'package:messenger_app/Models/Message.dart';
import 'package:messenger_app/Screens/AfterImagePickerScrren.dart';

class RegisterProviders extends ChangeNotifier {
  PickedFile pickedfile;
  ImagePicker imagePicker = new ImagePicker();

  GlobalKey<FormState> keyForm = new GlobalKey<FormState>();

  TextEditingController emailtextEditingController =
      new TextEditingController();
  TextEditingController usernametextEditingController =
      new TextEditingController();
  TextEditingController passwordtextEditingController =
      new TextEditingController();

  TextEditingController messagetextEditingController =
      new TextEditingController();

  File imagePath;

  File get filePath => imagePath;

  // getAnImage() {
  //   return image;
  // }

  List<Message> _messageList = [];

  List<Message> get messageListe => _messageList;

  TextEditingController get message => messagetextEditingController;
  FirebaseFirestore firebaseFirestore;

  // getFile() {
  //   return pickedfile;
  // }

  getNewImage() async {
    //File image;

    pickedfile = await imagePicker.getImage(source: ImageSource.gallery);

    if (pickedfile != null) {
      imagePath = File(pickedfile.path);
    } else {
      print("No Image Selected");
    }
    notifyListeners();
    //var upload= await FirebaseStorage.instance.ref("images/").putFile(file);
  }

  getNewImagePicker({@required BuildContext context}) async {
    // ignore: unused_local_variable
    pickedfile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      imagePath = File(pickedfile.path);

      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return AfterImagePickerScreen();
      }));
    } else {
      print("No Image Selected");
    }

    notifyListeners();
  }

  //notifyListeners();
}
