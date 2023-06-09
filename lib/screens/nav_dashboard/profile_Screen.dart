import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pharm_xl/SharedPref/login_bool.dart';
import 'package:pharm_xl/screens/auth/register_Details_Height_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Country_Dob.dart';

import '../auth/login_Screen.dart';



var currentAgeValue = 3;

class profileScreen extends StatefulWidget {


  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
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
                  InkWell(
                    onTap:()=> logout(),
                      child: Text("Log Out"))



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  logout() async{
    bool_login_sharedPref(false);
    sendToLoginScreen();
  }

  void sendToLoginScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => loginScreen()));


  }


}





//Height picker

