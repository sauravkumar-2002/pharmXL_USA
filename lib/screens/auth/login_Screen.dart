import 'dart:async';


import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharm_xl/SharedPref/store_To_SharedPref.dart';
import 'package:pharm_xl/back-dataStore/deleteFromDynamodb.dart';
import 'package:pharm_xl/back-dataStore/readFromDynamodb.dart';
import 'package:pharm_xl/back-dataStore/update_To_Dynamo.dart';
import 'package:pharm_xl/error_text/error_text_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pharm_xl/screens/Dashboard_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Country_Dob.dart';
import 'package:pharm_xl/screens/auth/register_Details_Disease_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Height_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Weight_Screen.dart';
import 'package:pharm_xl/screens/auth/signUp_Screen.dart';
import 'package:pharm_xl/screens/nav_dashboard/graph_Screen.dart';

import '../../SharedPref/login_bool.dart';
import '../../amplifyconfiguration.dart';
import '../../models/ModelProvider.dart';
import '../progress_bar.dart';
import '../toast.dart';
bool logiFlag_for_error=false;

String? _email_textfield_error_text="";
bool _isObscure_pass=true;
class loginScreen extends StatefulWidget{




  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
//blue --313586
//orange-- DE6739

  bool _isAmplifyConfigured=false;

  var myopacity=0.0;
  var number = "";

  var  emailText=TextEditingController();
var  passwordText=TextEditingController();
var inputDeco=InputDecoration(

);



  void _configureAmplify() async {
    if(Amplify.isConfigured==false) {
      try {
        print("_config_started_try");
        final provider = ModelProvider();
        final datastoreplugin = AmplifyDataStore(modelProvider: provider);

        await Amplify.addPlugin(datastoreplugin);
        await Amplify.addPlugin(AmplifyAuthCognito());
        await Amplify.configure(amplifyconfig);
        setState(() =>
            _isAmplifyConfigured = true
        );
        print('Successfully configured');
      } on Exception catch (e) {
        print('Error configuring Amplify: $e');
      }
    }
  }




@override
void initState() {
  Timer(Duration(milliseconds: 950),(){
 setState(() {
   myopacity=1.0;
 });
  });
  super.initState();
  _configureAmplify();
  //alreadySignedin();
  checkSignIn();


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
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, top: 9.0),
                  child: TextField(

                    controller: emailText,
                    obscureText: false,
                    decoration: inputDecoration_Email(emailText),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (text) => setState(() =>_email_textfield_error_text=errorText(emailText, "email")
                    ),



                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, top: 9.0),
                  child: TextField(
                    controller: passwordText,
                    obscureText: _isObscure_pass,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
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

                      errorText: logiFlag_for_error ? errorText(passwordText,"password") : null,

                      prefixIcon: Icon(Icons.lock,color: Color(0Xff313586),),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure_pass=!_isObscure_pass;
                          });

                        },
                        icon: Icon(_isObscure_pass?Icons.visibility:Icons.visibility_off,color: Color(0Xff313586),),

                      ),

                      hintText: "Enter Your password",
                    ),
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
                      showLoaderDialog(context);
                        validation_and_login();

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
            pageBuilder: (_, __, ___) => registerDetails()));
  }


  bool _validate_email(){
    return EmailValidator.validate(emailText.text);
  }
  bool _validate_password(){
    return passwordText.text.length>=10;
  }

  Future<void> validation_and_login() async {
    setState(() {
      logiFlag_for_error=true;
    });
    bool x = false;
    x = _validate_email();
    if (!x) {

      showToast("Check Your Email, It Does not Exist");
      Navigator.pop(context);
      return;
    }
    x = _validate_password();
    if (!x) {
      showToast("Check Your Password, It should be of minimum 10 characters");
      Navigator.pop(context);
      return;
    }
    if(x) {
      try {
        //deleteall();
        readall();
        ///gotonext activity
        final obj=await readby_email(emailText.text);
        if(obj==null){
          showToast("User Not Found");
          setState(() {
            _email_textfield_error_text="User Not Found";
          });

        }
        else{
          if(obj![0].password==passwordText.text) {
            storeToSharedPref(obj![0]);
            bool_login_sharedPref(true);
            Navigator.pop(context);
            sendToDashboard();

          }
          else{
            showToast("Invalid Password");
            Navigator.pop(context);
          }
        }

        //return;
        //store into shared pref

      }
      catch(e){
        showToast(e.toString());
        print(e.toString());
      }


    }
  }

  void sendToDashboard() {
    print("dashboard");
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => dashboardScreen()));
  }

  void checkSignIn() async{
    bool? loginn=await bool_check_login_sharedPref();
    print("jjj");
    if(loginn!){
      print("true");
      sendToDashboard();
    }
  }





}




InputDecoration inputDecoration_Email(TextEditingController emailText){
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
    errorText: logiFlag_for_error ? _email_textfield_error_text : null,


    prefixIcon:Icon(Icons.email,color: Color(0Xff313586),),

    hintText: "Enter Your Email Id",
  );
}


InputDecoration inputDecoration_Password(String hint,String label,TextEditingController passwordText){
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

    errorText: logiFlag_for_error ? errorText(passwordText,"password") : null,

    prefixIcon: Icon(Icons.lock,color: Color(0Xff313586),),
    suffixIcon: IconButton(
      onPressed: () {
        _isObscure_pass=!_isObscure_pass;
      },
      icon: Icon(_isObscure_pass?Icons.visibility:Icons.visibility_off,color: Color(0Xff313586),),

    ),

    hintText: hint,
  );
}
