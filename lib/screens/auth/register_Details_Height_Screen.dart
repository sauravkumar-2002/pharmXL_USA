import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:units_converter/units_converter.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pharm_xl/screens/auth/login_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Country_Dob.dart';
import 'package:pharm_xl/screens/auth/register_Details_Age.dart';

import 'package:pharm_xl/screens/auth/register_Details_Weight_Screen.dart';
import 'package:pharm_xl/screens/auth/signUp_Screen.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../models/register_Model.dart';




int currentFeetValue = 3;
int currentInchValue = 2;
int currentweightValue=10;
int initial_label_index=0;
var height_feet_opacity=1.0;
var weight_Container_Opacity=0.0;
var height_Container_Opacity=1.0;
var height_cm_opacity=1.0;
int currentCMValue=100;
bool show_feet_container=true;
bool show_height_container=true;
bool show_weight_container=false;
bool show_cm_container=false;
register_Model register_model=register_Model();
class registerDetails extends StatefulWidget{






  @override
  State<registerDetails> createState() => _registerDetailsState();
}

class _registerDetailsState extends State<registerDetails> {
//blue --313586
//orange-- DE6739

  var myopacity=0.0;
  var  phoneText=TextEditingController();
  var number = "";

  var  passwordText=TextEditingController();
  var inputDeco=InputDecoration();








  @override
  void initState() {
    Timer(const Duration(milliseconds: 450),(){
      setState(() {
        myopacity=1.0;
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
                        child: Image.asset('assets/images/logo.png',width: 150,height: 150,)),
                  ),

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 11,bottom: 2),
                    child: const Text(
                      " How Tall Are You?",
                      style:TextStyle(fontSize: 22,color: Color(0Xff313586),fontWeight: FontWeight.bold,fontFamily: 'logofont'),),
                  ),

                  _IntegerExample(),

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
        if(show_height_container)
        AnimatedOpacity(
          opacity: height_Container_Opacity,
          duration: Duration(seconds: 4),
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 16),
                Text('Select Your Height', style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 26),
                if(show_feet_container)
                  AnimatedOpacity(
                    opacity: height_feet_opacity,
                    duration: Duration(seconds: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumberPicker(
                          value: currentFeetValue,
                          minValue: 2,
                          itemWidth: 30,
                          selectedTextStyle:TextStyle(fontSize: 27,fontWeight:FontWeight.w600,color: Color(0xFFDE6739)),
                          textStyle: TextStyle(fontSize: 27),
                          maxValue: 8,
                          step: 1,
                          haptics: true,
                          onChanged: (value) => setState(() => currentFeetValue = value),
                        ),
                        Text("'", style: Theme.of(context).textTheme.headline6),
                        SizedBox(width: 6),

                        NumberPicker(
                          value: currentInchValue,
                          minValue: 0,
                          itemWidth: 31,
                          selectedTextStyle:TextStyle(fontSize: 27,fontWeight:FontWeight.w600,color: Color(0xFFDE6739)),
                          textStyle: TextStyle(fontSize: 27),
                          maxValue: 11,
                          step: 1,
                          haptics: true,
                          onChanged: (value) => setState(()
                          {
                            currentInchValue = value;
                            register_model.height=value.convertFromTo(LENGTH.inches, LENGTH.centimeters) as int;
                            currentCMValue=register_model.height;
                          }),
                        ),
                        Text('"', style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                  ),
                if(show_cm_container)
                  AnimatedOpacity(
                    opacity: height_cm_opacity,
                    duration: Duration(seconds: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumberPicker(
                          value: currentCMValue,
                          minValue: 50,
                          itemWidth: 50,
                          selectedTextStyle:TextStyle(fontSize: 27,fontWeight:FontWeight.w600,color: Color(0xFFDE6739)),
                          maxValue: 350,
                          step: 5,
                          haptics: true,

                          onChanged: (value) => setState(()
                          {
                            currentCMValue = value;
                            register_model.height=value;
                          }),
                        ),
                        SizedBox(width: 3),
                        Text("cm", style: Theme.of(context).textTheme.headline6),

                      ],
                    ),
                  ),

                SizedBox(height: 19),
                Align( alignment: Alignment.centerRight,
                    child: toggleSwitch()),
                SizedBox(height: 32),

              ],
            ),
          ),
        ),

        Divider(color: Colors.grey, height: 32),
        SizedBox(height: 16),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            InkWell(
            onTap: (){
              storeToSharedPref();
                gotoRegisterDetailsWeightScreen();
            },
              child:Text('Next',style: TextStyle(fontSize: 24,color: Color(0xff313586),fontWeight: FontWeight.w700),),
            ),
              Icon(Icons.navigate_next,color: Color(0xff313586),size: 24),


            ],
          ),

        SizedBox(height: 16),

        InkWell(
          onTap: (){
            gotoRegisterDetailsWeightScreen();
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
                gotoRegisterDetailsAgeScreen();
              },
              child:Text('Back',style: TextStyle(fontSize: 20,color: Colors.grey),),
            ),



          ],
        ),



      ],
    );
  }


  ToggleSwitch toggleSwitch(){
    return ToggleSwitch(
      minWidth: 50.0,
      minHeight: 28,
      initialLabelIndex: initial_label_index,
      cornerRadius: 4.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey[210],

      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      labels: ['Inch', 'Cm'],
      activeBgColors: [[Color(0xff313586)],[Color(0xffDE6739)]],
      onToggle: (index) {


        setState(() {
          if(index==0) {
            show_cm_container = false;
            height_cm_opacity=0.0;
            height_feet_opacity=1.0;
            show_feet_container = true;
            initial_label_index=0;
          }
          else{
            show_cm_container = true;
            height_cm_opacity=1.0;
            height_feet_opacity=0.0;
            show_feet_container = false;
            initial_label_index=1;
          }
        });




        print('switched to: $index');
      },
    );
  }

  void gotoRegisterDetailsWeightScreen() {

    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (_, __, ___) => registerDetailsWeight()));
  }
  void gotoRegisterDetailsAgeScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (_, __, ___) => registerDetailsAge()));
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

