import 'package:flutter/material.dart';

class GroupMessage extends StatelessWidget {
  String username;
  String groupId;
  String groupName;
 // const GroupMessage({Key key}) : super(key: key);

  GroupMessage({this.username, this.groupId, this.groupName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       // Navigator.push(context, MaterialPageRoute(builder: (context)=>GroupMessageScreen()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.blueAccent,
            child: Text(groupName.substring(0,1).toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
            ),
          ),
          title: Text(groupName, style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("Join the conversation as $username", style: TextStyle(fontSize: 13.0)),
        ),
      )
    );
  }
}
