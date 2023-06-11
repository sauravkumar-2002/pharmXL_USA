import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pharm_xl/screens/auth/register_Details_Height_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Country_Dob.dart';



var currentAgeValue = 3;

class plansScreen extends StatefulWidget {


  @override
  State<plansScreen> createState() => _plansScreenState();
}

class _plansScreenState extends State<plansScreen> {
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
                  Text("Plans")



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}





//Height picker

