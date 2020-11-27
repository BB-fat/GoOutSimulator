import 'package:flutter/material.dart';

class TeacherCardLayer extends StatelessWidget {
  final String teacherName;
  final Function tapClose;

  TeacherCardLayer({this.tapClose, this.teacherName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapClose,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black45,
        child: Stack(
          children: [
            Image.asset(
              "image/teacher.png",
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              child: Text(
                teacherName,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              left: 120,
              top: 36,
            )
          ],
        ),
      ),
    );
  }
}
