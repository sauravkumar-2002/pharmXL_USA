import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pharm_xl/back-dataStore/update_To_Dynamo.dart';
import 'package:pharm_xl/screens/auth/login_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Height_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Weight_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Disease_Screen.dart';
import 'package:pharm_xl/screens/auth/signUp_Screen.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../SharedPref/get_User_From_SharedPref.dart';
import '../../SharedPref/store_To_SharedPref.dart';
import '../../models/register_Model.dart';




int currentweightValue=10;

var weight_Container_Opacity=0.0;

bool show_weight_container=false;
register_Model register_model=register_Model();



class registerDetailsWeight extends StatefulWidget{






  @override
  State<registerDetailsWeight> createState() => _registerDetailsWeightState();
}

class _registerDetailsWeightState extends State<registerDetailsWeight> {
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
    Timer(Duration(milliseconds: 450),(){
      setState(() {
        myopacity=1.0;
      });
    });
    super.initState();
    getinfo();


  }

  void getinfo() async{
    register_model= await getUserInfo();
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
                    margin: EdgeInsets.only(top: 11,bottom: 12),
                    child: Text(
                      "What's your Current Weight?",
                      style:TextStyle(fontSize: 22,color: Color(0Xff313586),fontWeight: FontWeight.bold,fontFamily: 'logofont'),),
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
          Container(
            child: Column(
              children: [
                //SizedBox(height: 16),
                //Text('Select Your Weight', style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 26),
                NumberPicker(
                  value: currentweightValue,
                  minValue: 0,
                  maxValue: 190,
                  selectedTextStyle:TextStyle(fontSize: 27,fontWeight:FontWeight.w600,color: Color(0xFFDE6739)),
                  step: 5,
                  itemHeight: 100,
                  axis: Axis.horizontal,
                  onChanged: (value) =>
                      setState((){
                        currentweightValue = value;
                        //register_model.weight=currentweightValue;
                        register_model=register_Model(
                            email: register_model.email,
                            phone: register_model.phone,
                            password: register_model.password,
                            name: register_model.name,
                            country: register_model.country,
                            state: register_model.state,
                            city: register_model.city,
                            gender: register_model.gender,
                            age: register_model.age,
                            weight: value*(1.00),


                        );
                      }),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(color: Color(0xFF313586),width: 2),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () => setState(() {
                        final newValue = currentweightValue - 5;
                        currentweightValue = newValue.clamp(0, 120);
                      }),
                    ),
                    Text('Current Weight in Kg: $currentweightValue'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => setState(() {
                        final newValue = currentweightValue + 5;
                        currentweightValue = newValue.clamp(0, 100);
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),

        Divider(color: Colors.grey, height: 32),
        SizedBox(height: 16),


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                storeToSharedPref(register_model);
                updatetoDynamodb(register_model);
                gotoRegisterDetailsDiseaseScreen();
              },
              child:Text('Next',style: TextStyle(fontSize: 24,color: Color(0xff313586),fontWeight: FontWeight.w700),),
            ),
            Icon(Icons.navigate_next,color: Color(0xff313586),size: 24),


          ],
        ),

        SizedBox(height: 16),

        InkWell(
            onTap: (){
              gotoRegisterDetailsDiseaseScreen();
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
                gotoRegisterDetailsHeightScreen();
              },
              child:Text('Back',style: TextStyle(fontSize: 20,color: Colors.grey),),
            ),



          ],
        ),




      ],
    );
  }

  void gotoRegisterDetailsDiseaseScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (_, __, ___) => registerDetailsDisease()));
  }

  void gotoRegisterDetailsHeightScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (_, __, ___) => registerDetails()));
  }



}





//Height picker

