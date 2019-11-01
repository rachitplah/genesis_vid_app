import 'package:flutter/material.dart';
import 'package:genesis_vid_app/screens/loginScreen.dart';

String useId="";

class mScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return mScreenState();
  }
}
class mScreenState extends State<mScreen>{
  @override
  Widget build(BuildContext context) {
    //checkUseId();
    List data;
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
       child:     AnimatedList(
                                     initialItemCount: data==null ? 0 : data.length,
                                     itemBuilder: (BuildContext context,int index,Animation animation)
                                     {
                                       return
                                        Container(
                                           child: 
                                             Card(
                                                child:
                                                    ListTile(
                                                    leading: Icon(Icons.check_circle,),
                                                    dense: true,
                                                    title: Text(data[index]['description'],style: TextStyle(fontSize: 19.0),),
                                                    trailing: Text("Hi"),
                                                   ),),
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

}