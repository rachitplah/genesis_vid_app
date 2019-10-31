import 'package:flutter/material.dart';
import 'package:genesis_vid_app/screens/mainScreen.dart';

void main() => runApp(app1());


class app1 extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return app1_state();
  }
}
  class app1_state extends State<app1>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'litebulb',
      home: mScreen(),
    );
  }
}
