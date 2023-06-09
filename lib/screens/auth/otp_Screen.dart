import 'dart:async';
import 'dart:convert';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharm_xl/models/ModelProvider.dart';
import 'package:pharm_xl/models/register_Model.dart';
import 'package:pharm_xl/screens/auth/login_Screen.dart';
import 'package:pharm_xl/screens/auth/otp_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Height_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Country_Dob.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pharm_xl/amplifyconfiguration.dart';

import '../../SharedPref/login_bool.dart';
import '../../back-dataStore/readFromDynamodb.dart';
import '../progress_bar.dart';
import '../toast.dart';




String otp = '';
class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _pin="";
  var myopacity=0.0;

  register_Model register_model=register_Model();



  void _configureAmplify() async {
    print("_config_started");
    try {
      print("_config_started_try");
      final provider=ModelProvider();
      final datastoreplugin=AmplifyDataStore(modelProvider: provider);

      await Amplify.addPlugin(datastoreplugin);
      await Amplify.configure(amplifyconfig);
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
   // _configureAmplify();
    getUserInfo();

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: AnimatedOpacity(
            opacity: myopacity,
            duration: Duration(seconds: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Center(
                  child: Hero(
                      tag: "logo",
                      child: Image.asset('assets/images/logo.png',width: 150,height: 150,)),
                ),
                Text(
                  '   Enter the 6-digit Pin\nSent to your Email Id.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                PinInputField(
                  pinLength: 6,
                  onChanged: (value) {

                    print(value);
                    setState(() {
                      print(value);
                      print(_pin);
                      _pin = value;
                    });
                  },

                ),

                SizedBox(height: 20),
                Container(


                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 195),

                      InkWell(
                        onTap: (){

                        },
                        child: Text(
                          "Resend OTP?",

                          style:TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 12,color: Colors.black,fontWeight: FontWeight.w800,),textAlign: TextAlign.right),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: OutlinedButton(
                    onPressed: () {
                      showLoaderDialog(context);
                    verification_Otp();

                    },
                    style: OutlinedButton.styleFrom( //<-- SEE HERE
                        side: BorderSide(width: 1.4),

                        backgroundColor: Color(0xffF8EBEBFF)
                    ),


                    child: Text(' Verify ',
                      style:TextStyle(fontSize: 17,color: Color(0Xff313586),fontWeight: FontWeight.bold),
                    ),
                    //Icon(Icons.arrow_forward_sharp,color: Color(0Xff313586),),


                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendtoRegisterDetailsScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => registerDetailsCountryDob()));
  }

  void verification_Otp() async{

    update();
    readall();

    print("otp");
    print(otp);
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: register_model.email!,
          confirmationCode: otp);
      if (res.isSignUpComplete) {
        showToast("You are Succesfully Registered");
        Navigator.pop(context);
        storetoDynamodb(register_model);
        bool_login_sharedPref(true);
        sendtoRegisterDetailsScreen();
      }
      else {
        showToast("Some Internal Error Ocurred");
        bool_login_sharedPref(false);
        Navigator.pop(context);
      }
    }
    on CodeMismatchException catch(e){
      showToast(e.message.toString());
      Navigator.pop(context);
    }
  }


  Future<void> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> register_model_map = {};
    final String? register_model_json = prefs.getString('register_model_shared_pref');
    print(register_model_json);
    if (register_model_json != null) {
      register_model_map = jsonDecode(register_model_json) as Map<String, dynamic>;
    }

     register_model = register_Model.fromJson(register_model_map);
    print(register_model);

  }

  void storetoDynamodb(register_Model register_model) async{
    try {
      await Amplify.DataStore.save(register_model);
      print('Task created successfully');
    } catch (e) {
      print('Error creating task: $e');
    }
  }


  Future<List<register_Model>?> readby_email(String email) async{
    try{
        final obj=await Amplify.DataStore.query(register_Model.classType,where: register_Model.EMAIL.eq(email));
        print("sexy obj email");
        print(obj);
        if(obj.isEmpty){
          //no obj exists
          return null;

        }
        return obj;
    }
    catch(e){
      print(e);
      throw e;
    }
  }

  void update() async{
    try{
      final obj=await readby_email("20je0882@ece.iitism.ac.in");
      print("sexy obj email update");
      List<graph_value_Model> xx=[];
      xx.add(graph_value_Model(date: "todayd date",xValue: 21,yValue: 23));
      xx.add(graph_value_Model(date: "todayd date",xValue: 20,yValue: 2,diettaken: "total diet"));
      obj?[0]=register_Model(email: obj[0].email,
                              phone:"000",graph_value: xx);
      await Amplify.DataStore.save(obj?[0] as register_Model);
      print(obj?[0]);

    }
    catch(e){
      print(e);
    }
  }

}
















class PinInputField extends StatefulWidget {
  final int pinLength;
  final ValueChanged<String> onChanged;

  PinInputField({required this.pinLength, required this.onChanged});

  @override
  _PinInputFieldState createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  List<FocusNode> _focusNodes = [];
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.pinLength; i++) {
      _focusNodes.add(FocusNode());
      _controllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.pinLength, (index) {
        return Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 4),
          child: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,

            cursorColor: Color(0xff313586),

            focusNode: _focusNodes[index],
            controller: _controllers[index],
            onChanged: (value) {
              _onTextChanged(value, index);
            },
            decoration: inputDecoration_otp(),
          ),
        );
      }),
    );
  }

  void _onTextChanged(String value, int index) {
    if (value.length == 1) {
      if (index < widget.pinLength - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        // all boxes filled
        otp='';
        for (int i = 0; i < widget.pinLength; i++) {
          otp += _controllers[i].text;
        }

      }
    }
  }
}

InputDecoration inputDecoration_otp(){
  return InputDecoration(

    counterText: '',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
    ),

    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(
          color: Color(0xff313586),
          width: 2,
        )
    ),
    contentPadding: EdgeInsets.all(1),
  );
}



