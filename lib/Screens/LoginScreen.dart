// import 'package:flutter/material.dart';
// import 'package:messenger_app/Providers/LoginProviders.dart';
// import 'package:messenger_app/Widgets/FormConnexion.dart';
// import 'package:messenger_app/Widgets/ImagePickerWidget.dart';
// import 'package:messenger_app/Widgets/LoginButton.dart';
// import 'package:provider/provider.dart';

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     bool isLoading = false;
//     return ChangeNotifierProvider(
//           create: (context) => LoginProvider(),
//           child: Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(  
//               title: Text(
//                 "Messenger",
//                 style: TextStyle(color: Colors.black),
//               ),
//               centerTitle: true,
//               backgroundColor: Colors.white,
//               elevation: 0,
//             ),
//             body:isLoading ? Container(
//         )
//         :SingleChildScrollView(
//             child: Container(
//             width: MediaQuery.of(context).size.width,
//             alignment: Alignment.bottomCenter,
//             child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 24),
//                 child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ImagePIckerWiget(),
//                   FormConnexion(),
//                   LoginButton()
//                   // TextEditingController usernametextEditingController 

//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );

  
//   }
// }