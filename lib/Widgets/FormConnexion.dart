// import 'package:flutter/material.dart';
// import 'package:messenger_app/Providers/RegisterProviders.dart';
// import 'package:messenger_app/networkings/Networking.dart';
// import 'package:provider/provider.dart';

// import 'TextFormFIeldWidget.dart';

// class FormConnexion extends StatelessWidget {

//   Networking networtAuth = new Networking();

//   TextEditingController emailtextEditingController =
//       new TextEditingController();
//   TextEditingController passwordtextEditingController =
//       new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<RegisterProviders>(
//       builder: (_, model, __) {
//         return Form(
//           key: model.keyForm, // associer keyform a notre formulaire
//           // si on veut valider a lavenir notre formulaire nous pourrons utiliser keyform
//           child: Container(
//             padding: EdgeInsets.only(left: 25, right: 25, top: 35, bottom: 35),
//             child: Column(
//               children: [
//                 TextFormFieldWidget(
//                   model.emailtextEditingController,
//                 "email", Icon(Icons.account_circle),
//                     (value) {
//                   if (value.contains("@")) {
//                       //value = emailtextEditingController.text;
//                     return null;
//                     // return email = emailtextEditingController.text;
//                   } else
//                     return "Email not good";
//                 }),
//                 TextFormFieldWidget(
//                   model.passwordtextEditingController,
//                   "password", Icon(Icons.lock), (value) {
//                   if (value.length > 6) {
//                     //mdp = passwordtextEditingController.text;
//                     //value = passwordtextEditingController.text;
//                      return null;

//                   } else
//                     return "Password not good";
//                 }),
                
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }