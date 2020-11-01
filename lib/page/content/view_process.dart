import 'package:flutter/material.dart';

class ViewProcess extends StatelessWidget {
  final Map<String, String> data;

  ViewProcess(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffeeeeee),
      child: Stack(
        children: [
          Image.asset(
            "image/process.jpeg",
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            child: Text(
              "${data["name"]}",
              style: TextStyle(fontSize: 12),
            ),
            top: MediaQuery.of(context).size.height * 0.543,
            left: 30,
          )
        ],
      ),
    );
  }
}
