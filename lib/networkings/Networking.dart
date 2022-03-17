import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebaseStorage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messenger_app/Models/Contact.dart';
import 'package:messenger_app/Models/Message.dart';
import 'package:messenger_app/Providers/RegisterProviders.dart';
import 'package:messenger_app/networkings/data.dart';
import 'package:messenger_app/utils/utils.dart';

class Networking {
  String uid;

  Networking({this.uid});

  static Future<int> registerwithEmailAndPassword(
      String email, String password) async {
    //creer une instance de FirebaseAuth
    FirebaseAuth auth = FirebaseAuth.instance;
    //FirebaseAuth auth = authcast.FirebaseAuth.instance;
    UserCredential user = (await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password));
    print(user.toString());
    if (user == null) {
      return 0;
    } else {
      return 1;
    }
  }

  //se connecter avec email et password
  static Future<int> signWithEmailAndPassword(
      String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
        email: email, //amina@gmail.com
        password: password, //Amina2803
      );
      if (user == null) {
        return 0;
      } else {
        return 1;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  static Future<void> saveUserToDatabase(
      String email, String username, String password, PickedFile file) async {
    //File fileName = File(file.path);
    var timekey = DateTime.now();

    // String urlimg; // url de l'image

    FirebaseAuth auth = FirebaseAuth.instance;

    //donner un id a l'utilisateur courrant et convertir en string(mm chose que sur android)
    String uid = auth.currentUser.uid.toString();

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference firebaseFirestore = firestore.collection("users");

    firebaseStorage.FirebaseStorage storage =
        firebaseStorage.FirebaseStorage.instance;

    firebaseStorage.Reference ref = storage.ref().child("images/");

//reutilise pour voir si ca marche  si ca marche pas
//reprendre premier code fait avec la documentation
    UploadTask uploadTasks =
        ref.child(timekey.toString() + ".jpg").putFile(File(file.path));

    print("Successfully Uploaded");

    var uploadUrl = await (await uploadTasks).ref.getDownloadURL();

    String imageUrl = uploadUrl.toString();

    // Call the user's CollectionReference to add a new user
    return firebaseFirestore
        .add({
          'email': email, // amina@gmail.com
          'password': password, // Amina2803
          'image': imageUrl, // image
          'uid': uid, //currentUser id
          'userName': username, // nom d'utilisateur
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future<void> saveUserToDatabaseContact(String email, String username,
      String statut, String message, PickedFile file) async {
    //File fileName = File(file.path);
    var timekey = DateTime.now();

    //String urlimg; // url de l'image

    FirebaseAuth auth = FirebaseAuth.instance;

    //donner un id a l'utilisateur courrant et convertir en string(mm chose que sur android)
    String uid = auth.currentUser.uid.toString();

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference firebaseFirestore = firestore.collection("contact");

    firebaseStorage.FirebaseStorage storage =
        firebaseStorage.FirebaseStorage.instance;

    firebaseStorage.Reference ref = storage.ref().child("Photos/");

//reutilise pour voir si ca marche  si ca marche pas
//reprendre premier code fait avec la documentation
    UploadTask uploadTasks =
        ref.child(timekey.toString() + ".jpg").putFile(File(file.path));

    print("Successfully Uploaded");

    var uploadUrl = await (await uploadTasks).ref.getDownloadURL();

    String imageUrl = uploadUrl.toString();

    // Call the user's CollectionReference to add a new user
    return firebaseFirestore
        .doc(email)
        .set({
          'email': email, // amina@gmail.com
          'statut': statut, // Amina2803
          'image': imageUrl, // image
          'uid': uid, //currentUser id
          'userName': username, // nom d'utilisateur
          'message': message,
          'groups': []
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future<void> imageMessage(
      {@required String userName,
      @required String email,
      @required BuildContext context,
      @required bool isImage}) async {
    var timekey = DateTime.now();
    //PickedFile file;
    RegisterProviders registerProviders;
    firebaseStorage.FirebaseStorage storage =
        firebaseStorage.FirebaseStorage.instance;

    firebaseStorage.Reference ref = storage.ref().child("Photos/");

    var imagestat = await storage
        .ref()
        .child("Photos/")
        .putFile(File(registerProviders.pickedfile.path)) //
        .then((value) => value);

    String imageUrl = await imagestat.ref.getDownloadURL();

    Map<String, dynamic> storesms = {
      'username': userName,
      'date': DateTime.now().toIso8601String().toString(),
      'message': registerProviders.messagetextEditingController.text,
      'isSender': true,
      'url': '$imageUrl',
    };

    await FirebaseFirestore.instance
        .collection("chat")
        .doc("amin")
        .collection("messages")
        .add(storesms)
        .then((value) {
      FirebaseFirestore.instance
          .collection("chat")
          .doc("amin")
          .set({'Yummy': 'yummy'}).then((value) {
        registerProviders.messagetextEditingController.clear();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent[300],
          duration: Duration(milliseconds: 1000),
          content: Text("Message sent"),
        ));
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.pop(context);
      });
    });
  }

  static Future<void> sendMessage(
      {@required String userName,
      @required String email,
      @required BuildContext context,
      @required bool isImage}) async {
    if (isImage) {
      imageMessage(
          userName: userName, email: email, context: context, isImage: isImage);
    } else {
      textSendMessage(
          userName: userName, email: email, context: context, isImage: isImage);
    }
  }

  static Future<void> textSendMessage(
      {@required String userName,
      @required String email,
      @required BuildContext context,
      @required bool isImage}) async {
    RegisterProviders registerProvider;
    String message;
    Map<String, dynamic> storesms = {
      'username': userName,
      'date': DateTime.now().toIso8601String().toString(),
      'message': message,
      'isSender': true,
      'url': '',
    };

    await FirebaseFirestore.instance
        .collection("chat")
        .doc("amin")
        .collection("messages")
        .add(storesms)
        .then((value) {
      FirebaseFirestore.instance
          .collection("chat")
          .doc("amin")
          .set({'Yummy': 'yummy'}).then((value) {
        registerProvider.messagetextEditingController.clear();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent[300],
          duration: Duration(milliseconds: 1000),
          content: Text("Message sent"),
        ));
      });
    });
  }

//***********************GROUPES************************ *//
  Future<void> creategroupUsers(String userName, String groupName) async {
    CollectionReference groupCollection =
        FirebaseFirestore.instance.collection("groups");

    DocumentReference groupDoc = await groupCollection.add({
      'groupName': groupName,
      'groupIcon': '',
      'admin': userName,
      'members': [],
      //'messages': ,
      'groupId': '',
      'recentMessage': '',
      'recentMessengerSender': ''
    });

    await groupDoc.update({
      'members': FieldValue.arrayUnion([uid + '_' + userName]),
      'groupId': groupDoc.id,
    });

    DocumentReference userDocRef =
        FirebaseFirestore.instance.collection("contact").doc(uid);
    return await userDocRef.update({
      'groups': FieldValue.arrayUnion([groupDoc.id + '_' + groupName])
    });
  }

  getUsersGroups() async {
    return FirebaseFirestore.instance
        .collection("contact")
        .doc(uid)
        .snapshots();
  }

  sendingMessagesGroup(String groupId, chatmessage) {
    FirebaseFirestore.instance
        .collection('groups')
        .doc(groupId)
        .collection('messages')
        .add(chatmessage);

    FirebaseFirestore.instance.collection('groups').doc(groupId).update({
      'recentMessage': chatmessage['message'],
      'recentMessageSender': chatmessage['sender'],
      'recentMessageTime': chatmessage['time'].toString(),
    });
  }

  getChatsForGroups(String groupId) async {
    return FirebaseFirestore.instance
        .collection('groups')
        .doc(groupId)
        .collection('messages')
        .orderBy('time')
        .snapshots();
  }

  searchGroups(String groupName) {
    return FirebaseFirestore.instance
        .collection("groups")
        .where('groupName', isEqualTo: groupName)
        .get();
  }

  getUsersGroup() async {
    return FirebaseFirestore.instance
        .collection('contact')
        .doc(uid)
        .snapshots();
  }

  static Future<int> login() {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  static Future<int> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}







  // static Future<void> messagedb(String message, String date) async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;

  //   CollectionReference firebaseFirestore = firestore.collection("message");

  //   FirebaseAuth auth = FirebaseAuth.instance;

  //   // String dateMsg = DateTime.now().toIso8601String().toString();
  //   //donner un id a l'utilisateur courrant et convertir en string(mm chose que sur android)
  //   String ud = auth.currentUser.uid.toString();

  //   return firebaseFirestore.doc(ud).set({
  //     "uid": ud,
  //     "message": message,
  //     "date": date,
  //   });
  // }


// static Future uploadMessage(String idUser, String message) async {
  //    CollectionReference refMessages = FirebaseFirestore.instance.collection('message').doc(idUser) as CollectionReference;
  //   //chats/$idUser/message

  //   final newMessage = Message(
  //     idUser: data.myId,
  //     urlAvatar: data.myUrlAvatar,
  //     username: data.myUsername,
  //     message: message,
  //     createdAt: DateTime.now(),
  //   );


  //   await refMessages.add(newMessage.toJson());

  //   final refUsers = FirebaseFirestore.instance.collection('contact');
  //   await refUsers
  //       .doc(data.myUsername)
  //       .update({ContactField.lastMessageTime: DateTime.now()});
  // }

