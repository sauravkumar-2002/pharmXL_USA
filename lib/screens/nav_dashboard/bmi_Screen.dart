import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pharm_xl/screens/auth/register_Details_Height_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Country_Dob.dart';
import 'package:pharm_xl/screens/bmi_screens/input_page.dart';

import '../../SharedPref/get_User_From_SharedPref.dart';
import '../../models/register_Model.dart';



var currentAgeValue = 3;
register_Model register_model=register_Model();

class bmiScreen extends StatefulWidget {


  @override
  State<bmiScreen> createState() => _bmiScreenState();
}

class _bmiScreenState extends State<bmiScreen> {
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
                        child: Image.asset(
                          'assets/images/logo.png', width: 150, height: 150,)),
                  ),
                  InkWell(onTap:(){
                    sendToBMI_Input_page();
                  },
                  child: Text("BMI"))



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void sendToBMI_Input_page() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => InputPage()));
  }


}





//Height picker

