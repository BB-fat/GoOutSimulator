import 'package:flutter/material.dart';
import 'package:go_out_simulator/page/form.dart';

import 'page/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '处理表单',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "/":(context) => PageIndex(),
//        "/":(context) => PageForm(),
      },
      initialRoute: "/",
    );
  }
}
