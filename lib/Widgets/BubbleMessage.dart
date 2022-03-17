import 'package:flutter/material.dart';

class SendBubbleMessage extends StatelessWidget {
  const SendBubbleMessage(
      {Key key,
      @required this.message,
      @required this.username,
      @required this.size,
      @required this.date,
      @required this.urlAvatar})
      : super(key: key);

  final String message;
  final String username;
  final Size size;
  final String urlAvatar;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Stack(
        children: <Widget>[
          Container(
            width: size.width * 0.6,
            margin: EdgeInsets.only(
              right: size.width * 0.01,
              bottom: size.height * 0.02,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.015,
              vertical: size.width * 0.008,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                topRight: Radius.circular(3.0),
                bottomRight: Radius.circular(3.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  '$username',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.016,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Text(
                  '$message', //'AMINA IS BAE'
                  style: TextStyle(fontSize: size.height * 0.017),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0.01,
              right: size.width * 0.010,
              child: Container(
                //color: Colors.blueGrey,
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.0025,
                  horizontal: size.width * 0.01,
                ),
                child: Text(
                  '$date',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
