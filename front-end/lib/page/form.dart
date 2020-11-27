import 'package:flutter/material.dart';
import 'package:go_out_simulator/page/result.dart';
import 'dart:math';

class PageForm extends StatefulWidget {
  @override
  _PageFormState createState() => _PageFormState();
}

class _PageFormState extends State<PageForm> {
  final formKey = GlobalKey<FormState>();
  final nowDate = DateTime.now();
  final approveTime = Random().nextInt(60) + 10;

  final TextStyle titleTextStyle =
      TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold);

  Map<String, String> data = {};
  @override
  void initState() {
    data["approve_time"] = "$approveTime";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  child: Text(
                    "出校模拟器",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 28),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 60),
                ),
                Text(
                  "必填",
                  style: titleTextStyle,
                ),
                TextFormField(
                  onSaved: (v) {
                    data["name"] = v;
                  },
                  decoration: InputDecoration(labelText: "姓名"),
                ),
                TextFormField(
                  onSaved: (v) {
                    data["sno"] = v;
                  },
                  decoration: InputDecoration(labelText: "学号"),
                ),
                TextFormField(
                  onSaved: (v) {
                    data["place"] = v;
                  },
                  decoration: InputDecoration(labelText: "地点"),
                ),
                TextFormField(
                  onSaved: (v) {
                    data["teacher"] = v;
                  },
                  decoration: InputDecoration(labelText: "审批人"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "选填",
                  style: titleTextStyle,
                ),
                TextFormField(
                  onSaved: (v) {
                    if (v.length == 0) {
                      data["college"] = "信息学院";
                    } else {
                      data["college"] = v;
                    }
                  },
                  decoration: InputDecoration(labelText: "学院"),
                ),
                TextFormField(
                  onSaved: (v) {
                    if (v.length == 0) {
                      data["class"] = "电信16-1";
                    } else {
                      data["class"] = v;
                    }
                  },
                  decoration: InputDecoration(labelText: "班级"),
                ),
                TextFormField(
                  onSaved: (v) {
                    if (v.length == 0) {
                      data["phone"] = "13819394856";
                    } else {
                      data["phone"] = v;
                    }
                  },
                  decoration: InputDecoration(labelText: "手机号"),
                ),
                TextFormField(
                  onSaved: (v) {
                    if (v.length == 0) {
                      data["reason"] = "办事";
                    } else {
                      data["reason"] = v;
                    }
                  },
                  decoration: InputDecoration(labelText: "理由"),
                ),
                TextFormField(
                  onSaved: (v) {
                    if (v.length == 0) {
                      data["out_time"] =
                          "${nowDate.year}-${nowDate.month}-${nowDate.day} 06:00";
                    } else {
                      data["out_time"] = v;
                    }
                  },
                  decoration: InputDecoration(labelText: "出校时间"),
                ),
                TextFormField(
                  onSaved: (v) {
                    if (v.length == 0) {
                      data["return_time"] =
                          "${nowDate.year}-${nowDate.month}-${nowDate.day} 23:00";
                    } else {
                      data["return_time"] = v;
                    }
                  },
                  decoration: InputDecoration(labelText: "返回时间"),
                ),
                TextFormField(
                  onSaved: (v) {
                    if (v.length == 0) {
                      data["remark"] = "无";
                    } else {
                      data["remark"] = v;
                    }
                  },
                  decoration: InputDecoration(labelText: "备注"),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.airplanemode_active),
        onPressed: () {
          var form = formKey.currentState;
          form.save();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PageResult(data)));
        },
      ),
    );
  }
}
