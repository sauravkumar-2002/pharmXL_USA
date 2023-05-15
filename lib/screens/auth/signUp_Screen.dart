import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pharm_xl/screens/auth/login_Screen.dart';
import 'package:pharm_xl/screens/auth/otp_Screen.dart';

class signUpScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _signUpScreenState();
  }

}

class _signUpScreenState extends State<signUpScreen>{


  var myopacity=0.0;
  var  phoneText=TextEditingController();
  var number = "";

  var  passwordText=TextEditingController();
  var  emailText=TextEditingController();
  var  confirmpasswordText=TextEditingController();
  var  usernameText=TextEditingController();





  @override
  void initState() {
    Timer(Duration(milliseconds: 240),(){
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
                    margin: EdgeInsets.only(top: 21,bottom: 32),
                    child: Text(
                      " Register Here",
                      style:TextStyle(fontSize: 22,color: Color(0Xff313586),fontWeight: FontWeight.bold,fontFamily: 'logofont'),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                    child: TextField(
                      controller: usernameText,
                      decoration: inputDecoration_Username(),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 9.0),
                    child: TextField(
                      controller: emailText,
                      obscureText: true,
                      obscuringCharacter: 'X',
                      decoration: inputDecoration_Email(),

                    ),
                  ),




                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 9.0),
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
                    padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 2.0),
                    child: TextField(
                      controller: passwordText,
                      obscureText: true,
                      obscuringCharacter: 'X',
                      decoration: inputDecoration_Password("Enter Your password","Password"),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 9.0),
                    child: TextField(
                      controller: confirmpasswordText,
                      obscureText: true,
                      obscuringCharacter: 'X',
                      decoration: inputDecoration_Password("Confirm Your Password","Confirm Password"),

                    ),
                  ),

                 

                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: OutlinedButton(
                      onPressed: () {

                      sendToOtpScreen();
                      },
                      style: OutlinedButton.styleFrom( //<-- SEE HERE
                          side: BorderSide(width: 1.4),

                          backgroundColor: Color(0xffF8EBEBFF)
                      ),


                      child: Text('REGISTER  >> ',
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
                    margin: EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: (){

                      sendToLoginScreen();

                      },
                      child: RichText(
                        text: TextSpan(
                            style:TextStyle(fontSize: 15,color: Color(0Xff313586),fontWeight: FontWeight.w600,fontFamily: 'logofont'
                            ),
                            children: [
                              TextSpan(text: 'Already Have an Account?'),
                              TextSpan(text: 'Sign In',
                                style:TextStyle(fontSize: 17,color: Color(0XffDE6739),fontWeight: FontWeight.bold
                                ),
                              ),
                            ]
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

  void sendToOtpScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => OtpScreen()));
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
InputDecoration inputDecoration_Email(){
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
    labelText: "Email Id.",
    labelStyle: TextStyle(color: Color(0Xff313586),),


    prefixIcon:Icon(Icons.email,color: Color(0Xff313586),),

    hintText: "Enter Your Email Id",
  );
}
InputDecoration inputDecoration_Username(){
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
    labelText: "Username.",
    labelStyle: TextStyle(color: Color(0Xff313586),),


    prefixIcon: Icon(Icons.person,color: Color(0Xff313586),),

    hintText: "UserName",
  );
}

InputDecoration inputDecoration_Password(String hint,String label){
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
    labelText: label,
    labelStyle: TextStyle(color: Color(0Xff313586)),


    prefixIcon: Icon(Icons.lock,color: Color(0Xff313586),),
    suffixIcon: IconButton(
      onPressed: () {

      },
      icon: Icon(Icons.remove_red_eye,color: Color(0Xff313586),),

    ),

    hintText: hint,
  );
}

BoxDecoration boxDecoration(){
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xffF0F2F1),Color(0xffC9CACC),Colors.black12]
    )
  );
}