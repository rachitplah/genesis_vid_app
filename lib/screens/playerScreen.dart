import 'package:flutter/material.dart';
import 'package:genesis_vid_app/component/player.dart';
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
        child: FutureBuilder(
         future: DefaultAssetBundle.of(context).loadString('assets/samplefiles/sample_list.json'),
         builder: (context,snapshot){
              mydata=json.decode(snapshot.data.toString());
              return //Text("Hello $dataid");
              VideoPlayerScreen(fun1(dataid));
              //fun1(dataid);
         },
        ),
      ),
      ),
      );
  }
  
    String fun1(var dataid)
    {
        int l=mydata.length;
        int i;
        for(i=0;i<l;i++)
        {
          if(mydata[i]['id']==dataid)
          break;
        }
        var a=mydata[i]['url'];
        return a.toString();
    }
    void moveToLastScreen(BuildContext context)
  { //String ss="";
    Navigator.pop(context);
  }
}