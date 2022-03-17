import 'package:flutter/material.dart';
import 'package:messenger_app/Models/Contact.dart';
import 'package:messenger_app/Widgets/OneRowForGroups.dart';

class ListcontactForGroups extends StatelessWidget {
  List<Contact> allContact;
  ListcontactForGroups(this.allContact);
  // const ListcontactForGroups({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {

               //var checkbox = Checkbox;

              },
            ),
          OneRowForGroups(allContact[index]),

          ],
        );
      },
      itemCount: allContact.length,
    );
  }
}


























































// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:messenger_app/Models/Contact.dart';
// import 'package:messenger_app/Widgets/OneRowContactMessage.dart';

// import 'ListViewAllContact.dart';

// // ignore: must_be_immutable
// class ListContactForGroups extends StatefulWidget {
//   // List<Contact> allContact;
//   //  ListContactForGroups(this.allContact);

//   @override
//   _ListContactForGroupsState createState() => _ListContactForGroupsState();
// }

// class _ListContactForGroupsState extends State<ListContactForGroups> {
//   @override
//   Widget build(BuildContext context) {
//     return  StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection("contact").snapshots(),
//       builder: (context, snapshot) {
//         return ListView.builder(
//           itemBuilder: (BuildContext context, int index) {
//              if (snapshot.hasError) {
//                             return Text('Something went wrong');
//                           }
//                           if (snapshot.connectionState == ConnectionState.waiting) {
//                             return Text("Loading");
//                           }
        
//                           List<Contact> allContact = [];
//                           for (var document in snapshot.data.docs) {
//                             allContact.add(Contact.fromMap(document.data()));
//                           }
//                           return ListViewAllContact(allContact);
//                 }
//             // return Column(
//             //   children :[ 
//             //     //Text(contact.UserName),
//             //     GestureDetector(
//             //       onTap: () {
//             //        // Navigator.pushNamed(context, RouteGenerator.detailScreen);
                    
//             //         // Navigator.push(
//             //         //     context,
//             //         //     MaterialPageRoute(
//             //         //         builder: (context) => DetailsScreen(contact: allContact[index])));
//             //       },
//             //       child: OneRowContactMessage(allContact[index])),
//             //   ]
//             );
//           },
//          // itemCount: allContact.length,
//         );
//   }
// }





























// import 'package:messenger_app/Models/Contact.dart';
// import 'package:messenger_app/Widgets/AppBarMessenger.dart';
// import 'package:messenger_app/Widgets/CircularImageUser.dart';
// import 'package:messenger_app/Widgets/ListViewAllContact.dart';

// import '../RouteGenerator.dart';
// import 'CustomTextField.dart';

// class ListContactForGroups extends StatefulWidget {

//   final Contact contact;
//   ListContactForGroups({Key key, @required this.contact}) : super(key: key);

//   //ListViewAllContact allContact;

//   @override
//   _ListContactForGroupsState createState() => _ListContactForGroupsState();
// }

// class _ListContactForGroupsState extends State<ListContactForGroups> {
//   List<Contact> allContact;

//   List<Contact> selectedContact;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         autofocus: false,
//         child: const Icon(Icons.add_outlined),
//         onPressed: () {
//         //Navigator.pushNamed(context, RouteGenerator.allContactScreen);

//           //CreateGroupChat();
//         },
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             AppBarMessenger(),
//             SizedBox(
//               height: 10,
//             ),
//             CustomTextField(),
//             SizedBox(
//               height: 30,
//             ),
//             SafeArea(
//                 child: Container(
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                       itemBuilder: (BuildContext context, int index) {
//                         //return item;
//                         return ContactItem(
//                           allContact[index].userName,
//                           allContact[index].email,
//                           allContact[index].isChoosen,
//                           index,
//                         );
//                       },
//                       itemCount: allContact.length,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 25,
//                       vertical: 10,
//                     ),
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: RawMaterialButton(
//                         child: Text("Create Group",
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                         ),
//                         splashColor: Colors.blueAccent,
//                         onPressed: () {
//                         print("Create Group:${selectedContact.length}");
//                       }),
//                     ),
//                   ),
//                 ],
//               ),
//             ))
//           ],
//         ),
//       ),
//     );
//   }

//   Widget ContactItem(String username, String email, bool isChoosen, int index) {
//     return ListTile(
//       leading: CircularImageUser(urlImage: allContact[index].image, radius: 50),
//       title: Text(
//         username,
//         style: TextStyle(fontWeight: FontWeight.bold),
//       ),
//       subtitle: Text(
//         email,
//       ),
//       trailing: isChoosen
//           ? Icon(
//               Icons.check_circle,
//               color: Colors.blue[800],
//             )
//           : Icon(
//               Icons.check_circle_outline,
//               color: Colors.grey,
//             ),
//       onTap: () {
//         setState(() {
//           allContact[index].isChoosen = !allContact[index].isChoosen;
//           if (allContact[index].isChoosen == true) {
//             selectedContact.add(Contact.fromMap(allContact[index].email));
//           }
//         });
//       },
//     );
//   }
// }





