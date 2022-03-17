import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/Widgets/GroupMessage.dart';

class GroupMessageList extends StatefulWidget {

  //const GroupMessageList({ Key? key }) : super(key: key);

  @override
  _GroupMessageListState createState() => _GroupMessageListState();
}

class _GroupMessageListState extends State<GroupMessageList> {


    CollectionReference groups = FirebaseFirestore.instance.collection("groups");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: groups.snapshots(),
        builder: (context , AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasData)
            {
             }
            return Text("Loading");

        },

        ),
    );
  }
}



            //   if(snapshot.data['groups'] != null){
            //     if(snapshot.data['groups'].length != 0){
            //       return ListView.builder(
            //         itemCount: snapshot.data['groups'].length,
            //         shrinkWrap: true,
            //         itemBuilder: (context, index){
            //           int reqIndex = snapshot.data['groups'].length -index - 1;
            //           return GroupMessage(username: snapshot.data['username'], groupId: desturcture(snapshot.data['groups'][reqIndex], groupName: destructure(snapshot.data['groups'][reqIndex]),);
            //         }
            //       );
            //     }
            //     else{
            //       return CircularProgressIndicator();
            //     }
            //   }
            //   else{
            //     return Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   }