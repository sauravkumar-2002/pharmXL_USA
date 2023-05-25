import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pharm_xl/screens/auth/register_Details_Height_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Country_Dob.dart';
import 'package:pharm_xl/screens/nav_dashboard/graph_Screen.dart';
import 'package:pharm_xl/screens/nav_dashboard/home_Screen.dart';
import 'package:pharm_xl/screens/nav_dashboard/profile_Screen.dart';
import 'package:pharm_xl/screens/nav_dashboard/settings_Screen.dart';



var currentAgeValue = 3;

class dashboardScreen extends StatefulWidget {


  @override
  State<dashboardScreen> createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
//blue --313586
//orange-- DE6739

  var myopacity = 0.0;


  int currentTab=3;
  final List<Widget> screens=[
    homeScreen(),
    profileScreen(),
    settingsScreen(),
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
                        currentScreen =homeScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.next_plan_outlined,color: currentTab==0?Color(0xff313586):Colors.grey,),
                        Text("Plans",style: TextStyle(color: currentTab==0?Color(0xff313586):Colors.grey,),)
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
                        currentScreen =settingsScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.settings_outlined,color: currentTab==2?Color(0xff313586):Colors.grey,),
                        Text("Settings",style: TextStyle(color: currentTab==2?Color(0xff313586):Colors.grey,),)
                      ],
                    ),
                  ),

                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =profileScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_2_outlined,color: currentTab==1?Color(0xff313586):Colors.grey,),
                        Text("Profile",style: TextStyle(color: currentTab==1?Color(0xff313586):Colors.grey,),)
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

