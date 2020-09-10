import 'package:flutter/material.dart';
import 'package:go_out_simulator/page/result.dart';

class PageForm extends StatefulWidget {
  @override
  _PageFormState createState() => _PageFormState();
}

class _PageFormState extends State<PageForm> {
  final _formKey = GlobalKey<FormState>();

  Map<String,String> _data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 200,),
              TextFormField(
                onSaved: (v) {
                  _data["name"] = v;
                },
                decoration: InputDecoration(labelText: "姓名"),
              ),
              TextFormField(
                onSaved: (v) {
                  _data["college"] = v;
                },
                decoration: InputDecoration(labelText: "学院"),
              ),
              TextFormField(
                onSaved: (v) {
                  _data["class"] = v;
                },
                decoration: InputDecoration(labelText: "班级"),
              ),
              TextFormField(
                onSaved: (v) {
                  _data["phone"] = v;
                },
                decoration: InputDecoration(labelText: "手机号"),
              ),
              TextFormField(
                onSaved: (v) {
                  _data["reason"] = v;
                },
                decoration: InputDecoration(labelText: "理由"),
              ),
              TextFormField(
                onSaved: (v) {
                  _data["place"] = v;
                },
                decoration: InputDecoration(labelText: "地点"),
              ),
              TextFormField(
                onSaved: (v) {
                  _data["out_time"] = v;
                },
                decoration: InputDecoration(labelText: "出校时间"),
              ),
              TextFormField(
                onSaved: (v) {
                  _data["return_time"] = v;
                },
                decoration: InputDecoration(labelText: "返回时间"),
              ),
              TextFormField(
                onSaved: (v) {
                  _data["remark"] = v;
                },
                decoration: InputDecoration(labelText: "备注"),
              ),
              TextFormField(
                onSaved: (v) {
                  _data["teacher"] = v;
                },
                decoration: InputDecoration(labelText: "审批人"),
              ),
              TextFormField(
                onSaved: (v) {
                  _data["approve_time"] = v;
                },
                decoration: InputDecoration(labelText: "通过时间"),
              ),
              TextFormField(
                onSaved: (v) {
                  _data["last_time"] = v;
                },
                decoration: InputDecoration(labelText: "审批用时"),
              ),
              FlatButton(
                child: Text("生成"),
                onPressed: () {
                  var form = _formKey.currentState;
                  form.save();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PageResult(_data)));
                },
              )
            ],
          ),
        ),),
      ),
    );
  }
}
