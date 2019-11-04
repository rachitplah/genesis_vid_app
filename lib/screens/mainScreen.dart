import 'package:flutter/material.dart';
import 'package:genesis_vid_app/screens/loginScreen.dart';
import 'dart:convert';
import 'dart:async';

import 'package:genesis_vid_app/screens/playerScreen.dart';

String useId="";

class mScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return mScreenState();
  }
}
class mScreenState extends State<mScreen>{
  List data;
  /*
  @override
  void initState(){
    super.initState();
    print("object hhhh");
    this.getJsonData();
  }

  Future<String> getJsonData() async{
       var response=//AssetBundle('assets/images/languages.jpg');
       DefaultAssetBundle.of(context).loadString('assets/samplefiles/sample_list.json').toString();
       setState(() {
         var convertDataToJson=//json.decode(response);
         jsonDecode(response);
         data = convertDataToJson;
         print(data);
         /*
         for(i=0;i < data.length;i++)
         {    
         if(data[i]['status']=="COMPLETED")
         {
             data.removeAt(i);
             i--;
         }
         }*/
       });
       return "Success";
  }*/
  @override
  Widget build(BuildContext context) {
    //checkUseId();
    return Scaffold(
      appBar: AppBar(
              title: //Text("litebulb.in"),
              Image.asset('assets/images/litebulb.png',height: 43.5,width: 100,),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.person_add),
                  onPressed: (){
                      checkUseId();
                  },
                ),
              ],
      ),
    
      body: Material(
       // child: Text("Hello"),
       child:    FutureBuilder(
         future: DefaultAssetBundle.of(context).loadString('assets/samplefiles/sample_list.json'),
         builder: (context,snapshot){
              var mydata=json.decode(snapshot.data.toString());
              return ListView.builder(
                                     //initialItemCount: data==null ? 0 : data.length,
                                     itemCount: mydata==null ? 0 : mydata.length,
                                     itemBuilder: (BuildContext context,int index)
                                     {
                                       return
                                       GestureDetector(
                                         onTap:(){
                                              print("clicked clicked");
                                              navigateToPlayer(mydata[index]['id']);
                                         },
                                         child:
                                        Container(
                                           child: 
                                             Card(
                                                child:
                                                    Column(
                                                      children: <Widget>[
                                                        Container(
                                                          constraints: BoxConstraints.expand(
                                                            height: 180.0,
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
                                                        ListTile(
                                                          leading: Icon(Icons.person_pin,),
                                                          dense: true,
                                                          title: Text(mydata[index]['description'],style: TextStyle(fontSize: 19.0),),
                                                          subtitle: Text(mydata[index]['channel']+" . "+mydata[index]['views']+" . "+mydata[index]['date'],),
                                                          trailing: Icon(Icons.arrow_drop_down,),
                                                        ),
                                                      ],
                                                    ),
                                                    
                                                   ),
                                        ),
                                              );
                                      },
                                   );
         },
       ),
       
                 
      ),
    );
  }
  void checkUseId()
  async{ 
    if(useId==null||useId=="")
     {loginId(context);
      setState(() {});
     }
  }
  void loginId(BuildContext context)async{
     useId=await Navigator.push(context,MaterialPageRoute(builder: (context) {
       return LoginScreen1();
     }));
  }
  void navigateToPlayer(var aa)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context){
        return playerScreen(aa);
    }));
  }

}