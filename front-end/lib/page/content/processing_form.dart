import 'package:flutter/material.dart';

class ProcessingForm extends StatefulWidget {
  final Map<String, String> data;
  final Function previewForm;
  ProcessingForm({this.data, this.previewForm});
  @override
  State<StatefulWidget> createState() => _ProcessingFormState();
}

class _ProcessingFormState extends State<ProcessingForm> {
  final TextStyle activeTextStyle = TextStyle(
      color: Color(0xff32a0db),
      fontSize: 12,
      decoration: TextDecoration.underline);
  final TextStyle normalTextStyle =
      TextStyle(color: Color(0xffcecece), fontSize: 12);

  final nowDate = DateTime.now();
  final applyTime = DateTime.now().add(Duration(days: -1));

  String _formatTime(DateTime time) => time.toUtc().toString().split(".")[0];

  bool showBarCode = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xffeeeeee),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage("image/avatar.jpeg"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "学生出校申请",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: widget.data["name"],
                                  style: activeTextStyle,
                                ),
                                TextSpan(
                                    text: _formatTime(applyTime),
                                    style: normalTextStyle)
                              ]),
                            ),
                            Text(
                              "姓名:${widget.data["name"]}",
                              style: normalTextStyle,
                            ),
                            Text(
                              "学号:${widget.data["sno"]}",
                              style: normalTextStyle,
                            ),
                            Text(
                              "学院:${widget.data["college"]}",
                              style: normalTextStyle,
                            ),
                            Text(
                              "班级:${widget.data["class"]}",
                              style: normalTextStyle,
                            ),
                            Text(
                              "手机号:${widget.data["phone"]}",
                              style: normalTextStyle,
                            ),
                            Text(
                              "申请出校理由:${widget.data["reason"]}",
                              style: normalTextStyle,
                            ),
                            Text(
                              "是否离京:否",
                              style: normalTextStyle,
                            ),
                            Text(
                              "去往地点:${widget.data["place"]}",
                              style: normalTextStyle,
                            ),
                            Text(
                              "出校时间:${widget.data["out_time"]}",
                              style: normalTextStyle,
                            ),
                            Text(
                              "返校时间:${widget.data["return_time"]}",
                              style: normalTextStyle,
                            ),
                            Text(
                              "备注:${widget.data["remark"]}",
                              style: normalTextStyle,
                            ),
                            Text(
                              "岗位:北方工业大学学生",
                              style: normalTextStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset("image/done.png"),
                    ),
                  )
                ],
              ),
              Container(
                color: Colors.white,
                child: Column(children: [
                  Divider(
                    height: 1,
                  ),
                  ActionCell(
                    text: "表单预览",
                    action: () {
                      widget.previewForm();
                    },
                  ),
                  Divider(
                    height: 1,
                  ),
                  ActionCell(
                    text: "条形码",
                    action: () {
                      setState(() {
                        showBarCode = true;
                      });
                    },
                  ),
                ]),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      height: 36,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundImage:
                                    AssetImage("image/avatar.jpeg"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.data["teacher"],
                                style: activeTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50,
                            height: 22,
                            child: RaisedButton(
                              padding: EdgeInsets.zero,
                              color: Color(0xff04be01),
                              textColor: Colors.white,
                              child: Text(
                                "回复",
                                style: TextStyle(fontSize: 9),
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 2,
                      thickness: 1,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "已通过",
                                style: normalTextStyle,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                _formatTime(applyTime.add(Duration(
                                    minutes: int.parse(
                                        widget.data["approve_time"])))),
                                style: normalTextStyle,
                              ),
                            ],
                          ),
                          Text(
                            "用时${widget.data["approve_time"]}分钟",
                            style: normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 46,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: RaisedButton(
                      child: Text(
                        "后续处理",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
        showBarCode
            ? BarCode(
                tapClose: () {
                  setState(() {
                    showBarCode = false;
                  });
                },
              )
            : Container()
      ],
    );
  }
}

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
