import 'package:flutter/material.dart';
import 'dart:convert';

class playerScreen extends StatefulWidget{
  var datid;
  playerScreen(this.datid);
  @override
  State<StatefulWidget> createState() {
    return playerScreenState(this.datid);
  }
}
class playerScreenState extends State<playerScreen>{
  var dataid;
  var mydata;
  playerScreenState(this.dataid);
  @override
  Widget build(BuildContext context) {
    return     WillPopScope(
     onWillPop: (){
       moveToLastScreen(context);
     },
      child:
    Scaffold(
      body:Material(
        child: Text("Hello $dataid"),
        /*
        child: FutureBuilder(
         future: DefaultAssetBundle.of(context).loadString('assets/samplefiles/sample_list.json'),
         builder: (context,snapshot){
              mydata=json.decode(snapshot.data.toString());
              return Text("Hello "+dataid);
              
              //fun1(dataid);
         },
        ),*/
      ),
      ),
      );
  }
  /*
    Text fun1(var dataid)
    {
        int l=mydata.length;
        int i;
        for(i=0;i<l;i++)
        {
          if(mydata[i]['id']==dataid)
          break;
        }
        return Text("Hello "+mydata[i]['id']);
    }*/
    void moveToLastScreen(BuildContext context)
  { //String ss="";
    Navigator.pop(context);
  }
}