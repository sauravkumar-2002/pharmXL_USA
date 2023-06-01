import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pharm_xl/screens/auth/register_Details_Country_Dob.dart';
import 'package:pharm_xl/screens/auth/register_Details_Disease_Screen.dart';
import 'package:pharm_xl/screens/auth/signUp_Screen.dart';
import 'package:pharm_xl/screens/nav_dashboard/graph_Screen.dart';

class loginScreen extends StatefulWidget{
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
//blue --313586
//orange-- DE6739

  var myopacity=0.0;
var  phoneText=TextEditingController();
  var number = "";

var  passwordText=TextEditingController();
var inputDeco=InputDecoration(

);








@override
void initState() {
  Timer(Duration(milliseconds: 950),(){
 setState(() {
   myopacity=1.0;
 });
  });
  super.initState();


}

@override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: AnimatedOpacity(
          opacity: myopacity,
          duration: Duration(seconds: 1),
          child: Container(


            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Hero(
                      tag: "logo",
                      child: Image.asset('assets/images/logo.png',width: 150,height: 150,)),
                ),

                Container(
                  margin: EdgeInsets.only(top: 21,bottom: 42),
                  child: Text(
                    " Login Here",
                    style:TextStyle(fontSize: 22,color: Color(0Xff313586),fontWeight: FontWeight.bold,fontFamily: 'logofont'),),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                  child: IntlPhoneField(

                    decoration: inputDecoration_Phone(),
                    controller: phoneText,
                    initialCountryCode: "IN",
                    validator: (data) {
                      return null;
                    },
                    onChanged: (data) {
                      number = data as String;
                      print("number is $data");
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 6.0),
                  child: TextField(
                    controller: passwordText,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: inputDecoration_Password(),

                  ),
                ),

                Container(

                  margin: EdgeInsets.only(top: 5,right: 12),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: (){

                      },
                      child: Text(
                        "Forgot Password?",
                        style:TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w600),textAlign: TextAlign.right,),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: OutlinedButton(
                    onPressed: () {


                    },
                    style: OutlinedButton.styleFrom( //<-- SEE HERE
                      side: BorderSide(width: 1.4),

                      backgroundColor: Color(0xffF8EBEBFF)
                    ),
                    

                           child: Text('LOGIN  >> ',
                                style:TextStyle(fontSize: 17,color: Color(0Xff313586),fontWeight: FontWeight.bold),
                            ),
                            //Icon(Icons.arrow_forward_sharp,color: Color(0Xff313586),),


                    ),
                  ),
                 Padding(
                   padding: const EdgeInsets.only(top: 52.0),
                   child: CircularProgressIndicator(
                     backgroundColor: Color(0Xff313586),
                     color: Color(0xffDE6739),

                     strokeWidth: 6,
                   ),
                 ),

                 Container(
                   margin: EdgeInsets.only(top: 109),
                   child: InkWell(
                     onTap: (){



                     },
                     child: InkWell(
                       onTap: (){

                         gotoSignUpScreen();


                       },
                       child: RichText(
                            text: TextSpan(
                              style:TextStyle(fontSize: 15,color: Color(0Xff313586),fontWeight: FontWeight.w600,fontFamily: 'logofont'
                              ),
                              children: [
                                TextSpan(text: 'Create Account?'),
                                TextSpan(text: 'Register',
                                  style:TextStyle(fontSize: 17,color: Color(0XffDE6739),fontWeight: FontWeight.bold
                                  ),
                                ),
                              ]
                            ),


                        ),
                     ),
                   ),
                 ),






              ],
            ),
          ),
        ),
      ),
    ),
  );
  }




  void sendToLoginScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => loginScreen()));
  }

  void gotoSignUpScreen() {

    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => signUpScreen()));
  }



}
InputDecoration inputDecoration_Phone(){
  return InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Color(0xffDE6739),
            width: 2,
          )
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Color(0xff313586),
            width: 2,
          )
      ),
    labelText: "Phone No.",
    labelStyle: TextStyle(color: Color(0Xff313586),),


    //prefixIcon:

    hintText: "Enter Your Phone Number",
  );
}

InputDecoration inputDecoration_Password(){
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(
          color: Color(0xffDE6739),
          width: 2,
        )
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(
          color: Color(0xff313586),
          width: 2,
        )
    ),
    labelText: "Password",
    labelStyle: TextStyle(color: Color(0Xff313586)),


    prefixIcon: Icon(Icons.lock,color: Color(0Xff313586),),
    suffixIcon: IconButton(
      onPressed: () { 

    }, icon: Icon(Icons.remove_red_eye,color: Color(0Xff313586),),
      
    ),

    hintText: "Enter Your Password",
  );
}
