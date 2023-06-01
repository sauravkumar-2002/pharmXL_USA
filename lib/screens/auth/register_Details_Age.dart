import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pharm_xl/screens/auth/register_Details_Height_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Country_Dob.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/register_Model.dart';



var currentAgeValue = 3;
register_Model register_model=register_Model();
class registerDetailsAge extends StatefulWidget {


  @override
  State<registerDetailsAge> createState() => _registerDetailsAgeState();
}

class _registerDetailsAgeState extends State<registerDetailsAge> {
//blue --313586
//orange-- DE6739

  var myopacity = 0.0;



  @override
  void initState() {
    Timer(Duration(milliseconds: 450), () {
      setState(() {
        myopacity = 1.0;
      });
    });
    super.initState();
    getUserInfo();
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
                    margin: EdgeInsets.only(top: 11, bottom: 12),
                    child: Text(
                      "How older are you?",
                      style: TextStyle(fontSize: 22,
                          color: Color(0Xff313586),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'logofont'),),
                  ),
                  _IntegerExample()


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Future<void> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> register_model_map = {};
    final String? register_model_json = prefs.getString('register_model_shared_pref');
    print(register_model_json);
    if (register_model_json != null) {
      register_model_map = jsonDecode(register_model_json) as Map<String, dynamic>;
    }

    register_model = register_Model.fromMap(register_model_map);
    print(register_model);

  }



}


class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

class __IntegerExampleState extends State<_IntegerExample> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 16),
        Divider(color: Colors.grey, height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberPicker(
              value: currentAgeValue,
              minValue: 1,
              itemWidth: 47,
              selectedTextStyle:TextStyle(fontSize: 27,fontWeight:FontWeight.w600,color: Color(0xFFDE6739)),
              textStyle: TextStyle(fontSize: 27),
              maxValue: 120,
              step: 1,
              haptics: true,
              onChanged: (value) => setState(() {
                currentAgeValue=value;
                register_model.age=value;
              }),
            ),
            SizedBox(width: 3,),
            Text("Yrs",style: TextStyle(fontSize: 23,fontWeight:FontWeight.w600,color: Color(0xFFDE6739)),)
          ],
        ),
        SizedBox(height: 16),
        Divider(color: Colors.grey, height: 32),

        SizedBox(height: 16),


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                storeToSharedPref();
                gotoRegisterDetailsHieghtScreen();
              },
              child:Text('Next',style: TextStyle(fontSize: 24,color: Color(0xff313586),fontWeight: FontWeight.w700),),
            ),
            Icon(Icons.navigate_next,color: Color(0xff313586),size: 24),


          ],
        ),

        SizedBox(height: 16),

        InkWell(
            onTap: (){
              gotoRegisterDetailsHieghtScreen();
            },
            child: Text('Skip For Now',style: TextStyle(fontSize: 20,color: Colors.grey,),)
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icon(Icons.navigate_before,color: Colors.grey,size: 24),
            InkWell(
              onTap: (){
                gotoRegisterDetailsCountryScreen();
              },
              child:Text('Back',style: TextStyle(fontSize: 20,color: Colors.grey),),
            ),



          ],
        ),
      ],
    );
  }

  void gotoRegisterDetailsCountryScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (_, __, ___) => registerDetailsCountryDob()));
  }
  void gotoRegisterDetailsHieghtScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (_, __, ___) => registerDetails()));
  }

  Future<void> storeToSharedPref() async {

    Map<String,dynamic>register_model_map=register_model.toMap();
    String register_model_json=jsonEncode(register_model_map);
    //print("register_model_json");
    print(register_model_json);
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("register_model_shared_pref", register_model_json);

  }
}




//Height picker

