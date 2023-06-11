import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pharm_xl/screens/auth/register_Details_Height_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Country_Dob.dart';
import 'package:pharm_xl/screens/bmi_screens/result_page.dart';
import 'package:pharm_xl/screens/nav_dashboard/graph_Screen.dart';
import 'package:pharm_xl/screens/nav_dashboard/home_Screen.dart';
import 'package:pharm_xl/screens/nav_dashboard/profile_Screen.dart';
import 'package:pharm_xl/screens/nav_dashboard/plans_screen.dart';

import '../SharedPref/get_User_From_SharedPref.dart';
import '../models/register_Model.dart';
import 'bmi_screens/calculator_brain.dart';
import 'nav_dashboard/bmi_Screen.dart';



var currentAgeValue = 3;
register_Model register_model=register_Model();
class dashboardScreen extends StatefulWidget {


  @override
  State<dashboardScreen> createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
//blue --313586
//orange-- DE6739

  var myopacity = 0.0;


  int currentTab=3;

  CalculatorBrain calc =
  CalculatorBrain(height: register_model.height==null?1: (register_model.height!/1) as int, weight: register_model.weight==null?0:register_model.weight!/1 as int);

  final List<Widget> screens=[
    homeScreen(),
    //bmiScreen(),

    profileScreen(),
    plansScreen(),
    graphsScreen()
  ];

  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentScreen=graphsScreen();

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
      body: PageStorage(
        child: currentScreen,
          bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffDE6739),
        child: Icon(Icons.bar_chart_outlined,size: 28,color: currentTab==3?Color(0xff313586):Colors.white,),
        onPressed: (){
          setState(() {
            currentScreen =graphsScreen();
            currentTab = 3;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 2,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen =homeScreen();
                          currentTab = 0;
                        });
                      },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home_outlined,color: currentTab==0?Color(0xff313586):Colors.grey,),
                        Text("Home",style: TextStyle(color: currentTab==0?Color(0xff313586):Colors.grey,),)
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        calc=CalculatorBrain(height: register_model.height==null?1: (register_model.height?.toInt())!, weight: register_model.weight==null?0:register_model.weight!.toInt());
                        print(calc.calculateBMI());
                        print(register_model.height);
                        print(register_model.weight);
                        print(register_model.gender);
                        currentScreen =ResultPage(bmiResult: calc.calculateBMI(), resultText: calc.getResult(), interpretation: calc.getInterpretation());
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.next_plan_outlined,color: currentTab==1?Color(0xff313586):Colors.grey,),
                        Text("BMI",style: TextStyle(color: currentTab==1?Color(0xff313586):Colors.grey,),)
                      ],
                    ),
                  ),



                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =plansScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.settings_outlined,color: currentTab==2?Color(0xff313586):Colors.grey,),
                        Text("Plans",style: TextStyle(color: currentTab==2?Color(0xff313586):Colors.grey,),)
                      ],
                    ),
                  ),

                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =profileScreen();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_2_outlined,color: currentTab==4?Color(0xff313586):Colors.grey,),
                        Text("Profile",style: TextStyle(color: currentTab==4?Color(0xff313586):Colors.grey,),)
                      ],
                    ),
                  ),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}





//Height picker

