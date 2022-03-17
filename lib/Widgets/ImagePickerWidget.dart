import 'dart:io';

import 'package:flutter/material.dart';

import 'package:messenger_app/Providers/RegisterProviders.dart';
import 'package:provider/provider.dart';

class ImagePIckerWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProviders>
    (
      builder: (_, registerProvider, __) {
        return GestureDetector(
            onTap: () async {
              registerProvider.getNewImage();
              //registerProvider.upload();
            },
            child: registerProvider.pickedfile != null
                ? CircleAvatar(
                    //registerProvider.pickedfile = 
                    backgroundImage:
                        FileImage(File(registerProvider.pickedfile.path)),
                    radius: 50,
                  )
                : CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.camera_alt_rounded,
                      size: 50,
                    ),
                  ));
      },
    );
    // User user get ;
  }
}
