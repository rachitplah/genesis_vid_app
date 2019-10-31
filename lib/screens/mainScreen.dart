import 'package:flutter/material.dart';

class mScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return mScreenState();
  }
}
class mScreenState extends State<mScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title: Center(
                child: Text("lightbulb.in"),
              ),
      ),
      body: Material(
        child: Text("Hello"),
      ),
    );
  }

}