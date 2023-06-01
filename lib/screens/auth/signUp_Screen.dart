import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pharm_xl/screens/auth/login_Screen.dart';
import 'package:pharm_xl/screens/auth/otp_Screen.dart';
import 'package:pharm_xl/screens/progress_bar.dart';
import 'package:pharm_xl/models/register_Model.dart';
import 'package:pharm_xl/screens/toast.dart';
import 'package:pharm_xl/amplifyconfiguration.dart';
import 'package:pharm_xl/screens/auth/aws_auth/awsAuthRepo.dart';
//import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';

bool _registerFlag_for_error=false;
var  confirmpasswordText=TextEditingController();
bool _isObscure_pass=true;
bool _isObscure_conf_pass=true;
String? _email_textfield_error_text="";
late SharedPreferences sharedPreferences;


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

  var  nameText=TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool validate = false;

  AWSAuthRepo auth = AWSAuthRepo();
  bool _isAmplifyConfigured=false;




  void _configureAmplify() async {
    try {
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


  @override
  void initState() {
    Timer(Duration(milliseconds: 240),(){
      setState(() {
        myopacity=1.0;
      });
    });
    super.initState();
    _configureAmplify();


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
                        child: Image.asset(
                          'assets/images/logo.png', width: 150, height: 150,)),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 21, bottom: 32),
                    child: Text(
                      " Register Here",
                      style: TextStyle(fontSize: 22,
                          color: Color(0Xff313586),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'logofont'),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: TextField(
                      controller: nameText,
                      decoration: inputDecoration_name(nameText),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 9.0),
                    child: TextField(

                      controller: emailText,
                      obscureText: false,
                      decoration: inputDecoration_Email(emailText),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (text) => setState(() =>_email_textfield_error_text=_errorText(emailText, "email")
                      ),



                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 9.0),
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
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 2.0),
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

                        errorText: _registerFlag_for_error ? _errorText(passwordText,"password") : null,

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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 9.0),
                    child: TextField(
                      controller: confirmpasswordText,
                      obscureText: _isObscure_conf_pass,
                      obscuringCharacter: '*',
                      decoration:InputDecoration(
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
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(color: Color(0Xff313586)),

                        errorText: _registerFlag_for_error ? _errorText(passwordText,"conf_password") : null,

                        prefixIcon: Icon(Icons.lock,color: Color(0Xff313586),),
                        suffixIcon: IconButton(
                          onPressed: () {
                          setState(() {
                            _isObscure_conf_pass=!_isObscure_conf_pass;
                          });
                          },
                          icon: Icon(_isObscure_conf_pass?Icons.visibility:Icons.visibility_off,color: Color(0Xff313586),),

                        ),

                        hintText: "Confirm Your Password",
                      ),


                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: OutlinedButton(
                      onPressed: () {
                        showLoaderDialog(context);
                        _registerAccount();
                        //sendToOtpScreen();
                      },
                      style: OutlinedButton.styleFrom( //<-- SEE HERE
                          side: BorderSide(width: 1.4),

                          backgroundColor: Color(0xffF8EBEBFF)
                      ),


                      child: Text('REGISTER  >> ',
                        style: TextStyle(fontSize: 17,
                            color: Color(0Xff313586),
                            fontWeight: FontWeight.bold),
                      ),
                      //Icon(Icons.arrow_forward_sharp,color: Color(0Xff313586),),


                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        sendToLoginScreen();
                      },
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(fontSize: 15,
                                color: Color(0Xff313586),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'logofont'
                            ),
                            children: [
                              TextSpan(text: 'Already Have an Account?'),
                              TextSpan(text: 'Sign In',
                                style: TextStyle(fontSize: 17,
                                    color: Color(0XffDE6739),
                                    fontWeight: FontWeight.bold
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





  bool _validatePass_and_conf_Pass(){
    return (passwordText.text==confirmpasswordText.text);
  }
  bool _validate_email(){
    return EmailValidator.validate(emailText.text);
  }
  bool _validate_name(){
    return nameText.text.length>1 ;
  }
  bool _validate_password(){
    return passwordText.text.length>=10;
  }



void _registerAccount() async {
    setState(() {
      _registerFlag_for_error=true;
    });
    print("helloooooo");

  bool x = false;
  x = _validate_name();
  if (x==false) {

    showToast("Check Your Name, It should be of minimum two letter");
    Navigator.pop(context);
    return;
  }
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
      x = _validatePass_and_conf_Pass();
    if (!x) {
      showToast("Password and Confirm Password does not Match");
      Navigator.pop(context);
      return;
    }


    if (x) {
      try {
        await Amplify.Auth.signUp(
            username: emailText.text,
            password: passwordText.text,
            options: SignUpOptions(
                userAttributes: {
                  AuthUserAttributeKey.email: emailText.text.toString(),
                }
            )

        );

        ///gotonext activity
        storeToSharedPref();
        Navigator.pop(context);
        sendToOtpScreen();
        return;
        //store into shared pref

      }
      on InvalidEmailRoleAccessPolicyException catch (e) {
        showToast("Check Your Email");

      }
      on UsernameExistsException catch (e) {
        showToast(e.message);
        setState(() {
          _email_textfield_error_text=_errorText(emailText,"email_exist");
        });

      }
      on AmplifyException catch (e) {
        showToast("Amplify Exception");

        print("error inawsAuthRepo-AmplifyException111 e is   " + e.toString());
      }
      Navigator.pop(context);
    }
  }





  void clearText()
  {

  }

  void sendToLoginScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => loginScreen()));
  }

  void sendToOtpScreen() {
    print("sendtootp_screen");
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => OtpScreen()));
  }

  Future<void> storeToSharedPref() async {
    register_Model register_model=register_Model();
    register_model.email=emailText.text.toString();
    register_model.password=passwordText.text.toString();
    register_model.phone=phoneText.text.toString();
    register_model.name=nameText.text.toString();



    //print("register_model.toString()");
   // print(register_model.email);
    Map<String,dynamic>register_model_map=register_model.toMap();
    String register_model_json=jsonEncode(register_model_map);
    //print("register_model_json");
    //print(register_model_json);
    sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("register_model_shared_pref", register_model_json);

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
    errorText: _registerFlag_for_error ? _email_textfield_error_text : null,


    prefixIcon:Icon(Icons.email,color: Color(0Xff313586),),

    hintText: "Enter Your Email Id",
  );
}
InputDecoration inputDecoration_name(TextEditingController nameText){
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
    labelText: "Your Name.",
    labelStyle: TextStyle(color: Color(0Xff313586),),
      errorText: _registerFlag_for_error ? _errorText(nameText,"name") : null,

    prefixIcon: Icon(Icons.person,color: Color(0Xff313586),),

    hintText: "UserName",
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

    errorText: _registerFlag_for_error ? _errorText(passwordText,"password") : null,

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
InputDecoration inputDecoration_confirmPassword(String hint,String label,TextEditingController passwordText){
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

    errorText: _registerFlag_for_error ? _errorText(passwordText,"conf_password") : null,

    prefixIcon: Icon(Icons.lock,color: Color(0Xff313586),),
    suffixIcon: IconButton(
      onPressed: () {

      },
      icon: Icon(_isObscure_pass?Icons.visibility:Icons.visibility_off,color: Color(0Xff313586),),

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

String?  _errorText(TextEditingController _controller,String type ) {
  // at any time, we can get the text from _controller.value.text
  final text = _controller.value.text;
  if(type=="email"){
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    else if(!EmailValidator.validate(text)){
      return "Not a Valid Email";
    }
    return null;
  }
  if(type=="name"){
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    else if(text.length<2){
      return "Minimum of 2 Characters";
    }
    return null;
  }
  if(type=="password"){
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    else if(text.length<10){
      return "Minimum of 10 Characters";
    }
    return null;
  }
  if(type=="conf_password"){
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    else if(text!=confirmpasswordText.text){
      return "Does\'t matches with Password";
    }
    return null;
  }
  if(type=="email_exist"){
   return "Email Already Exists";
  }

  // return null if the text is valid
  return null;
}

