

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messenger_app/Providers/RegisterProviders.dart';
import 'package:messenger_app/Widgets/FormWidget.dart';
import 'package:messenger_app/Widgets/ImagePickerWidget.dart';
import 'package:messenger_app/Widgets/RegisterButton.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {

  // TextEditingController usernametextEditingController =
  //     new TextEditingController();
  // TextEditingController emailtextEditingController =
  //     new TextEditingController();
  // TextEditingController passwordtextEditingController =
  //     new TextEditingController();
  // TextEditingController confirmpasswordtextEditingController =
  //     new TextEditingController();
 
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override 
  Widget build(BuildContext context) {
    bool isLoading = false;
        return ChangeNotifierProvider(
          create: (context) => RegisterProviders(),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(  
              title: Text(
                "Messenger",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body:isLoading ? Container(
        )
        :SingleChildScrollView(
            child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImagePIckerWiget(),
                  FormWidget(),
                  RegisterButton()
                  // TextEditingController usernametextEditingController 

                ],
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}
