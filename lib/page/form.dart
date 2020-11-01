import 'package:flutter/material.dart';
import 'package:go_out_simulator/page/result.dart';
import 'dart:math';

class PageForm extends StatefulWidget {
  @override
  _PageFormState createState() => _PageFormState();
}

class _PageFormState extends State<PageForm> {
  final _formKey = GlobalKey<FormState>();
  final _nowDate = DateTime.now();
  final _approveTime = Random().nextInt(60) + 10;

  Map<String, String> _data = {};

  @override
  void initState() {
    _data["approve_time"] = "$_approveTime";
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
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Text("必填"),
                TextFormField(
                  onSaved: (v) {
                    _data["name"] = v;
                  },
                  decoration: InputDecoration(labelText: "姓名"),
                ),
                TextFormField(
                  onSaved: (v) {
                    _data["place"] = v;
                  },
                  decoration: InputDecoration(labelText: "地点"),
                ),
                TextFormField(
                  onSaved: (v) {
                    _data["teacher"] = v;
                  },
                  decoration: InputDecoration(labelText: "审批人"),
                ),
                Text("选填"),
                TextFormField(
                  onSaved: (v) {
                    if (v.length == 0) {
                      _data["college"] = "信息学院";
                    } else {
                      _data["college"] = v;
                    }
                  },
                  decoration: InputDecoration(labelText: "学院"),
                ),
                TextFormField(
                  onSaved: (v) {
                    if (v.length == 0) {
                      _data["class"] = "电信16-1";
                    } else {
                      _data["class"] = v;
                    }
                  },
                  decoration: InputDecoration(labelText: "班级"),
                ),
                TextFormField(
                  onSaved: (v) {
                    if (v.length == 0) {
                      _data["phone"] = "13819394856";
                    } else {
                      _data["phone"] = v;
                    }
                  },
                  decoration: InputDecoration(labelText: "手机号"),
                ),
                TextFormField(
                  onSaved: (v) {
                    if (v.length == 0) {
                      _data["reason"] = "办事";
                    } else {
                      _data["reason"] = v;
                    }
                  },
                  decoration: InputDecoration(labelText: "理由"),
                ),
                TextFormField(
                  onSaved: (v) {
                    if (v.length == 0) {
                      _data["out_time"] =
                          "${_nowDate.year}-${_nowDate.month}-${_nowDate.day} 06:00";
                    } else {
                      _data["out_time"] = v;
                    }
                  },
                  decoration: InputDecoration(labelText: "出校时间"),
                ),
                TextFormField(
                  onSaved: (v) {
                    if (v.length == 0) {
                      _data["return_time"] =
                          "${_nowDate.year}-${_nowDate.month}-${_nowDate.day} 23:00";
                    } else {
                      _data["return_time"] = v;
                    }
                  },
                  decoration: InputDecoration(labelText: "返回时间"),
                ),
                TextFormField(
                  onSaved: (v) {
                    if (v.length == 0) {
                      _data["remark"] = "无";
                    } else {
                      _data["remark"] = v;
                    }
                  },
                  decoration: InputDecoration(labelText: "备注"),
                ),
                FlatButton(
                  child: Text("生成"),
                  onPressed: () {
                    var form = _formKey.currentState;
                    form.save();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageResult(_data)));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
