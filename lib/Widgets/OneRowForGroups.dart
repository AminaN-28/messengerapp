import 'package:flutter/material.dart';
import 'package:messenger_app/Models/Contact.dart';

import 'CircularImageUser.dart';


class OneRowForGroups extends StatelessWidget {

  Contact contact;

  //Message message;
  OneRowForGroups(this.contact);
  //const OneRowForGroups({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
           Padding(
            padding: const EdgeInsets.only(right: 1.0),
            child: CircularImageUser(urlImage: contact.image, radius: 60),
          ),


          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                contact.userName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),



              Container(
                width: MediaQuery.of(context).size.width - 115,
                child: Text(
                  contact.email,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],

            
          )
        ],
      )

    );
  }
}