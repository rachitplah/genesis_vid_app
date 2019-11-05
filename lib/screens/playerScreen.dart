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
  int ind=0;
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
              Column(
                children: <Widget>[
                  
                   Container(
                           height:(MediaQuery.of(context).size.height)/4 ,
                           width: MediaQuery.of(context).size.width ,
                           child: 
                                   VideoPlayerScreen(fun1(dataid)),
                         ),
                  Container(
                    height: (MediaQuery.of(context).size.height)*(3/4),
                    child:
                  
                  ListView(
                    children: <Widget>[
                      Container(
                    child:
                    Card(
                      child:
                     ListTile(
                                                          dense: true,
                                                          title: Text(mydata[ind]['description'],style: TextStyle(fontSize: 19.0),),
                                                          subtitle: Text(mydata[ind]['views'],),
                                                          trailing: Icon(Icons.arrow_drop_down,),
                                                        ),
                    ),
                  ),
                  Container(
                    child:
                    Card(
                      child: 
                     ListTile(
                                                          leading: Icon(Icons.person_pin,),
                                                          dense: true,
                                                          title: Text(mydata[ind]['channel'],style: TextStyle(fontSize: 19.0),),
                                                          
                                                          trailing: 
                                                          
                                                              Text("SUBSCRIBE",style: TextStyle(fontSize: 15.0,fontWeight:FontWeight.w900, color: Colors.red,),),
                                                          
                                                              
                                                        ),
                    ),
                  ),
                  Container(
                    height: 400.0,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                                     //initialItemCount: data==null ? 0 : data.length,
                                     itemCount: mydata==null ? 0 : mydata.length,
                                     itemBuilder: (BuildContext context,int index)
                                     {
                                       return
                                       GestureDetector(
                                         onTap:(){
                                              print("clicked clicked");
                                             // navigateToPlayer(mydata[index]['id']);
                                         },
                                         child:
                                        Container(
                                           child: 
                                             Card(
                                                child:
                                                    Row(
                                                      children: <Widget>[
                                                        Container(
                                                          constraints: BoxConstraints.expand(
                                                            height: 90.0,
                                                            width:  MediaQuery.of(context).size.width/2.05,
                                                          ),
                                                          alignment: Alignment.bottomRight,
                                                          padding: EdgeInsets.only(right: 16.0,bottom: 8.0),
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              image: NetworkImage(mydata[index]['image']),
                                                              
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          child: Text(mydata[index]['timer'],style: TextStyle(backgroundColor: Colors.black,color: Colors.white,),),
                                                        ),
                                                        Container(
                                                          height: 90.0,
                                                          width: MediaQuery.of(context).size.width/2.05,
                      
                                                          child:
                                                          
                                                        ListTile(
                                                          dense: true,
                                                          
                                                          title: Text(mydata[index]['description'],style: TextStyle(fontSize: 12.0),),
                                                          subtitle: 
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                          Text(mydata[index]['channel'],textAlign: TextAlign.right,),
                                                          Text(mydata[index]['views'],),

                                                           ],
                                                          ),
                                                          
                                                         // isThreeLine: true,
                                                          trailing: Icon(Icons.arrow_drop_down,),
                                                        ),

                                                          
                                                        ),
                                                      ],
                                                    ),
                                                    
                                                   ),
                                        ),
                                              );
                                      },
                                   ),
                  ),

                    ],
                  ),
                  ),
                  
                ],
              );
              
              //VideoApp(dataid);
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
        ind=i;
        var a=mydata[i]['url'];
        return a.toString();
    }
    void moveToLastScreen(BuildContext context)
  { //String ss="";
    Navigator.pop(context);
  }
}