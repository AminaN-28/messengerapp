// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:messenger_app/Providers/LoginProviders.dart';
// import 'package:messenger_app/Providers/RegisterProviders.dart';
// import 'package:messenger_app/Widgets/FormConnexion.dart';
// import 'package:messenger_app/networkings/Networking.dart';
// import 'package:provider/provider.dart';

// import '../RouteGenerator.dart';

// class LoginButton extends StatefulWidget {
//   @override
//   _LoginButtonState createState() => _LoginButtonState();
// }

// class _LoginButtonState extends State<LoginButton> {
//   Networking networking = new Networking();

//   FirebaseAuth auth = FirebaseAuth.instance;

//   //champ de texte

//   String uid;

//   //creer une variable contenant une chaine(l'erreur sur le test userCredentiel)

//   FormConnexion form = new FormConnexion();
//   final formkey = GlobalKey<FormState>();

//   AnimationController animationController;

//   Animation button;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<RegisterProviders>(
//       builder: (_, model, __) {
//       return AnimatedBuilder(
//           animation: animationController,
//           builder: (context, widget) 
//           {
//             return GestureDetector(
//               onTap: () async {
//               //ceci va nous permettre de valider notre formulaire si on clique sur le bouton
//               //register et va retourner un booleen
//               //si cest vrai le formulaire est valide
//               //sinon il est pas
//               // print(model);

//               if (model.keyForm.currentState.validate()) {
//                 print("ok");
//                 print(model.emailtextEditingController.text);
//                 print(model.passwordtextEditingController.text);

//                 int result = await Networking.signWithEmailAndPassword(
//                     model.emailtextEditingController.text,
//                     model.passwordtextEditingController.text);
//                 if (result == 1) {
//                   print("OK NICKEL");
//                 } else {
//                   print("NOT NICKEL");
//                   print("SOMETHING WENT WRONG");
//                 }
//                 Navigator.pushNamed(context, RouteGenerator.homeScreen);
//               }
//               },
//               child:
//               Container(
//                 width: button.value,
//                 height: 50,
//                 alignment: FractionalOffset.center,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     color: Colors.blue),
//                 child: button.value > 80
//                     ? Text(
//                         "LOG IN",
//                         style: TextStyle(fontSize: 20, color: Colors.white),
//                       )
//                     : Center(
//                         child: CircularProgressIndicator(
//                         backgroundColor: Colors.white,
//                       )
//                       ),
//               )
      
      
//       );
//           });
//     });
//   }
// }
