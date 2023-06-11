

import 'package:flutter/material.dart';
import 'package:pharm_xl/screens/bmi_screens/input_page.dart';


import 'components/bottom_button.dart';
import 'components/reusable_card.dart';
import 'constants.dart';



var myopacity=1.0;

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage(
      {required this.bmiResult,
        required this.resultText,
        required this.interpretation});




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
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Your Result',
                        style:TextStyle(fontSize: 22,color: Color(0XffDE6739),fontWeight: FontWeight.bold,fontFamily: 'logofont'),
                      ),
                    ),

                    SizedBox(height: 12,),
                    ReusableCard(
                      color:Colors.black12,
                      cardChild: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              resultText,
                              style:TextStyle(fontSize: 22,color: Color(0Xff313586),fontWeight: FontWeight.bold,fontFamily: 'logofont'),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              bmiResult,
                              style:TextStyle(fontSize: 22,color: Color(0XffDE6739),fontWeight: FontWeight.bold,fontFamily: 'logofont'),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              interpretation,
                              textAlign: TextAlign.center,
                              style:TextStyle(fontSize: 22,color: Color(0XffDE6739),fontWeight: FontWeight.bold,fontFamily: 'logofont'),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ), onPress: () {  },
                    ),
                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration: Duration(seconds: 1),
                                pageBuilder: (_, __, ___) => InputPage()));
                      },
                      style: OutlinedButton.styleFrom( //<-- SEE HERE
                          side: BorderSide(width: 1.4),

                          backgroundColor: Color(0xffF8EBEBFF)
                      ),


                      child: Text(' Calculate BMI ',
                        style:TextStyle(fontSize: 17,color: Color(0Xff313586),fontWeight: FontWeight.bold),
                      ),
                      //Icon(Icons.arrow_forward_sharp,color: Color(0Xff313586),),


                    ),
                  ),
                  SizedBox(width: 10.0),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void goToinputPage() {

  }
}