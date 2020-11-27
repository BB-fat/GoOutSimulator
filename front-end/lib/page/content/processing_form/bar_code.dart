import 'package:flutter/material.dart';

class BarCode extends StatelessWidget {
  final Function tapClose;
  BarCode({this.tapClose});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black45,
      child: Column(
        children: [
          Image.asset(
            "image/bar_code.jpg",
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: Colors.white,
            child: RaisedButton(
              color: Colors.redAccent,
              child: Text(
                "关闭",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: tapClose,
            ),
          )
        ],
      ),
    );
  }
}