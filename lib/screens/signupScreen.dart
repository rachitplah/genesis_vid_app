import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SignUpScreenState();
  }
}
class SignUpScreenState extends State<SignUpScreen>{
  
//class LoginScreen1 extends StatelessWidget{
   var _formKey=GlobalKey<SignUpScreenState>();
   Color primaryColor=Colors.lightBlueAccent;
   Color backgroundColor=Colors.white;
   AssetImage backgroundImage=AssetImage('assets/images/languages.jpg');
   TextEditingController nameTController=TextEditingController();
   TextEditingController emailTController=TextEditingController();
   TextEditingController numberTController=TextEditingController();
   TextEditingController passTController=TextEditingController();
   TextEditingController passTController2=TextEditingController();

/*
  LoginScreen1({
    Key key,
    this.primaryColor, this.backgroundColor, this.backgroundImage
  });
*/
  @override
  Widget build(BuildContext context) {
    return 
    WillPopScope(
     onWillPop: (){
       moveToLastScreen(context);
     },
      child:
    Scaffold(
      body:Material(
      child:Container(
      height: MediaQuery.of(context).size.height,
      /*
      decoration: BoxDecoration(
        image: DecorationImage(
                  image: this.backgroundImage,
                  fit: BoxFit.cover,
                ),
      ),*/
       decoration: BoxDecoration(
        color: Colors.blue[400],
        ),
      child: 
      Padding(
        padding: EdgeInsets.only(left:30.0,right:30.0,bottom: 60.0,top:60.0),
        child:
      Container(
        
        decoration: BoxDecoration(
        color: this.backgroundColor,
        borderRadius: BorderRadius.circular(15.0),
        ),
        child:
      Form(
        key: _formKey,
        child:
      ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding:
                  EdgeInsets.only(left:20.0,right:20.0,bottom: 10.0,top:2.0),
            child:
            Container(
              child: Center(
                child: 
              
              Image.asset('assets/images/litebulb.png',height: 43.5,width: 100,),
              ),
            ),
          ),
           Padding(
            padding:
                  EdgeInsets.only(left:20.0,right:20.0,bottom: 10.0,top:10.0),
            child:
          Row(
              children: <Widget>[
                  Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0),
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Container(
              //padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextFormField(
              style: TextStyle(color: Colors.grey),
              controller: nameTController,
              validator: (String value){
                if(value.isEmpty){
                  return 'Please enter name';
                }
              },
              //onSubmitted: (String userInput) {},
              decoration: InputDecoration(
                labelText: 'Enter name here',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0)
                ),
              ),
            ),
            ),
                )
              ],
            ),
          ),

           Padding(
            padding:
                  EdgeInsets.only(left:20.0,right:20.0,bottom: 10.0,top:10.0),
            child:
          Row(
              children: <Widget>[
                  Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0),
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Container(
              //padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextFormField(
              style: TextStyle(color: Colors.grey),
              controller: emailTController,
              validator: (String value){
                if(value.isEmpty){
                  return 'Please enter email address';
                }
              },
              //onSubmitted: (String userInput) {},
              decoration: InputDecoration(
                labelText: 'Enter email here',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0)
                ),
              ),
            ),
            ),
                )
              ],
            ),
          ),

          Padding(
            padding:
                  EdgeInsets.only(left:20.0,right:20.0,bottom: 10.0,top:10.0),
            child:
          Row(
              children: <Widget>[
                  Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0),
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Container(
              //padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextFormField(
              style: TextStyle(color: Colors.grey),
              controller: numberTController,
              validator: (String value){
                if(value.isEmpty){
                  return 'Please enter whatsapp number';
                }
              },
              //onSubmitted: (String userInput) {},
              decoration: InputDecoration(
                labelText: 'Enter whatsapp number here',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0)
                ),
              ),
            ),
            ),
                )
              ],
            ),
          ),
          
           Padding(
            padding:
                  EdgeInsets.only(left:20.0,right:20.0,bottom: 10.0,top:10.0),
            child:
          Row(
              children: <Widget>[
                  Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0),
                  child: Icon(
                    Icons.lock_open,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Container(
              //padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextFormField(
              style: TextStyle(color: Colors.grey),
              //onSubmitted: (String userInput) async{
                   
                  // resultListState().changeResult(res);
                   
              //},
              controller: passTController,
              validator: (String value){
                if(value.isEmpty){
                  return 'Please enter password';
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Enter password here',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0)
                ),
              ),
            ),
            ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                  EdgeInsets.only(left:20.0,right:20.0,bottom: 10.0,top:10.0),
            child:
          Row(
              children: <Widget>[
                  Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0),
                  child: Icon(
                    Icons.lock_open,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Container(
              //padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextFormField(
              style: TextStyle(color: Colors.grey),
              //onSubmitted: (String userInput) async{
                   
                  // resultListState().changeResult(res);
                   
              //},
              controller: passTController2,
              validator: (String value){
                if(value.isEmpty){
                  return 'Please renter password';
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Renter password here',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0)
                ),
              ),
            ),
            ),
                )
              ],
            ),
          ),
          Padding(
                   padding: EdgeInsets.only(top:10,left:20,right:20,bottom: 10),
                   child:
                   Container(
                     child: RaisedButton(
                               child: Text(
                            "SIGN UP",
                            style: TextStyle(color: Colors.white),
                          ),
                              color: Colors.blue[400],
                              padding: EdgeInsets.all(0),
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(30.0)),
                              onPressed: (){
                                //Navigator.of(context).pushReplacementNamed('/screen2');
                                //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => mScreen()));
                               // if(_formKey.currentState) {
                                moveToLastScreen(context);
                                //}                                
                              },
                           ),
                      // width: 50.0,
                       height: 50.0,
                   ),
                 ),

        ],
      ),
      ),
      ),
      ),
      ),
      ),
    ),
    );
  }
  void moveToLastScreen(BuildContext context)
  { //String ss=emailTController.text;
    Navigator.pop(context);
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height * 0.85);
    p.arcToPoint(
      Offset(0.0, size.height * 0.85),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    );
    p.lineTo(0.0, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}