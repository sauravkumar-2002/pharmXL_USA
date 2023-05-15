import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:pharm_xl/screens/Dashboard_Screen.dart';
import 'package:pharm_xl/screens/auth/register_Details_Weight_Screen.dart';











class registerDetailsDisease extends StatefulWidget{






  @override
  State<registerDetailsDisease> createState() => _registerDetailsDiseaseState();
}

class _registerDetailsDiseaseState extends State<registerDetailsDisease> {
//blue --313586
//orange-- DE6739

  var myopacity=0.0;
  var tag=1;
  List<String> tags=[];
  List<String> options=['D1','D2','D3','D4','D5','D6','D7','D8','D9','D1','D2','D3'];










  @override
  void initState() {
    Timer(Duration(milliseconds: 450),(){
      setState(() {
        print(tags.toString());
        myopacity=1.0;
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
                        child: Image.asset('assets/images/logo.png',width: 150,height: 150,)),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 3,bottom: 8),
                    child: Center(
                      child: Text(
                        "Are You Suffering From any Medical condition?",
                        textAlign: TextAlign.center,
                        style:TextStyle(fontSize: 22,color: Color(0Xff313586),fontWeight: FontWeight.bold,),
                  ),
                    ),
                  ),

                  Divider(color: Colors.grey, height: 32),
                  SizedBox(height: 16),
                   ChipsChoice<String>.multiple(
                      value: tags,
                      onChanged: (val)  {
                        setState(() {
                          tags = val;
                          print(tags);
                        });
                        },
                      choiceItems: C2Choice.listFrom<String, String>(
                        source: options,
                        value: (i, v) => v,
                        label: (i, v) => v,
                      ),
                      choiceStyle: C2ChoiceStyle(
                        color: Color(0xFF313586),
                        borderColor: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(0))
                      ),
                     choiceActiveStyle: C2ChoiceStyle(
                         color: Colors.green,
                         borderColor: Colors.green,
                         borderRadius: BorderRadius.all(Radius.circular(0))
                     ),
                      wrapped: true,
                      textDirection: TextDirection.rtl,
                    ),




                  Divider(color: Colors.grey, height: 32),

                  SizedBox(height: 16),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          gotoDashboardScreen();
                        },
                        child:Text('Next',style: TextStyle(fontSize: 24,color: Color(0xff313586),fontWeight: FontWeight.w700),),
                      ),
                      Icon(Icons.navigate_next,color: Color(0xff313586),size: 24),


                    ],
                  ),

                  SizedBox(height: 16),

                  InkWell(
                      onTap: (){
                        gotoDashboardScreen();
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
                          gotoRegisterDetailsWeightScreen();
                        },
                        child:Text('Back',style: TextStyle(fontSize: 20,color: Colors.grey),),
                      ),



                    ],
                  ),








                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void gotoRegisterDetailsWeightScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (_, __, ___) => registerDetailsWeight()));
  }

  void gotoDashboardScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (_, __, ___) => dashboardScreen()));
  }






}





//Height picker

