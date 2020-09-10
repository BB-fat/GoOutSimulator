import 'package:flutter/material.dart';
import 'form.dart';

class PageIndex extends StatefulWidget {
  @override
  _PageIndexState createState() => _PageIndexState();
}

class _PageIndexState extends State<PageIndex> {
  TextEditingController _textEditingController;

  final String code = "WSRFA87cs";

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "出校模拟器",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
                width: 200,
                child: TextField(
                  controller: _textEditingController,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: "邀请码"),
                )),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              child: Text("进入"),
              onPressed: () {
                if (_textEditingController.text == code) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageForm()));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
