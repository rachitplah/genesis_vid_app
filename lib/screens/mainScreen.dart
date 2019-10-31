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
    checkUseId();
    return Scaffold(
      appBar: AppBar(
              title: Center(
                child: Text("litebulb.in"),
              ),
      ),
      body: Material(
        child: Text("Hello"),
      ),
    );
  }
  void checkUseId()
  async{ 
    if(useId==null)
     {await(loginId(context));
      setState(() {});
     }
  }
  void loginId(BuildContext context)async{
     useId=await Navigator.push(context,MaterialPageRoute(builder: (context) {
       return LoginScreen1();
     }));
  }

}