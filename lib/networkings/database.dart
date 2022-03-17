
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  CollectionReference usercollection =
      FirebaseFirestore.instance.collection("users");

  
  
// Future addtodatabase(String email, String password, String imageUrl, String username){

//  FirebaseAuth auth = FirebaseAuth.instance;

//   String uid = auth.currentUser.uid.toString();
//   UploadTask uploadTask =
//        (FirebaseStorage.instance.ref("images/"))
//            .putFile(File(file.path));


//     return usercollection
//         .add({
//           'email': email, // amina@gmail.com
//           'password': password, // Amina2803
//           'image': uploadTask, // image
//           'uid': uid, //currentUser id
//           'userName': username, // nom d'utilisateur
//         })
//         .then((value) => print("User Added"))
//         .catchError((error) => print("Failed to add user: $error"));
// }

  //To create or overwrite a single document, use the set() method:
  Future<void> updateUserData(
      String email, String password, String urlImage, String username) async {
    return await usercollection.doc(uid).set({
      "email": email, //amina@gmail.com
      "password": password, // amina2803
      "username": username, //Amina Ndiaye
      "urlImage": urlImage // linkphoto
    });
  }


  
}
