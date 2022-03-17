import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messenger_app/Models/Contact.dart';

import 'package:messenger_app/Providers/BottomProviders.dart';
import 'package:messenger_app/Screens/ChatScreen.dart';
import 'package:messenger_app/Screens/HomeContact.dart';

import 'package:messenger_app/Widgets/AppBarMessenger.dart';
import 'package:messenger_app/Widgets/CustomTextField.dart';
import 'package:messenger_app/Widgets/ListViewAllContact.dart';
import 'package:messenger_app/Widgets/Message.dart';
import 'package:provider/provider.dart';

import 'MessageScreen.dart';
import 'ProfilScreen.dart';

class HomeMessage extends StatefulWidget {
  @override
  _HomeMessageState createState() => _HomeMessageState();
}

class _HomeMessageState extends State<HomeMessage> {
  //int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _selectedItem = 0;
     var currentTab = [
       HomeContact(),
        ChatPage(),
       MessageScreen(),
     ];
    return ChangeNotifierProvider(
    create: (context) => BottomProvider(),
    //builder:context => BottomProvider(),
    //create: ,
      child:Consumer<BottomProvider>
          // ignore: missing_return
          (builder: (context, model , _) {
      return Container(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
    
        child: Scaffold(
          
          body: model.currentScreen,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blueAccent,
            mouseCursor: SystemMouseCursors.grab,
            selectedFontSize: 20,
            selectedItemColor: Colors.lightBlue,
            unselectedItemColor: Colors.grey.shade600,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail),
                label: "Contacts",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: "Messages",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: "Profil",
              ),
            ],
            currentIndex: model.currentTab,
            //indexProvider.currentIndex,
            onTap: (index) {
              //foreach time i select an item this method will be execute
              model.currentTab =
                  index; // here i set the currentTab of the model
              //to the index of the selected tab and allow me to set the index of the Tab in the model itself
              //tab refresh every time i select a new item
              print(model.currentTab); //voir page ou on est
              //indexProvider.currentIndex = index;
              //indexProvider.changeSomething(index);
            },
          ),
        ),
      );
          }),
     
    
      );

  }
}
