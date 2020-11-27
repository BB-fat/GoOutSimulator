import 'package:flutter/material.dart';

class ActionCell extends StatelessWidget {
  final String text;
  final Function action;

  ActionCell({this.text, this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 36,
        onPressed: action,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Color(0xff626985),
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
            Image.asset(
              "image/arrow.png",
              width: 10,
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}